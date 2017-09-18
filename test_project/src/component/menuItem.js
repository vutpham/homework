import React, { Component } from 'react';

class MenuItem extends Component {

  render() {
    let bullet = <i className="fa fa-angle-right" aria-hidden="true"></i>;

    if (this.props.isShown) {
      bullet = <i className="fa fa-angle-down" aria-hidden="true"></i>;
    }


    let { header, content } = this.props;
    return (
      <div>
        <h2 onClick={this.props.onClick}>{ bullet }  { header }</h2>
        {
          this.props.isShown &&
          <p>{ content }</p>
        }
      </div>
    );
  }
}

export default MenuItem;
