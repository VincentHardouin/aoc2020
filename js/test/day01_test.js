const chai = require('chai');
const expect = chai.expect;

const { findPossibility, getAllPossibilities, getCandidateMultiplication, Possibility } = require('../src/day01');

describe('day01', () => {

  it('should return array of all possibilities', () => {
    // given
    const values = [1721, 979, 366, 299, 675, 1456];

    // when
    const result = getAllPossibilities(values);

    // then
    expect(result).to.be.instanceOf(Array);
    expect(result[0]).to.be.instanceOf(Possibility);
  });

  it('should return possibility with the sum 2020', () => {
    //given
    const values = [1721, 979, 366, 299, 675, 1456];
    const possibilities = getAllPossibilities(values);
    const sum = 2020;

    //when
    const result = findPossibility(possibilities, sum);

    //then
    expect(result.getSum()).to.equal(sum);
    expect(result).to.be.instanceOf(Possibility);
  });

  it('should return multiplication of possibility numbers', () => {
    // given
    const possibility = new Possibility([2, 3]);

    // when
    const result = possibility.getMultiplication();

    // then
    expect(result).to.equal(6);
  });

  it('should return multiplication of candidate', () => {
    //given
    const values = [1721, 979, 366, 299, 675, 1456];
    const sum = 2020;

    //when
    const result = getCandidateMultiplication(values, sum);

    //then
    expect(result).to.equal(514579);
  });
});

