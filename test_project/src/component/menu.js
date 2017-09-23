import React, { Component } from 'react';
import Data from '../data/menu_data';

import MenuItem from './menuItem';

class Menu extends Component {
  showMenu() {
    return Data.map((menu, i) => {
      return (

        <MenuItem
          key={`menu_item_${i}`}
          header={ menu.header }
          content={ menu.content }
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
