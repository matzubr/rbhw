#[allow(unused)]
use std::env::args;

// #[allow(unused)]
// fn sort(array: Vec<String>) {
//     todo!()
// }

fn main() {
    // First attempt
    let mut res = Vec::new();
    for arg in args().skip(1) {
        res.push(arg);
    }

    if res.is_empty() {
        print!("");
    } else {
        res.sort();
        println!("{}", res.join("\n"));
    }
}

// #[cfg(test)]
// mod test {
//     #[test]
//     fn empty() {
//         assert_eq!(1, 1);
//         assert_eq!(2, 2);
//     }
// }
