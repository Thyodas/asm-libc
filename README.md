# minilibc

A minimal C standard library implementation written entirely in x86_64 assembly language using NASM.

## Overview

This project implements 15 core C library functions in x86_64 assembly, providing a deep dive into low-level system programming and processor architecture. All functions maintain compatibility with the standard C library interface while being optimized for performance at the assembly level.

## Implemented Functions

### Memory Operations
- **`memcpy`** - Copy memory area
- **`memmove`** - Copy memory area (handles overlapping regions)
- **`memset`** - Fill memory with a constant byte
- **`memfrob`** - Frobnicate (XOR) memory area

### String Operations
- **`strlen`** - Calculate string length
- **`strchr`** - Locate character in string
- **`strrchr`** - Locate last occurrence of character in string
- **`strstr`** - Locate substring
- **`strcmp`** - Compare two strings
- **`strncmp`** - Compare first n characters of two strings
- **`strcasecmp`** - Case-insensitive string comparison
- **`strcspn`** - Get length of complementary substring
- **`strpbrk`** - Search string for any of a set of characters
- **`strfry`** - Randomize string contents

### Bit Operations
- **`ffs`** - Find first set bit

## Architecture & Technical Details

- **Target**: x86_64 (64-bit) with NASM assembler
- **Calling Convention**: System V AMD64 ABI (rdi, rsi, rdx, rcx for first 4 args)
- **Register Management**: Preserves callee-saved registers (rbx, rbp, r12-r15)
- **Output Format**: ELF64 shared library with position-independent code
- **Optimization**: Hand-tuned assembly with efficient memory access patterns

## Building

```bash
make          # Build libasm.so
make clean    # Remove object files
make fclean   # Remove all build artifacts
make re       # Rebuild from scratch
```

## Usage Example

```c
#include <stdio.h>
#include <dlfcn.h>

int main() {
    // Dynamic loading example
    void *lib = dlopen("./libasm.so", RTLD_LAZY);
    if (!lib) {
        fprintf(stderr, "Cannot load library: %s\n", dlerror());
        return 1;
    }
    
    // Get function pointers
    size_t (*my_strlen)(const char*) = dlsym(lib, "strlen");
    int (*my_strcmp)(const char*, const char*) = dlsym(lib, "strcmp");
    
    // Use the functions
    char *str = "Hello, World!";
    printf("Length: %zu\n", my_strlen(str));
    printf("Comparison: %d\n", my_strcmp(str, "Hello, World!"));
    
    dlclose(lib);
    return 0;
}
```

Or link directly:
```bash
gcc your_program.c -L. -lasm -o your_program
```

## Project Structure

```
minilibc/
├── Makefile
├── README.md
└── src/
    ├── ffs.asm, memcpy.asm, memfrob.asm, memmove.asm, memset.asm
    ├── strcasecmp.asm, strchr.asm, strcmp.asm, strcspn.asm
    ├── strfry.asm, strlen.asm, strncmp.asm, strpbrk.asm
    ├── strrchr.asm, strstr.asm
```

## Requirements

- **NASM** (Netwide Assembler)
- **GNU ld** (linker) 
- **x86_64** processor
- **Linux/Unix** environment

## Author

**Guillaume HEIN** - [@Thyodas](https://github.com/Thyodas) | hein.guillaume@gmail.com
