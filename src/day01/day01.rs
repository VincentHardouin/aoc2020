use std::io::{BufReader, BufRead};
use std::fs::File;

pub fn day01(buf_reader: BufReader<File>, sum: i32) -> i32 {
    let mut vec = Vec::new();

    for line in buf_reader.lines() {
        let line = line.unwrap();
        vec.push(line.parse::<i32>().unwrap());
    }
    let mut result = 0;
    for i in &vec {
        for n in &vec {
            if i + n == sum {
                result = i*n;
                break;
            }
        }
    }

    return result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_day01() {
        // given
        let file = File::open("src/day01/day01_test.txt").unwrap();
        let buf_reader = BufReader::new(file);

        // when
        let result = day01(buf_reader, 2020);

        // then
        assert_eq!(result, 1010*1010)
    }
}