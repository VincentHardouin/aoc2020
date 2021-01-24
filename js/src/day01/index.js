// --- Day 1: Report Repair ---
//     Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input);
//     apparently, something isn't quite adding up.
// Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
//     For example, suppose your expense report contained the following:
// 1721
// 979
// 366
// 299
// 675
// 1456
// In this list, the two entries that sum to 2020 are 1721 and 299.
// Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.
//
// Of course, your expense report is much larger. Find the two entries that sum to 2020;
// what do you get if you multiply them together?

const fs = require('fs');
const _ = require('lodash');

class Possibility {
  constructor(numbers) {
    this.numbers = numbers;
  }

  getSum() {
    return _.sum(this.numbers);
  }

  getMultiplication() {
    return _.reduce(this.numbers, (mul, n) => {
      return mul * n;
    }, 1);
  }
}

function getAllPossibilities(values) {
  const possibilities = [];
  _.forEach(values, (number1) => {
    _.forEach(values, (number2) => {
      _.forEach(values, (number3) => {
        possibilities.push(new Possibility([number1, number2, number3]));
      });
    });
  });
  return possibilities;
}

function findPossibility(possibilities, sum) {
  return _.find(possibilities, (possibility) => possibility.getSum() === sum);
}

function getCandidateMultiplication(values, sum) {
  const possibilities = getAllPossibilities(values);
  const candidate = findPossibility(possibilities, sum);
  return candidate.getMultiplication();
}

async function main() {
  try {
    const inputs = fs.readFileSync(`${__dirname}/input.txt`, 'utf-8');
    const values = inputs.split('\n').map((n) => parseInt(n));
    console.log({ result: getCandidateMultiplication(values, 2020) });
  } catch (error) {
    console.error('\n', error);
    process.exit(1);
  }
}

if (require.main === module) {
  main().then(
    () => process.exit(0),
    (err) => {
      console.error(err);
      process.exit(1);
    },
  );
}

module.exports = {
  findPossibility,
  getAllPossibilities,
  getCandidateMultiplication,
  Possibility,
};
