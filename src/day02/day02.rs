use std::fs;
use regex::Regex;

pub fn day02() -> String {
    let policies = read_data();
    let total_valid = policies
        .iter()
        .filter( |p | p.is_valid_at_sled())
        .count();
    total_valid.to_string()
}

pub fn day02_part2() -> String {
    let policies = read_data();
    let total_valid = policies
        .iter()
        .filter( |p | p.is_valid_at_toboggan())
        .count();
    total_valid.to_string()
}

#[derive(Debug)]
pub struct PasswordPolicy {
    pub min: usize,
    pub max: usize,
    pub letter: String,
    pub password: String,
}

const REGEX: &str = r"^(\d+)-(\d+) (.): (.*)$";

impl PasswordPolicy {
    pub fn new(s: &str, re: &Regex) -> Option<Self> {
        let matches = re.captures(s)?;
        let min = matches.get(1).and_then(|s|s.as_str().parse::<usize>().ok())?;
        let max = matches.get(2).and_then(|s|s.as_str().parse::<usize>().ok())?;
        let letter = matches.get(3)?.as_str().to_string();
        let password = matches.get(4)?.as_str().to_string();
        Some(Self { min, max, letter, password})
    }

    pub fn is_valid_at_sled(&self) -> bool {
        let count = self.password.matches(&self.letter).count();
        count >= self.min && count <= self.max
    }

    pub fn is_valid_at_toboggan(&self) -> bool {
        if self.password.len() < self.min.max(self.max) { return false }
        let letter = self.letter.as_bytes()[0] as char;
        let password_chars = self.password.chars().collect::<Vec<char>>();
        let first = &password_chars[self.min - 1] == &letter;
        let second = &password_chars[self.max - 1] == &letter;
        first ^ second
    }
}

fn read_data() -> Vec<PasswordPolicy> {
    let values = fs::read_to_string("src/day02/day02.txt").expect("Could not load file");
    let regex = Regex::new(REGEX).unwrap();
    values
        .split("\n")
        .filter_map(|s| PasswordPolicy::new(s, &regex))
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_password_policy() {
        // given
        let password_string = "1-2 k: kkkkhkkkkkkkkkk";
        let regex = Regex::new(REGEX).unwrap();
        // when
        let result = PasswordPolicy::new(password_string, &regex).unwrap();

        // then
        assert_eq!(result.min, 1);
        assert_eq!(result.max, 2);
        assert_eq!(result.letter, "k");
        assert_eq!(result.password, "kkkkhkkkkkkkkkk");
    }

    #[test]
    fn test_password_policy2() {
        // given
        let password_string = "1-5 k: kkkkhkkkkkkkkkk";
        let regex = Regex::new(REGEX).unwrap();
        let password_policy = PasswordPolicy::new(password_string, &regex).unwrap();

        // when
        let result = password_policy.is_valid_at_toboggan();

        // then
       assert_eq!(result, true);
    }

    #[test]
    fn test_day02() {
        assert_eq!(day02(), "519");
    }

    #[test]
    fn test_day02_part2() {
        assert_eq!(day02_part2(), "708");
    }
}