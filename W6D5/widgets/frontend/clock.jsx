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

    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    hours = (hours < 10) ? `0${hours}` : hours;
    minutes = (minutes < 10) ? `0${minutes}` : minutes;
    seconds = (seconds < 10) ? `0${seconds}` : seconds;

    return (
      <section className="clock">
        <ul className="time">
          <li>Time</li>
          <li>{hours}:{minutes}:{seconds} PDT</li>
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
