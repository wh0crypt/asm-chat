# asm-chat -  Simple Chat Service made in x86 Assembly

This project has been made with the sole purpose of teaching the fundamentals of [*POSIX* system calls](https://www.unix.com/man-page/posix/2/syscalls/) from a low-level perspective.
It also aims to provide a comparison of these calls compared with their counterparts in a medium/high-level language such as [*C*](https://en.wikipedia.org/wiki/C_(programming_language)).
<br><br>
The project covers a range of [*POSIX* system calls](https://www.unix.com/man-page/posix/2/syscalls/), providing insights into their usage and behavior at the lowest level of abstraction. By comparing these implementations with their counterparts in [*C*](https://en.wikipedia.org/wiki/C_(programming_language)), the project offers a comprehensive understanding of how system calls function across different levels of abstraction.
<br><br>
The main idea behind this project was planned with the intention of publication in the [*Paged Out!*](https://pagedout.institute/) technical magazine. It is designed to appeal
to readers interested in systems programming, low-level development, and understanding the inner workings of [operating systems](https://en.wikipedia.org/wiki/Operating_system).


## Compilation

In order to compile and execute this project, you need to have the `nasm` assembler installed. We will cover 2 compiling options:

### Compile manually

1. **Assemble the program file**:
Use [NASM (Netwide Assembler)](https://www.nasm.us/) to convert the assembly code into an object file. Depending on your system and desired output format, you might need to specify the format. Use `nasm -h` for checking available formats:<br>
```bash
mkdir -p build/{bin,obj}  # Create the directories
```
```bash
nasm -f <format> ./src/chat.asm -o ./build/obj/asm-chat.o
```

2. **Link the object file to create an executable:**
Use the linker (typically `ld` on [Unix](https://en.wikipedia.org/wiki/Unix)-like systems) to link the object file and produce the final executable:<br>
```bash
ld ./build/obj/asm-chat.o -o ./build/bin/asm-chat
```

3. **Run the executable:**<br>
```bash
./build/bin/asm-chat
```


### Compile with CMake

1. **Build the project**:
Use [Make](https://en.wikipedia.org/wiki/Make_(software)) to build the project automatically:<br>
```bash
make build
```

2. **Run the executable:**<br>
```bash
make runonly
```
Or
```bash
./build/bin/asm-chat
```


### I don't want to compile it

Alternatively, you can download the compiled binary directly from *Releases*.


## Sources

<a id="1">[1]</a>
x86 Assembly/Interfacing with Linux - Wikibooks. [[Consulted on June 2, 2024](https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux)]<br>
<a id="2">[2]</a>
syscalls(2) [posix man page] - unix.com. [[Consulted on June 2, 2024](https://www.unix.com/man-page/posix/2/syscalls/)]<br>
<a id="3">[3]</a>
NASM - The Netwide Assembler v.2.16.03. [[Consulted on June 2, 2024](https://www.nasm.us/xdoc/2.16.03/html/nasmdoci.html)]<br>
<a id="4">[4]</a>
CMake NASM Test - Andy Stanton. [[Consulted on June 2, 2024](https://github.com/andystanton/cmake-nasm-test)]