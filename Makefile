ASM = nasm
LD = ld
ASMFLAGS = -f elf64 -g -F dwarf
PROGRAMS = equation1 equation2 equation3 equation4
OBJECTS = $(PROGRAMS:%=%.o)

.SECONDARY: $(OBJECTS)

all: $(PROGRAMS)

%: %.o
	$(LD) $< -o $@

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

run: all
	@for program in $(PROGRAMS); do \
		echo "Running ./$$program"; \
		./$$program; \
		echo "$$program completed. Use GDB to inspect result."; \
		echo; \
	done

debug-%: %
	gdb ./$*

clean:
	rm -f *.o $(PROGRAMS)

.PHONY: all run clean
