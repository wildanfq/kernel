fn as_bytes(p: *opaque) *[*]u8 = {
	return p: *[*]u8;
};

export fn memcpy(dest: *opaque, src: *const opaque, n: size) void = {
	let d = as_bytes(dest);
	let s = as_bytes(src: *opaque);
	for (let i = 0z; i < n; i += 1) {
		d[i] = s[i];
	};
};

export fn memmove(dest: *opaque, src: *const opaque, n: size) void = {
	let d = as_bytes(dest);
	let s = as_bytes(src: *opaque);
	if ((d: uintptr) < (s: uintptr)) {
		for (let i = 0z; i < n; i += 1) {
			d[i] = s[i];
		};
	} else {
		for (let i = n; i > 0; i -= 1) {
			d[i - 1] = s[i - 1];
		};
	};
};

export fn memset(dest: *opaque, val: u8, n: size) void = {
	let d = as_bytes(dest);
	for (let i = 0z; i < n; i += 1) {
		d[i] = val;
	};
};

type string = struct {
	data: *[*]u8,
	length: size,
	capacity: size,
};

export fn strcmp(_a: str, _b: str) bool = {
	if (len(_a) != len(_b)) {
		return false;
	};
	let a = (&_a: *string).data, b = (&_b: *string).data;
	for (let i = 0z; i < len(_a); i += 1) {
		if (a[i] != b[i]) {
			return false;
		};
	};
	return true;
};

export @symbol("rt.abort") fn _abort(
	path: *str,
	line: u64,
	col: u64,
	msg: str,
) never = {
	for (true) { void; };
};

export fn abort_fixed(path: *str, line: u64, col: u64, i: u64) void = {
	for (true) { void; };
};