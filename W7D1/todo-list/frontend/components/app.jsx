import React from 'react';
import ReactDOM from 'react-dom';
import TodoForm from './todo_list/todo_form';
import TodoListContainer from './todo_list/todo_list_container';

class App extends React.Component {


  render () {
    return (
      <div>
        <TodoListContainer/>
      </div>
  );
}

}

// document.addEventListener('DOMContentLoaded', () => {
//   ReactDOM.render(<App/>, document.getElementById('content'));
// });

export default App;
