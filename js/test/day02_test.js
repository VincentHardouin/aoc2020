const chai = require('chai');
const expect = chai.expect;

const { PasswordPolicy } = require('../src/day02');

describe('day02', () => {
  it('should create PasswordPolicy with split input', () => {
    //given
    const input = '1-3 d: azed';

    //when
    const result = new PasswordPolicy(input);

    //then
    expect(result.min).to.equal(1);
    expect(result.max).to.equal(3);
    expect(result.letter).to.equal('d');
    expect(result.password).to.equal('azed');
  });

  it('should return true when password contains the minimum of count', () => {
    //given
    const input = '1-3 d: azed';
    const passwordPolicy = new PasswordPolicy(input);

    //when
    const result = passwordPolicy.checkPasswordPolicy1();

    //then
    expect(result).to.be.true;
  });

  it('should return true when password contains the maximum of count', () => {
    //given
    const input = '1-3 d: azeddd';
    const passwordPolicy = new PasswordPolicy(input);

    //when
    const result = passwordPolicy.checkPasswordPolicy1();

    //then
    expect(result).to.be.true;
  });

  it('should return false when password is not valid', () => {
    //given
    const input = '1-3 b: azed';
    const passwordPolicy = new PasswordPolicy(input);

    //when
    const result = passwordPolicy.checkPasswordPolicy1();

    //then
    expect(result).to.be.false;
  });

  it('should return false when password contains more max letter', () => {
    //given
    const input = '1-3 a: azaeada';
    const passwordPolicy = new PasswordPolicy(input);

    //when
    const result = passwordPolicy.checkPasswordPolicy1();

    //then
    expect(result).to.be.false;
  });

  describe('#checkPasswordPolicy2', () => {
    it('should return true when letter is on first position only', () => {
      //given
      const input = '1-3 d: dzed';
      const passwordPolicy = new PasswordPolicy(input);

      //when
      const result = passwordPolicy.checkPasswordPolicy2();

      //then
      expect(result).to.be.true;
    });

    it('should return true when letter is on last position only', () => {
      //given
      const input = '1-3 d: azdddd';
      const passwordPolicy = new PasswordPolicy(input);

      //when
      const result = passwordPolicy.checkPasswordPolicy2();

      //then
      expect(result).to.be.true;
    });

    it('should return false when letter is in the two positions', () => {
      //given
      const input = '1-3 b: bzbd';
      const passwordPolicy = new PasswordPolicy(input);

      //when
      const result = passwordPolicy.checkPasswordPolicy2();

      //then
      expect(result).to.be.false;
    });

    it('should return false when letter are in any positions', () => {
      //given
      const input = '1-3 a: dzbeada';
      const passwordPolicy = new PasswordPolicy(input);

      //when
      const result = passwordPolicy.checkPasswordPolicy2();

      //then
      expect(result).to.be.false;
    });
  });
});

