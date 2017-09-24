ROOT = /home/ngc224/repos/asm

main: main.o deps
	ld -m elf_i386 -o main main.o $(ROOT)/utils/string.o

main.o: main.asm
	nasm -f elf -o main.o main.asm

deps:
	$(MAKE) -C $(ROOT)/utils

clean:
	rm *.o main
