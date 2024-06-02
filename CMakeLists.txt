# Set the minimum required CMake version
cmake_minimum_required(VERSION 3.7)

# Set the project name
set(project_name "asm-chat")

# Define NASM link executable command
set(CMAKE_NASM_LINK_EXECUTABLE "ld <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CAN_USE_ASSEMBLER TRUE)

# Configure NASM options for different platforms
if (APPLE)
    set(CMAKE_ASM_NASM_OBJECT_FORMAT macho64)
    set(CMAKE_ASM_NASM_FLAGS "-DMACOS")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -macosx_version_min 10.13 -no_pie -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib")
endif (APPLE)

if (UNIX AND NOT APPLE)
    set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
endif (UNIX AND NOT APPLE)

if (WIN32)
    set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
endif (WIN32)

# Define the project with NASM as the language
project(${project_name} ASM_NASM)

# Enable NASM language support
enable_language(ASM_NASM)

# Set source files
set(SOURCE_FILES src/chat.asm)

# Set the binary and output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build/bin)

# Create an executable target
add_executable(${project_name} ${SOURCE_FILES})

# Set target properties to use NASM as the linker language
set_target_properties(${project_name} PROPERTIES LINKER_LANGUAGE NASM)

# Link System library on Apple platforms
if (APPLE)
    target_link_libraries(${project_name} System)
endif (APPLE)
