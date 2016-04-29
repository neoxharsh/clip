// Clip Library
// Copyright (c) 2015-2016 David Capello

#include "clip.h"
#include "clip/clip_win.h"

#include <cassert>
#include <vector>
#include <windows.h>

namespace clip {

namespace {

unsigned long get_shift_from_mask(unsigned long mask) {
  unsigned long shift = 0;
  for (shift=0; shift<sizeof(unsigned long)*8; ++shift)
    if (mask & (1 << shift))
      return shift;
  return shift;
}

class Hglobal {
public:
  Hglobal() : m_handle(nullptr) {
  }

  explicit Hglobal(HGLOBAL handle) : m_handle(handle) {
  }

  explicit Hglobal(size_t len) : m_handle(GlobalAlloc(GHND, len)) {
  }

  ~Hglobal() {
    if (m_handle)
      GlobalFree(m_handle);
  }

  void release() {
    m_handle = nullptr;
  }

  operator HGLOBAL() {
    return m_handle;
  }

private:
  HGLOBAL m_handle;
};

}

lock::impl::impl(void* hwnd) : m_locked(false) {
  for (int i=0; i<5; ++i) {
    if (OpenClipboard((HWND)hwnd)) {
      m_locked = true;
      break;
    }
    Sleep(20);
  }

  if (!m_locked) {
    error_handler e = get_error_handler();
    if (e)
      e(CannotLock);
  }
}

lock::impl::~impl() {
  if (m_locked)
    CloseClipboard();
}

bool lock::impl::locked() const {
  return m_locked;
}

bool lock::impl::clear() {
  return (EmptyClipboard() ? true: false);
}

bool lock::impl::is_convertible(format f) const {
  if (f == text_format()) {
    return
      (IsClipboardFormatAvailable(CF_TEXT) ||
       IsClipboardFormatAvailable(CF_UNICODETEXT) ||
       IsClipboardFormatAvailable(CF_OEMTEXT));
  }
  else if (f == image_format()) {
    return (IsClipboardFormatAvailable(CF_DIB) ? true: false);
  }
  else if (IsClipboardFormatAvailable(f))
    return true;
  else
    return false;
}

bool lock::impl::set_data(format f, const char* buf, size_t len) {
  bool result = false;

  if (f == text_format()) {
    if (len > 0) {
      int reqsize = MultiByteToWideChar(CP_UTF8, 0, buf, len, NULL, 0);
      if (reqsize > 0) {
        ++reqsize;

        Hglobal hglobal(sizeof(WCHAR)*reqsize);
        LPWSTR lpstr = static_cast<LPWSTR>(GlobalLock(hglobal));
        MultiByteToWideChar(CP_UTF8, 0, buf, len, lpstr, reqsize);
        GlobalUnlock(hglobal);

        if (SetClipboardData(CF_UNICODETEXT, hglobal))
          hglobal.release();
      }
    }
    result = true;
  }
  else {
    Hglobal hglobal(len+sizeof(size_t));
    if (hglobal) {
      size_t* dst = (size_t*)GlobalLock(hglobal);
      if (dst) {
        *dst = len;
        memcpy(dst+1, buf, len);
        GlobalUnlock(hglobal);
        if (SetClipboardData(f, hglobal))
          hglobal.release();
        result = true;
      }
    }
  }

  return result;
}

bool lock::impl::get_data(format f, char* buf, size_t len) const {
  assert(buf);

  if (!buf || !is_convertible(f))
    return false;

  bool result = false;

  if (f == text_format()) {
    if (IsClipboardFormatAvailable(CF_UNICODETEXT)) {
      HGLOBAL hglobal = GetClipboardData(CF_UNICODETEXT);
      if (hglobal) {
        LPWSTR lpstr = static_cast<LPWSTR>(GlobalLock(hglobal));
        if (lpstr) {
          size_t reqsize =
            WideCharToMultiByte(CP_UTF8, 0, lpstr, wcslen(lpstr),
                                NULL, 0, NULL, NULL) + 1;

          assert(reqsize <= len);
          if (reqsize <= len) {
            WideCharToMultiByte(CP_UTF8, 0, lpstr, wcslen(lpstr),
                                buf, reqsize, NULL, NULL);
            result = true;
          }
          GlobalUnlock(hglobal);
        }
      }
    }
    else if (IsClipboardFormatAvailable(CF_TEXT)) {
      HGLOBAL hglobal = GetClipboardData(CF_TEXT);
      if (hglobal) {
        LPSTR lpstr = static_cast<LPSTR>(GlobalLock(hglobal));
        if (lpstr) {
          // TODO check length
          memcpy(buf, lpstr, len);
          result = true;
          GlobalUnlock(hglobal);
        }
      }
    }
  }
  else {
    if (IsClipboardFormatAvailable(f)) {
      HGLOBAL hglobal = GetClipboardData(f);
      if (hglobal) {
        const size_t* ptr = (const size_t*)GlobalLock(hglobal);
        if (ptr) {
          size_t reqsize = *ptr;
          assert(reqsize <= len);
          if (reqsize <= len) {
            memcpy(buf, ptr+1, reqsize);
            result = true;
          }
          GlobalUnlock(hglobal);
        }
      }
    }
  }

  return result;
}

size_t lock::impl::get_data_length(format f) const {
  size_t len = 0;

  if (f == text_format()) {
    if (IsClipboardFormatAvailable(CF_UNICODETEXT)) {
      HGLOBAL hglobal = GetClipboardData(CF_UNICODETEXT);
      if (hglobal) {
        LPWSTR lpstr = static_cast<LPWSTR>(GlobalLock(hglobal));
        if (lpstr) {
          len =
            WideCharToMultiByte(CP_UTF8, 0, lpstr, wcslen(lpstr),
                                NULL, 0, NULL, NULL) + 1;
          GlobalUnlock(hglobal);
        }
      }
    }
    else if (IsClipboardFormatAvailable(CF_TEXT)) {
      HGLOBAL hglobal = GetClipboardData(CF_TEXT);
      if (hglobal) {
        LPSTR lpstr = (LPSTR)GlobalLock(hglobal);
        if (lpstr) {
          len = strlen(lpstr) + 1;
          GlobalUnlock(hglobal);
        }
      }
    }
  }
  // TODO check if it's a registered custom format
  else if (f != empty_format()) {
    if (IsClipboardFormatAvailable(f)) {
      HGLOBAL hglobal = GetClipboardData(f);
      if (hglobal) {
        const size_t* ptr = (const size_t*)GlobalLock(hglobal);
        if (ptr) {
          len = *ptr;
          GlobalUnlock(hglobal);
        }
      }
    }
  }

  return len;
}

bool lock::impl::set_image(const image& image) {
  return false;               // TODO
}

bool lock::impl::get_image(image& output_img) const {
  image_spec spec;
  if (!get_image_spec(spec))
    return false;

  BITMAPINFO* bi = (BITMAPINFO*)GetClipboardData(CF_DIB);
  if (!bi)
    return false;

  if (bi->bmiHeader.biCompression != BI_RGB &&
      bi->bmiHeader.biCompression != BI_BITFIELDS) {
    error_handler e = get_error_handler();
    if (e)
      e(PixelFormatNotSupported);
    return false;
  }

  image img(spec);

  switch (bi->bmiHeader.biBitCount) {

    case 32:
      if (bi->bmiHeader.biCompression == BI_BITFIELDS) {
        char* src = (((char*)bi)+bi->bmiHeader.biSize+sizeof(RGBQUAD)*3);
        for (long y=spec.height-1; y>=0; --y) {
          char* dst = img.data()+y*spec.bytes_per_row;
          std::copy(src, src+spec.bytes_per_row, dst);
          src += spec.bytes_per_row;
        }
      }
      else if (bi->bmiHeader.biCompression == BI_RGB) {
        char* src = (((char*)bi)+bi->bmiHeader.biSize);
        for (long y=spec.height-1; y>=0; --y) {
          char* dst = img.data()+y*spec.bytes_per_row;
          std::copy(src, src+spec.bytes_per_row, dst);
          src += spec.bytes_per_row;
        }
      }
      break;

    case 24: {
      char* src = (((char*)bi)+bi->bmiHeader.biSize);
      for (long y=spec.height-1; y>=0; --y) {
        char* dst = img.data()+y*spec.bytes_per_row;
        std::copy(src, src+spec.bytes_per_row, dst);
        src += spec.bytes_per_row;
      }
      break;
    }

    case 16: {
      char* src = (((char*)bi)+bi->bmiHeader.biSize+sizeof(RGBQUAD)*3);
      for (long y=spec.height-1; y>=0; --y) {
        char* dst = img.data()+y*spec.bytes_per_row;
        std::copy(src, src+spec.bytes_per_row, dst);
        src += spec.bytes_per_row;
      }
      break;
    }

    case 8: {
      int colors = (bi->bmiHeader.biClrUsed > 0 ? bi->bmiHeader.biClrUsed: 256);
      std::vector<uint32_t> palette(colors);
      for (int c=0; c<colors; ++c) {
        palette[c] =
          (bi->bmiColors[c].rgbRed   << spec.red_shift) |
          (bi->bmiColors[c].rgbGreen << spec.green_shift) |
          (bi->bmiColors[c].rgbBlue  << spec.blue_shift);
      }

      char* src = (((char*)bi)+bi->bmiHeader.biSize+sizeof(RGBQUAD)*colors);
      int padding = (4-(spec.width&3))&3;

      for (long y=spec.height-1; y>=0; --y, src+=padding) {
        char* dst = img.data()+y*spec.bytes_per_row;

        for (unsigned long x=0; x<spec.width; ++x, ++src, dst+=3) {
          int idx = *src;
          if (idx < 0)
            idx = 0;
          else if (idx >= colors)
            idx = colors-1;

          *((uint32_t*)dst) = palette[idx];
        }
      }
      break;
    }
  }

  std::swap(output_img, img);
  return true;
}

bool lock::impl::get_image_spec(image_spec& spec) const {
  if (!IsClipboardFormatAvailable(CF_DIB))
    return false;

  BITMAPINFO* bi = (BITMAPINFO*)GetClipboardData(CF_DIB);
  if (!bi)
    return false;

  int w = bi->bmiHeader.biWidth;
  int h = bi->bmiHeader.biHeight;

  memset(&spec, 0, sizeof(spec));
  spec.width = w;
  spec.height = (h >= 0 ? h: -h);
  // We convert indexed to 24bpp RGB images to match the OS X behavior
  spec.bits_per_pixel = bi->bmiHeader.biBitCount;
  if (spec.bits_per_pixel <= 8)
    spec.bits_per_pixel = 24;
  spec.bytes_per_row = w*((spec.bits_per_pixel+7)/8);

  switch (spec.bits_per_pixel) {

    case 32:
      if (bi->bmiHeader.biCompression == BI_BITFIELDS) {
        spec.red_mask   = *((uint32_t*)&bi->bmiColors[0]);
        spec.green_mask = *((uint32_t*)&bi->bmiColors[1]);
        spec.blue_mask  = *((uint32_t*)&bi->bmiColors[2]);
        spec.alpha_mask = 0;
      }
      else if (bi->bmiHeader.biCompression == BI_RGB) {
        spec.red_mask   = 0xff0000;
        spec.green_mask = 0xff00;
        spec.blue_mask  = 0xff;
        spec.alpha_mask = 0xff000000;
      }
      break;

    case 24: {
      int padding = (4-((spec.width*3)&3))&3;
      spec.bytes_per_row += padding;

      spec.red_mask   = 0xff0000;
      spec.green_mask = 0xff00;
      spec.blue_mask  = 0xff;
      break;
    }

    case 16: {
      int padding = ((4-((spec.width*2)&3))&3)/2;
      spec.bytes_per_row += padding;

      spec.red_mask   = *((DWORD*)&bi->bmiColors[0]);
      spec.green_mask = *((DWORD*)&bi->bmiColors[1]);
      spec.blue_mask  = *((DWORD*)&bi->bmiColors[2]);
      spec.alpha_mask = 0;
      break;
    }
  }

  unsigned long* masks = &spec.red_mask;
  unsigned long* shifts = &spec.red_shift;
  for (unsigned long* shift=shifts, *mask=masks; shift<shifts+4; ++shift, ++mask) {
    if (*mask)
      *shift = get_shift_from_mask(*mask);
  }

  return true;
}

format register_format(const std::string& name) {
  int reqsize = 1+MultiByteToWideChar(CP_UTF8, 0,
                                      name.c_str(), name.size(), NULL, 0);
  std::vector<WCHAR> buf(reqsize);
  MultiByteToWideChar(CP_UTF8, 0, name.c_str(), name.size(),
                      &buf[0], reqsize);

  // From MSDN, registered clipboard formats are identified by values
  // in the range 0xC000 through 0xFFFF.
  return (format)RegisterClipboardFormatW(&buf[0]);
}

} // namespace clip