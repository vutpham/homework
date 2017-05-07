const DOMNodeCollection = require("./dom_node_collection");
// function window.$l(input) {
//   console.log("Sunny");
//   let eleList = document.querySelectorAll(selector);
//   eleList = Array.from(eleList);
// }

// const $l = function(selector) {
//   console.log(this);
//   console.log("Sunny");
//   let eleList = document.querySelectorAll(selector);
//   eleList = Array.from(eleList);
//   return eleList;
// }



const $l = function(input) { //same thing as $()
    if (input instanceof Function) {
      const functionQueue = [];
      functionQueue.push(input);
      if (document.readyState === "complete") {
        functionQueue.forEach((func)) {
          //func.run
          func.apply(null);
        }

      }
    }
    let eleList = document.querySelectorAll(input);
    eleList = Array.from(eleList);
    if (input instanceof HTMLElement) {
      return new DOMNodeCollection([input]);
    } else {
      return new DOMNodeCollection(eleList);
    }
};

window.$l = $l;
