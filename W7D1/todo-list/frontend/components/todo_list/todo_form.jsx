import React from 'react';
import uniqueId from '../../util/util';
// import util
import {merge} from 'lodash';


class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {id: "", title: "", body: ""};
    this.setTitle = this.setTitle.bind(this);
    this.setBody = this.setBody.bind(this);
    this.submitForm = this.submitForm.bind(this);
  }

  setTitle(e){
    this.setState({title: e.currentTarget.value});
    // console.log(this.state.title);
  }

  setBody(e){
    this.setState({body: e.currentTarget.value});
  }

  submitForm(e){
    e.preventDefault();
    // this.setState({id: uniqueId()});
// id: uniqueId()

    const newState = merge({}, this.state, {id: uniqueId()});
    this.props.receiveTodo(newState);
    this.setState({id: "", title: "", body: ""});
  }

  render(){
    return (
      <form onSubmit={this.submitForm}>
        <input onChange={this.setTitle} value={this.state.title}></input>
        <input onChange={this.setBody} value={this.state.body}></input>
        <button type="submit">Submit Todo</button>
    </form>
    );
  }
}

export default TodoForm;
