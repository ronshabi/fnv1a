CC := gcc
CFLAGS := -Wall -g -z noexecstack
AS := nasm
ASFLAGS := -felf64

.PHONY: all clean

all: fnv1a

fnv1a.o: fnv1a.s
	$(AS) $(ASFLAGS) $< -o $@

fnv1a: example.c fnv1a.o
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm *.o
	rm fnv1a