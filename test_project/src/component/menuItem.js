import React, { Component } from 'react';

class MenuItem extends Component {
  constructor(props) {
    super(props);

    this.state = {
      shownContent: false
    };

    this.toggleContent = this.toggleContent.bind(this);
  }

  toggleContent() {
    this.setState({shownContent: !this.state.shownContent});
  }

  render() {
    let bullet = <i className="fa fa-angle-right" aria-hidden="true"></i>;

    if (this.state.shownContent) {
      bullet = <i className="fa fa-angle-down" aria-hidden="true"></i>;
    }


    let { header, content } = this.props;
    return (
      <div>
        <h2 onClick={this.toggleContent}>{ bullet }  { header }</h2>
        {
          this.state.shownContent &&
          <p>{ content }</p>
        }
      </div>
    );
  }
}

export default MenuItem;
