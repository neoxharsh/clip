# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/neoha/Documents/PasswordConcealer/dep/clip

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/neoha/Documents/PasswordConcealer/dep/clip

# Include any dependencies generated for this target.
include CMakeFiles/clip.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/clip.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/clip.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/clip.dir/flags.make

CMakeFiles/clip.dir/clip.cpp.o: CMakeFiles/clip.dir/flags.make
CMakeFiles/clip.dir/clip.cpp.o: clip.cpp
CMakeFiles/clip.dir/clip.cpp.o: CMakeFiles/clip.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/clip.dir/clip.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clip.dir/clip.cpp.o -MF CMakeFiles/clip.dir/clip.cpp.o.d -o CMakeFiles/clip.dir/clip.cpp.o -c /home/neoha/Documents/PasswordConcealer/dep/clip/clip.cpp

CMakeFiles/clip.dir/clip.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clip.dir/clip.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neoha/Documents/PasswordConcealer/dep/clip/clip.cpp > CMakeFiles/clip.dir/clip.cpp.i

CMakeFiles/clip.dir/clip.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clip.dir/clip.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neoha/Documents/PasswordConcealer/dep/clip/clip.cpp -o CMakeFiles/clip.dir/clip.cpp.s

CMakeFiles/clip.dir/image.cpp.o: CMakeFiles/clip.dir/flags.make
CMakeFiles/clip.dir/image.cpp.o: image.cpp
CMakeFiles/clip.dir/image.cpp.o: CMakeFiles/clip.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/clip.dir/image.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clip.dir/image.cpp.o -MF CMakeFiles/clip.dir/image.cpp.o.d -o CMakeFiles/clip.dir/image.cpp.o -c /home/neoha/Documents/PasswordConcealer/dep/clip/image.cpp

CMakeFiles/clip.dir/image.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clip.dir/image.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neoha/Documents/PasswordConcealer/dep/clip/image.cpp > CMakeFiles/clip.dir/image.cpp.i

CMakeFiles/clip.dir/image.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clip.dir/image.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neoha/Documents/PasswordConcealer/dep/clip/image.cpp -o CMakeFiles/clip.dir/image.cpp.s

CMakeFiles/clip.dir/clip_x11.cpp.o: CMakeFiles/clip.dir/flags.make
CMakeFiles/clip.dir/clip_x11.cpp.o: clip_x11.cpp
CMakeFiles/clip.dir/clip_x11.cpp.o: CMakeFiles/clip.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/clip.dir/clip_x11.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clip.dir/clip_x11.cpp.o -MF CMakeFiles/clip.dir/clip_x11.cpp.o.d -o CMakeFiles/clip.dir/clip_x11.cpp.o -c /home/neoha/Documents/PasswordConcealer/dep/clip/clip_x11.cpp

CMakeFiles/clip.dir/clip_x11.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clip.dir/clip_x11.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neoha/Documents/PasswordConcealer/dep/clip/clip_x11.cpp > CMakeFiles/clip.dir/clip_x11.cpp.i

CMakeFiles/clip.dir/clip_x11.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clip.dir/clip_x11.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neoha/Documents/PasswordConcealer/dep/clip/clip_x11.cpp -o CMakeFiles/clip.dir/clip_x11.cpp.s

# Object files for target clip
clip_OBJECTS = \
"CMakeFiles/clip.dir/clip.cpp.o" \
"CMakeFiles/clip.dir/image.cpp.o" \
"CMakeFiles/clip.dir/clip_x11.cpp.o"

# External object files for target clip
clip_EXTERNAL_OBJECTS =

libclip.a: CMakeFiles/clip.dir/clip.cpp.o
libclip.a: CMakeFiles/clip.dir/image.cpp.o
libclip.a: CMakeFiles/clip.dir/clip_x11.cpp.o
libclip.a: CMakeFiles/clip.dir/build.make
libclip.a: CMakeFiles/clip.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libclip.a"
	$(CMAKE_COMMAND) -P CMakeFiles/clip.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clip.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/clip.dir/build: libclip.a
.PHONY : CMakeFiles/clip.dir/build

CMakeFiles/clip.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/clip.dir/cmake_clean.cmake
.PHONY : CMakeFiles/clip.dir/clean

CMakeFiles/clip.dir/depend:
	cd /home/neoha/Documents/PasswordConcealer/dep/clip && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/neoha/Documents/PasswordConcealer/dep/clip /home/neoha/Documents/PasswordConcealer/dep/clip /home/neoha/Documents/PasswordConcealer/dep/clip /home/neoha/Documents/PasswordConcealer/dep/clip /home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles/clip.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/clip.dir/depend

