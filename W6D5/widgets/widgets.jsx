import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/root';

let item = "";

document.addEventListener("DOMContentLoaded", () => {
  let root = document.getElementById('root');
  ReactDOM.render(< Root text={item} />, root);
});
