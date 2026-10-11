def UART0_BASE: uintptr = 0x10000000;
def UART_THR: *u8 = (UART0_BASE: *u8);

fn putc(c: u8) void = {
	*UART_THR = c;
};

fn puts(s: *const u8) void = {
	let bytes = s: *[*]u8;
	let i = 0;
	for (true) {
		let ch = bytes[i];
		if (ch == 0) break;
		putc(ch);
		i += 1;
	};
};

const HELLO: [_]u8 = [
	'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd',
	'\r', '\n', 0,
];

export fn kmain() void = {
	puts(&HELLO[0]);
	for (true) { void; };
};