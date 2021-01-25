const chai = require('chai');
const expect = chai.expect;

const { getNumberOfTrees } = require('../src/day03');

describe('day03', () => {
  const values = [
    '..##.......',
    '#...#...#..',
    '.#....#..#.',
    '..#.#...#.#',
    '.#...##..#.',
    '..#.##.....',
    '.#.#.#....#',
    '.#........#',
    '#.##...#...',
    '#...##....#',
    '.#..#...#.#',
  ];

  const tests = [
    { down: 1, right: 3, result: 7 },
    { down: 1, right: 1, result: 2 },
    { down: 1, right: 5, result: 3 },
    { down: 1, right: 7, result: 4 },
    { down: 2, right: 1, result: 2 },
  ];

  tests.forEach((test) => {
    it(`should return ${test.result} when down = ${test.down} and right = ${test.right}`, () => {
      //when
      const result = getNumberOfTrees(values, test.down, test.right);

      //then
      expect(result).to.equal(test.result);
    });
  });
});

