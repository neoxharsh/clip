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
include examples/CMakeFiles/show_image.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/show_image.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/show_image.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/show_image.dir/flags.make

examples/CMakeFiles/show_image.dir/show_image.cpp.o: examples/CMakeFiles/show_image.dir/flags.make
examples/CMakeFiles/show_image.dir/show_image.cpp.o: examples/show_image.cpp
examples/CMakeFiles/show_image.dir/show_image.cpp.o: examples/CMakeFiles/show_image.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/show_image.dir/show_image.cpp.o"
	cd /home/neoha/Documents/PasswordConcealer/dep/clip/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/show_image.dir/show_image.cpp.o -MF CMakeFiles/show_image.dir/show_image.cpp.o.d -o CMakeFiles/show_image.dir/show_image.cpp.o -c /home/neoha/Documents/PasswordConcealer/dep/clip/examples/show_image.cpp

examples/CMakeFiles/show_image.dir/show_image.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/show_image.dir/show_image.cpp.i"
	cd /home/neoha/Documents/PasswordConcealer/dep/clip/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neoha/Documents/PasswordConcealer/dep/clip/examples/show_image.cpp > CMakeFiles/show_image.dir/show_image.cpp.i

examples/CMakeFiles/show_image.dir/show_image.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/show_image.dir/show_image.cpp.s"
	cd /home/neoha/Documents/PasswordConcealer/dep/clip/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neoha/Documents/PasswordConcealer/dep/clip/examples/show_image.cpp -o CMakeFiles/show_image.dir/show_image.cpp.s

# Object files for target show_image
show_image_OBJECTS = \
"CMakeFiles/show_image.dir/show_image.cpp.o"

# External object files for target show_image
show_image_EXTERNAL_OBJECTS =

examples/show_image: examples/CMakeFiles/show_image.dir/show_image.cpp.o
examples/show_image: examples/CMakeFiles/show_image.dir/build.make
examples/show_image: libclip.a
examples/show_image: /usr/lib/aarch64-linux-gnu/libpng.so
examples/show_image: examples/CMakeFiles/show_image.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/neoha/Documents/PasswordConcealer/dep/clip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable show_image"
	cd /home/neoha/Documents/PasswordConcealer/dep/clip/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/show_image.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/show_image.dir/build: examples/show_image
.PHONY : examples/CMakeFiles/show_image.dir/build

examples/CMakeFiles/show_image.dir/clean:
	cd /home/neoha/Documents/PasswordConcealer/dep/clip/examples && $(CMAKE_COMMAND) -P CMakeFiles/show_image.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/show_image.dir/clean

examples/CMakeFiles/show_image.dir/depend:
	cd /home/neoha/Documents/PasswordConcealer/dep/clip && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/neoha/Documents/PasswordConcealer/dep/clip /home/neoha/Documents/PasswordConcealer/dep/clip/examples /home/neoha/Documents/PasswordConcealer/dep/clip /home/neoha/Documents/PasswordConcealer/dep/clip/examples /home/neoha/Documents/PasswordConcealer/dep/clip/examples/CMakeFiles/show_image.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/show_image.dir/depend

