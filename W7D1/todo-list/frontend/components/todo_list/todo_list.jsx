import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }
  render () {
    const todos = this.props.todos.map((todo, idx) => (
      <TodoListItem key={idx} todo={todo} /> //Look into this form
    ));

    return (
      <div>
        <h1>Todos</h1>
        <ul>{ todos }</ul>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

export default TodoList;
