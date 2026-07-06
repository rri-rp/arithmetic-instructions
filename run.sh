#!/bin/bash
set -e

programs=(equation1 equation2 equation3 equation4)

for program in "${programs[@]}"; do
    echo "Assembling $program.asm"
    nasm -f elf64 -g -F dwarf "$program.asm" -o "$program.o"

    echo "Linking $program.o"
    ld "$program.o" -o "$program"

    echo "Running ./$program"
    ./$program
    echo "$program completed. Use GDB to inspect result."
    echo
done

echo "All programs completed. See expected_results.txt for expected result values."
