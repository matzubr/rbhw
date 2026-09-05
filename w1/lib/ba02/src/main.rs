use std::io::{self, Read};

#[allow(unused)]
fn main() {
    // First try, without hints
    // let mut buf: Vec<u8> = vec![];
    // io::stdin().read_to_end(&mut buf).unwrap();
    // from_utf8 - panics on binary input, so went check hints
    // let text = str::from_utf8(&buf).unwrap().split_whitespace().count();
    // let lines_count = buf.iter().filter(|x| **x == 10u8).count();
    // println!("{} {} {}", lines_count, text, buf.len());

    // PDF says to use for loop ?
    let mut buf: Vec<u8> = vec![];
    io::stdin().read_to_end(&mut buf).unwrap();

    let mut words_count: u16 = 0;
    let mut lines_count: u16 = 0;
    let mut in_word: bool = false;
    for byte in &buf {
        if byte.is_ascii_whitespace() {
            in_word = false;
            if *byte == b'\n' {
                lines_count += 1;
            }
        } else {
            if !in_word {
                in_word = true;
                words_count += 1;
            }
        }
    }
    println!("{} {} {}", lines_count, words_count, buf.len());
}
