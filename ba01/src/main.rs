use std::io::{self, Read};

fn main() {
    // panics if stream did not containt valid UTF 8
    // let mut buf = String::new();
    // io::stdin().read_to_string(&mut buf).unwrap();
    // println!("{}", buf.len());

    let mut buf: Vec<u8> = vec![];
    io::stdin().read_to_end(&mut buf).unwrap();
    println!("{}", buf.len());
}
