// Throws an error if you define the same thing within the same scope
// Looks like var ignores the block (?)
// let vs var vs const

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log(mysteryScoping1());

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log(mysteryScoping2());

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

/* This throws an error message */
// console.log(mysteryScoping3());

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log(mysteryScoping4());

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  x = 'out of block again';
  console.log(x);
}

// console.log(mysteryScoping5());

//MAD LIB FUNCTION -- Takes in VERB, ADJECTIVE, NOUN
//ALL CAPS??
function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

console.log(madLib('eat', 'delicious', 'food'));

//isSubstring

function isSubstring(searchString, subString) {
  words = searchString.split(" ")

  if (words.includes(subString)) {
    return true;
  }
  return false;
}

// console.log(isSubstring("Jump for joy", "joys"));

//FizzBuzz

function fizzBuzz(array) {
  let result = [];

  for (var i = 0; i < array.length; i++) {
    if (array[i] % 3 ^ array[i] % 5) {
      result.push(array[i]);
    }
  }
  return result;
}

console.log(fizzBuzz([1,2,3,15]));

function isPrime(number) {
  for (i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

// console.log(isPrime(3548563));

function sumOfNPrimes(n) {
  let total = 0;
  let count = 0;

  for (i = 2; count < n; i++) {
    if (isPrime(i)){
      total += i;
      count++;
    }
  }
  return total;
}

// console.log(sumOfNPrimes(4));
