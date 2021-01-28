use std::fs;

pub fn day03_part1() -> i32 {
    let values = read_data();
    get_tree_count(values)
}

pub fn day03_part2() -> String {
    unimplemented!()
}

fn get_tree_count(values: Vec<String>) -> i32 {
    let mut trees = 0;
    let mut x = 0;
    for line in values {
        let letter = line.chars().nth(x+1).expect("Could not get char");
        if is_tree(letter) {
            trees += 1;
        }
        x += 3;
        x %= line.len();
    }
    trees
}

fn is_tree(c: char) -> bool {
    let tree = '#';
    c == tree
}

fn read_data() -> Vec<String> {
    let values = fs::read_to_string("src/day03/day03.txt").expect("Could not load file");
    values
        .split("\n")
        .map(|s: &str| s.to_string())
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_read_data() {
        // when
        let result = read_data();

        // then
        assert_eq!(result.len(), 323);
    }

    #[test]
    fn test_get_tree_count() {
        // given
        let values = read_data();

        // when
        let result = get_tree_count(values);

        // then
        assert_eq!(result,232)
    }
}