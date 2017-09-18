import React, { Component } from 'react';
import Data from '../data/menu_data';

import MenuItem from './menuItem';

class Menu extends Component {
  constructor(props) {
    super(props);

    this.state = {
      shownContent: null
    };

    this.toggleContent = this.toggleContent.bind(this);
  }

  toggleContent(index) {
    if (this.state.shownContent === index ) {
      this.setState({shownContent: null});
    } else {
      this.setState({shownContent: index});
    }
  }

  showMenu() {
    return Data.map((menu, i) => {
      return (

        <MenuItem
          key={`menu_item_${i}`}
          header={ menu.header }
          content={ menu.content }
          isShown={ this.state.shownContent === i }
          onClick={ () => { this.toggleContent(i);} }
        />
      );
    });
  }


  render() {

    return (
      <div>
      { this.showMenu() }
      </div>
    );
  }
}

export default Menu;
