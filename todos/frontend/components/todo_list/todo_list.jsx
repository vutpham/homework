import React, { Component } from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends Component {
  constructor(props) {
    super(props);

    this.showTodos = this.showTodos.bind(this);
  }

  showTodos() {
    return this.props.todos.map((todo, i) => {
      return (
        <TodoListItem key={`todo_item_${i}`}
                      title={todo.title}
                      body={todo.body}/>
      );
    });
  }

  render() {
    return (
      <div>
        <ul>
          { this.showTodos() }
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

export default TodoList;
