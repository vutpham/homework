import React from 'react';
import ReactDOM from 'react-dom';
// import * as TodoActions from './actions/todo_actions';
import configureStore from './store/store';
import {allTodos} from './reducers/selectors';
import Root from './components/root.jsx';
import TodoForm from './components/todo_list/todo_form';


document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore;
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
});
