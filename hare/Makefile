HARE = hare
ARCH = riscv64
TARGET = kernel.elf

export HAREPATH = $(PWD)

all: $(TARGET)

$(TARGET): main.ha rt/rt.ha rt/start.s rt/hare.sc
	$(HARE) build -F -R -a $(ARCH) -o $@ .

run: $(TARGET)
	qemu-system-$(ARCH) -machine virt -bios none -kernel $(TARGET) -nographic

clean:
	rm -f $(TARGET)

.PHONY: all run clean