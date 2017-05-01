// function fizzBuzz(array) {
//   let result = []
// array.forEach(function(el, i, arr) {
//   if (el % 15 === 0)
//     result
//   else if (el % 5 === 0 || el % 3 === 0)
//     result.push(el)
// }
// )
// return result
// }
//
//
// function isPrime(num) {
//   if (num < 2) {return false;}
//
//     for (i = 2, i < num, i ++) {
//       if (num % i === 0) {
//       return false;
//       }
//
//     }
//     return true;
// }
//
// function sumOfNPrimes (n) {
//   let sum = 0;
//   let countPrimes = 0;
//   let i = 2;
//
//   while (countPrimes < n) {
//     if (isPrime(i)) {
//     sum += i;
//     countPrimes++;
//     }
//     i++;
//   }
//   return sum;
// }
//
// function titleize(names, callback) {
//   let titleized = names.map(function(name){
//     `Mx. ${name} Jingleheimer Schmidt`
//   });
//   callback(titleized);
// }
//
//
// function elephant(name, height, tricks){
//   this.name = name
//   this.height = height
//   this.tricks = tricks
// }
//
// elephant.prototype.trumpet = function() {
//   console.log(`${this.name} the elephant goes ....`
//   )};
//
// elephant.prototype.grow = function() {
//   this.height += 12
// };
//
//
// elephant.prototype.addTrick = function(trick) {
//   this.tricks.push(trick)
// };
//
// elephant.prototype.play = function() {
//   console.log(`${this.name} is ${this.tricks[0]}`)
// };
//
// elephant.paradeHelper = function(elephant, index, arr) {
//   console.log(`here comes ${elephant.name}`);
// };
//
//
// let ellie = new elephant("Name1", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new elephant("Name2", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new elephant("Name3", 234, ["writing letters", "stealing peanuts"]);
// let micah = new elephant("Name4", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);
//
// let herd = [ellie, charlie, kate, micah];
//
//
// function dinerBreakfast() {
//   let order = "french toast please"
//   console.log(order);
//
//   return function (add) {
//     order = `${order.slice(0, order.length - 7)} and ${add} please.`;
//     console.log(order);
//   };
//
// };

//
// const readline = require('readline');
//
// const reader = readline.createInterface({
//   // it's okay if this part is magic; it just says that we want to
//   // 1. output the prompt to the standard output (console)
//   // 2. read input from the standard input (again, console)
//
//   input: process.stdin,
//   output: process.stdout
// });
//
// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
// });
//
// console.log("Last program line");


console.log("somethinggggggg");
