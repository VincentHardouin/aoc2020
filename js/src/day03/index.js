// --- Day 3: Toboggan Trajectory ---
const fs = require('fs');

function getNumberOfTrees(values, down, right) {
  const TREE = '#';
  let x = 0;
  let count = 0;
  const lineLength = values[0].length;

  for (let i = 0; i < values.length; i = i + down) {
    const line = values[i];
    const isTree = line.charAt(x) === TREE;

    if (isTree) {
      count++;
    }

    x = x + right;
    x = x % lineLength;
  }
  return count;
}

function part1(values) {
  const count = getNumberOfTrees(values, 1, 3);
  console.log('part1', { result: count });
}

function part2(values) {
  const count1 = getNumberOfTrees(values, 1, 1);
  const count2 = getNumberOfTrees(values, 1, 3);
  const count3 = getNumberOfTrees(values, 1, 5);
  const count4 = getNumberOfTrees(values, 1, 7);
  const count5 = getNumberOfTrees(values, 2, 1);
  const result = count1 * count2 * count3 * count4 * count5;
  console.log('part2', { result });
}

async function main() {
  try {
    const inputs = fs.readFileSync(`${__dirname}/input.txt`, 'utf-8');
    const values = inputs.split('\n');

    part1(values);
    part2(values);

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
  getNumberOfTrees,
};
