`
import Canvas from './Canvas'
import React from 'react';
import Slider from '@material-ui/lab/Slider';
`

MainView = (props) ->
    { value, app } = props;

    <div className="MainView">
      <Canvas value={value} />
      <Slider
        value={value}
        min={0}
        max={100}
        onChange={(event, value) => app.onValue(value)}
      />
    </div>

export default MainView
