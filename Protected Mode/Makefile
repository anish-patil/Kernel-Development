FILES = ./build/kernel.asm.o

#dev/zero to fill the complete kernel with null bytes of 10 sectors (51200 bytes) to adjust and as it appends after bootloader
all: ./bin/boot1.bin ./bin/kernel.bin  
	rm -rf ./bin/os.bin
	dd if=./bin/boot1.bin >> ./bin/os.bin
	dd if=./bin/kernel.bin >> ./bin/os.bin
	dd if=/dev/zero	bs=512 count=100 >> ./bin/os.bin
./bin/kernel.bin: $(FILES)
	i686-elf-ld -g -relocatable $(FILES) -o ./build/kernelfull.o
	i686-elf-gcc -T ./src/linker.ld -o ./bin/kernel.bin -ffreestanding -O0 -nostdlib ./build/kernelfull.o

./bin/boot1.bin: ./src/boot/boot1.asm 
	nasm -f bin ./src/boot/boot1.asm -o ./bin/boot1.bin

./build/kernel.asm.o: ./src/kernel.asm
	nasm -f elf -g ./src/kernel.asm -o ./build/kernel.asm.o
clean:
	rm -rf ./bin/boot1.bin
