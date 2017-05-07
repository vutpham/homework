class DOMNodeCollection {
  constructor(htmlElements) {
    this.htmlElements = htmlElements;
  }

  html(string) {
    if (string !== null) {
      this.htmlElements.forEach( (el) => {
        el.innerHTML = string;
        return el.innerHTML;
      });
    } else {
      return this.htmlElements[0].innerHTML;
    }
  }

  empty() {
    return this.html("");
  }

  append(arg) {
    this.htmlElements.forEach((htmlEl) => {
      // debugger;
      htmlEl.innerHTML += arg;
    });
  }

  attr(attributeName, value) {
    let firstEle = this.htmlElements[0];
    if (!value) {
     return firstEle.getAttribute(attributeName);
   } else {
     return firstEle.setAttribute(attributeName, value);
   }
  }

  addClass(newClassName) {
    this.htmlElements.forEach((htmlEl) => {
      htmlEl.classList.add(newClassName);
    });
  }

  removeClass(className){
    this.htmlElements.forEach((htmlEl) => {
      let oldClassName = htmlEl.className;
      htmlEl.classList.remove(className);
    });
  }

  children() {
    let vusChildren = [];
    this.htmlElements.forEach((htmlEl) =>{
      // vusChildren += Array.from(htmlEl.children);
      vusChildren = vusChildren.concat(Array.from(htmlEl.children));
    });
    return new DOMNodeCollection(vusChildren);
  }

  parent() {
    let elParents = [];
    this.htmlElements.forEach( (htmlEl) => {
      if (!elParents.includes(htmlEl.parentElement)){
        (elParents.push(htmlEl.parentElement));
      }
    });
    return new DOMNodeCollection(elParents);
  }

  find(selector) { //can be a great grandchild can be matched
    let matchingNodes = [];
    const children = this.children();
    // debugger;
    children.htmlElements.forEach( (child) => {
      if (child === null) return; //base case
      if (child.matches(selector)) matchingNodes.push(child); //top level case
      let domChild = new DOMNodeCollection([child]);
      matchingNodes.concat(domChild.find(selector)); //for each child's children, append to matching nodes whichever's child matches selector
    });
    return new DOMNodeCollection(matchingNodes);
  }

  remove() {
    this.empty();
    this.htmlElements = [];
  }

  on(event, callback) {
    this.htmlElements.forEach((el) => {
      el.eventCallback = callback;
      el.addEventListener(event, callback);
    });
  }

  off(event) {
    this.htmlElements.forEach((el) => {
      el.removeEventListener(event, el.eventCallback);
    });
  }

}

module.exports = DOMNodeCollection;
