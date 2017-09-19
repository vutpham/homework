import React from 'react';

function GiphysIndexItem(props) {
  console.log(props);
  return (
    <li className="giphy-li">
      <img src={`${props.giphy.images.fixed_height.url}`} />
    </li>
  );
}

export default GiphysIndexItem;
