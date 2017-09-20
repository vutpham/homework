import React, { Component } from 'react';

class TodoListItem extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let { title } = this.props;

    return (
      <li>
        { title }
      </li>
    );
  }
}

export default TodoListItem;
