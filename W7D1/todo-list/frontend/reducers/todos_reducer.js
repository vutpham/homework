const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO, receiveTodos, receiveTodo, removeTodo } from '../actions/todo_actions';
import allTodos from './selectors';
import {merge} from 'lodash';

// window.receiveTodos = receiveTodos;
// window.receiveTodo = receiveTodo;

const todosReducer = (state = initialState, action) => {
  let newState;
  switch(action.type) {
    case RECEIVE_TODOS:
      newState = {};
      // iterating through action.todos setting a key value pair for each one in the new state.
      // return the new state
      action.todos.forEach((todo) => {
        newState[todo.id] = todo;
      });
      return newState;

    case RECEIVE_TODO:
      // Make a new object setting a single key value pair for action.todo
      // Return a new state object by merging your previous state and your new object
      newState = merge({}, state);
      newState[action.todo.id] = action.todo;
      return newState;

    case REMOVE_TODO:
      newState = merge({}, state);
      delete newState[action.todo.id];
      return newState;

    default:
      return state;
  }
};

export default todosReducer;
