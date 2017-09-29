import React, { Component } from 'react';
import './App.css';

import Menu from './component/menu';

class App extends Component {
  render() {
    return (
      <div className="App">
        <h2>Example</h2>
        <Menu />
      </div>
    );
  }
}

export default App;
