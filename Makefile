.PHONY: all asm clean
all:
	cd arm9; cargo build --release
	cd arm7; cargo build --release
#	ndstool -c test.nds -9 arm9/target/armv5te-none-eabi/release/arm9 -7 arm7/target/thumbv4t-none-eabi/release/arm7
	ndstool -c test.nds -9 arm9/target/thumbv5te-none-eabi/release/arm9 -7 arm7/target/thumbv4t-none-eabi/release/arm7

# this is supposed to give debug symbols that work in NO$GBA, but it doesn't work. 
#debug:
#	cargo build
#	arm-none-eabi-objcopy --only-keep-debug target/thumbv5te-none-eabi/debug/nds-redux-test test.nef
#	arm-none-eabi-objcopy --strip-all target/thumbv5te-none-eabi/debug/nds-redux-test test.elf
#	ndstool -c test.nds -9 test.elf

asm:
	cd arm9; cargo rustc --release -- --emit asm
	cd arm7; cargo rustc --release -- --emit asm

clean:
	cd arm9; cargo clean
	cd arm7; cargo clean
