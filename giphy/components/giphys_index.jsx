import React from 'react';

import GiphysIndexItem from './giphys_index_item';

function GiphysIndex({giphys}) {
  return (
    <ul>
      {
        giphys.map(giphy =>
          <GiphysIndexItem key={giphy.id} giphy={giphy} randomProp={"hello"}
            />)
          }
    </ul>
  );
}

export default GiphysIndex;
