all:
	nasm -f bin ./boot1.asm -o ./boot1.bin
	dd if=./messsage.txt >> ./boot1.bin
	dd if=/dev/zero bs=512 count=1 >> ./boot1.bin