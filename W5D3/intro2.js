function titleize(names, callback) {
  let titleized = names.map( name => `Mx. ${name} Jingleheimer Schmidt`)
  callback(titleized)
}

titleize(['Allen', 'Yong', 'Vu'], (names) => {
  names.forEach( name => console.log(name));
})

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  return console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}


Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  let max = this.tricks.length;
  trickIndex = Math.floor(Math.random() * (max - 0))
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
}

Elephant.prototype.paradeHelper = function(name){
  console.log(`${this.name} is trotting by!`);
}


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// console.log(charlie.paradeHelper());

// herd.forEach( elephant => {
//   console.log(elephant.paradeHelper);
// })

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};

bfast = dinerBreakfast();
bfast('pretzels')
