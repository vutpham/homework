// Two ways to name a function:
// 1. Assign to a variable
// 2. Attach name to function


// Monkey patching
Array.prototype.uniq = function(){
  let uniq = [];
  let i = 0;

  console.log(this);

  while (i < this.length) {
    if (!uniq.includes(this[i])){
      uniq.push(this[i]);
    }
    i++;
  }

  return uniq;
};

Array.prototype.twoSum = function() {
  let result = [];
  // let i = 0;
  //
  // while (i < this.length - 1) {
  //   let j = i + 1;
  //
  //   while (j < this.length) {
  //     console.log(i, j, this[i], this[j]);
  //     let sum = this[i] + this[j];
  //
  //     if (sum === 0) {
  //       result.push([i, j]);
  //       console.log([i, j]);
  //     }
  //     j++;
  //   }
  //   i++;
  // }

  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }

  return result;
};

Array.prototype.transpose = function() {
  let length = this.length;
  let result = [];

  for (let i = 0; i < length; i++) {
    result.push([]);
  }

  // the subarray index
  for (let i = 0; i < length; i++){
    // the sub-arrays
    for (let j = 0; j < length; j++) {
      result[j].push(this[i][j]);
    }

  }
  return result;
};
