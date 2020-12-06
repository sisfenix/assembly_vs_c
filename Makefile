.PHONY: all clean cleanall

all: cleanall asm c c_static clean

clean:
	rm -f *.out *.o 

cleanall: clean
	rm -f hello_c hello_asm hello_static_c

asm: cleanall
	nasm -f elf32 hello_asm.asm
	ld -m elf_i386 -o hello_asm hello_asm.o

c_static: cleanall
	gcc -m32 -static -o hello_static_c hello_c.c 

c: cleanall
	gcc -m32 -o hello_c hello_c.c 

#make git m="your message"
git:
	git add .
	git commit -m "$m"
	git push -u origin master
