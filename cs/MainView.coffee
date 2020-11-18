`
import Canvas from './Canvas'
import React from 'react';
import Slider from '@material-ui/core/Slider';
import { makeStyles } from '@material-ui/core/styles'
`

useStyles = makeStyles(
  {
    root:
      width: 400
      margin: "0 auto"
  }
)

MainView = (props) ->
  classes = useStyles()
  { value, app } = props;

  <div className={classes.root}>
    <Canvas value={value} />
    <Slider
      value={value}
      min={1}
      max={100}
      onChange={(event, value) => app.onValue(value)}
    />
  </div>

export default MainView
