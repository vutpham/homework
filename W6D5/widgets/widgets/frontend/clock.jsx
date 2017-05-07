import React from 'react';

class Clock extends React.Component{
  constructor(props){
    super(props);
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);
  }

  tick(){
    this.setState({time: new Date()});
  }

  componentDidMount(){
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.interval);
  }

  render(){
    return (
      <section className="clock">
        <ul className="time">
          <li>Time</li>
          <li>[{this.state.time.getHours()}:
          {this.state.time.getMinutes()}:
          {this.state.time.getSeconds()}]</li>
        </ul>

        <ul className="date">
          <li>Date</li>
          <li>{this.state.time.toDateString()}</li>
        </ul>
      </section>
    );
  }
}

export default Clock;
