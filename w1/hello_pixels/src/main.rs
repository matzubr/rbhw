#[allow(unused)]
pub fn parse_bitmap_8x8(lines: [&str; 8]) -> [u8; 8] {
    let mut buf = [0u8; 8];
    for (i, s) in lines.into_iter().enumerate() {
        let mut byte = 0u8;
        for c in s.chars() {
            let bit = if c == '.' { 0u8 } else { 1u8 };
            byte = (byte << 1) | bit;
        }
        buf[i] = byte
    }
    buf
}

#[allow(unused)]
pub fn render_bitmap_8x8(bytes: [u8; 8]) -> [String; 8] {
    let mut buf: [String; 8] = Default::default();
    for (i, mut b) in bytes.into_iter().enumerate() {
        let mut line = String::with_capacity(8);
        for _ in 0..=7 {
            let c = if (b & 0b1000_0000) == 0 { '.' } else { '#' };
            line.push(c);
            b <<= 1;
        }
        buf[i] = line;
    }
    buf
}

pub fn invert_bitmap_8x8(bytes: [u8; 8]) -> [u8; 8] {
    // let mut buf = [0u8; 8];
    // for (i, b) in bytes.into_iter().enumerate() {
    //     buf[i] = !b;
    // }
    // buf
    bytes.map(|b| !b)
}

fn main() {
    #[rustfmt::skip]
    let image = [
        "..####..",
        ".#....#.",
        "#.#..#.#",
        "#..##..#",
        "#......#",
        "#.#..#.#",
        ".#....#.",
        "..####..",
    ];
    let bytes = parse_bitmap_8x8(image);

    println!("Bytes:");
    for byte in bytes {
        println!("{byte:08b} 0x{byte:02X}");
    }

    println!("");
    println!("Rendered:");

    for line in render_bitmap_8x8(bytes) {
        println!("{line}");
    }

    println!("");
    println!("Inverted:");

    for line in render_bitmap_8x8(invert_bitmap_8x8(bytes)) {
        println!("{line}");
    }
}
