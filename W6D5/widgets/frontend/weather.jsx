import React from 'react';

class Weather extends React.Component{
  constructor(props){
    super(props);
    this.state = {city: '', temp: ''};
    this.convertToF = this.convertToF.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition((position)=>{
      let lon = position.coords.longitude;
      let lat = position.coords.latitude;
      console.log(lon, lat);
      let request = new XMLHttpRequest();
      request.open('GET',
       `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=c9d002923ca54918d0f7bb419fa9c202`,
       true);

       request.onload = (res)=>{
         let city = JSON.parse(request.response).name;
         let temp = JSON.parse(request.response).main.temp;
         this.setState({city: city, temp: temp});
       };
       request.send();
    });
  }

  convertToF(num){
    return (9*(num-273)/5) + 32;
  }

  render(){
    return (
      <ul className="weather">
        <li>{this.state.city}</li>
        <li>{this.convertToF(this.state.temp).toFixed(1)}°F</li>
      </ul>
    );
  }
}

export default Weather;
