import React from 'react';

class TodoListItem extends React.Component {
  render(){
    return (
      <li>
      {this.props.todo.title}
      <button onClick={this.props.removeTodo}>Delete Todo</button>
      </li>
    );
  }
}

export default TodoListItem;
