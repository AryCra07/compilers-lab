# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/arycra07/Desktop/complier-lab/lex-parser

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arycra07/Desktop/complier-lab/lex-parser/build

# Include any dependencies generated for this target.
include CMakeFiles/LexParser.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/LexParser.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/LexParser.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LexParser.dir/flags.make

CMakeFiles/LexParser.dir/src/LexParser.cpp.o: CMakeFiles/LexParser.dir/flags.make
CMakeFiles/LexParser.dir/src/LexParser.cpp.o: ../src/LexParser.cpp
CMakeFiles/LexParser.dir/src/LexParser.cpp.o: CMakeFiles/LexParser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arycra07/Desktop/complier-lab/lex-parser/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LexParser.dir/src/LexParser.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LexParser.dir/src/LexParser.cpp.o -MF CMakeFiles/LexParser.dir/src/LexParser.cpp.o.d -o CMakeFiles/LexParser.dir/src/LexParser.cpp.o -c /home/arycra07/Desktop/complier-lab/lex-parser/src/LexParser.cpp

CMakeFiles/LexParser.dir/src/LexParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LexParser.dir/src/LexParser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arycra07/Desktop/complier-lab/lex-parser/src/LexParser.cpp > CMakeFiles/LexParser.dir/src/LexParser.cpp.i

CMakeFiles/LexParser.dir/src/LexParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LexParser.dir/src/LexParser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arycra07/Desktop/complier-lab/lex-parser/src/LexParser.cpp -o CMakeFiles/LexParser.dir/src/LexParser.cpp.s

CMakeFiles/LexParser.dir/src/parser.cpp.o: CMakeFiles/LexParser.dir/flags.make
CMakeFiles/LexParser.dir/src/parser.cpp.o: ../src/parser.cpp
CMakeFiles/LexParser.dir/src/parser.cpp.o: CMakeFiles/LexParser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arycra07/Desktop/complier-lab/lex-parser/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/LexParser.dir/src/parser.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LexParser.dir/src/parser.cpp.o -MF CMakeFiles/LexParser.dir/src/parser.cpp.o.d -o CMakeFiles/LexParser.dir/src/parser.cpp.o -c /home/arycra07/Desktop/complier-lab/lex-parser/src/parser.cpp

CMakeFiles/LexParser.dir/src/parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LexParser.dir/src/parser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arycra07/Desktop/complier-lab/lex-parser/src/parser.cpp > CMakeFiles/LexParser.dir/src/parser.cpp.i

CMakeFiles/LexParser.dir/src/parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LexParser.dir/src/parser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arycra07/Desktop/complier-lab/lex-parser/src/parser.cpp -o CMakeFiles/LexParser.dir/src/parser.cpp.s

# Object files for target LexParser
LexParser_OBJECTS = \
"CMakeFiles/LexParser.dir/src/LexParser.cpp.o" \
"CMakeFiles/LexParser.dir/src/parser.cpp.o"

# External object files for target LexParser
LexParser_EXTERNAL_OBJECTS =

LexParser: CMakeFiles/LexParser.dir/src/LexParser.cpp.o
LexParser: CMakeFiles/LexParser.dir/src/parser.cpp.o
LexParser: CMakeFiles/LexParser.dir/build.make
LexParser: CMakeFiles/LexParser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arycra07/Desktop/complier-lab/lex-parser/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable LexParser"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LexParser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LexParser.dir/build: LexParser
.PHONY : CMakeFiles/LexParser.dir/build

CMakeFiles/LexParser.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LexParser.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LexParser.dir/clean

CMakeFiles/LexParser.dir/depend:
	cd /home/arycra07/Desktop/complier-lab/lex-parser/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arycra07/Desktop/complier-lab/lex-parser /home/arycra07/Desktop/complier-lab/lex-parser /home/arycra07/Desktop/complier-lab/lex-parser/build /home/arycra07/Desktop/complier-lab/lex-parser/build /home/arycra07/Desktop/complier-lab/lex-parser/build/CMakeFiles/LexParser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LexParser.dir/depend

