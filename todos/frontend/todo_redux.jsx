import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import App from './components/app';

import configureStore from './store/store';
import { receiveTodo, receiveTodos } from './actions/todo_actions';

document.addEventListener('DOMContentLoaded', () => {

  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};

  const store = configureStore(preloadedState);
	const root = document.getElementById('content');

  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
	ReactDOM.render(<Root store={ store } />, root);
});
