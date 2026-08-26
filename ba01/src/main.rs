use std::io::{self, Read};

fn main() {
    // let mut buf = String::new();
    // panics if stream did not containt valid UTF 8
    // io::stdin().read_to_string(&mut buf).unwrap();
    // println!("{}", buf.len());

    let mut buf: Vec<u8> = vec![];
    io::stdin().read_to_end(&mut buf).unwrap();
    println!("{}", buf.len());
}
