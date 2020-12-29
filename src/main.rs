mod day01;
mod day02;
mod day03;

use std::fs::File;
use std::io::{BufReader};

fn main() {
    let file = File::open("day01/day01_test.txt").unwrap();
    let buf_reader = BufReader::new(file);
    let result = day01::day01::day01(buf_reader, 2020);
    println!("{}", result);
}