import React, { Component } from 'react';

class TodoForm extends Component {
  constructor(props) {
    super(props);

    this.state = {
      title: "",
      body: ""
    };

    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount(){
    console.log(this.props);
  }

  handleChange(e, key) {
    this.setState({[key]: e.currentTarget.value});
    console.log(this.state);
  }

  render() {
    return (
      <form onSubmit={() => this.props.receiveTodo(this.state)}>
        <label>Title:
          <input type="text"
            value={this.state.title}
            onChange={(e) => this.handleChange(e, 'title')}/>
        </label>
        <label>Body:
          <input type="text"
            value={this.state.body}
            onChange={(e) => this.handleChange(e, 'body')}/>
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}

export default TodoForm;
