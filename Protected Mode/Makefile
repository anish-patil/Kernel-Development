FILES = ./build/kernel.asm.o

#dev/zero to fill the complete kernel with null bytes of 10 sectors (51200 bytes) to adjust and as it appends after bootloader
all: ./bin/boot1.bin ./bin/kernel.bin  
	rm -rf ./bin/os.bin
	dd if=./bin/boot1.bin >> ./bin/os.bin
	dd if=./bin/kernel.bin >> ./bin/os.bin
	dd if=/dev/zero	bs=512 count=100 >> ./bin/os.bin
#i686- refers to x86 architecture of pentium gen
#elf- refers to executable and linkable file
./bin/kernel.bin: $(FILES)
#the entire command is linking the input object files specified by $(FILES) to create a relocatable object file named kernelfull.o in the ./build directory. 
#The -g flag ensures debugging information is included in the output file, which can be helpful for debugging purposes.
	i686-elf-ld -g -relocatable $(FILES) -o ./build/kernelfull.o
#compiles and links the kernel code using the GCC compiler. It specifies the linker script for memory layout, turns off optimizations, 
#indicates that the code is meant to run in a freestanding environment, and ensures that no standard libraries are used. The result is an output file named kernel.bin 
	i686-elf-gcc -T ./src/linker.ld -o ./bin/kernel.bin -ffreestanding -O0 -nostdlib ./build/kernelfull.o

./bin/boot1.bin: ./src/boot/boot1.asm 
	nasm -f bin ./src/boot/boot1.asm -o ./bin/boot1.bin

./build/kernel.asm.o: ./src/kernel.asm
	nasm -f elf -g ./src/kernel.asm -o ./build/kernel.asm.o
clean:
	rm -rf ./bin/boot1.bin
	rm -rf ./bin/kernel.bin
	rm -rf ./bin/os.bin
	rm -rf $(FILES)
	rm -rf ./build/kernelfull.o