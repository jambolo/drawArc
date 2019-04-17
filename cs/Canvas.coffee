`
import drawArc from './drawArc'
import React, { Component } from 'react';
`

class Canvas extends Component
  componentDidMount: ->
    @update(0)

  componentDidUpdate: ->
    { value } = @props
    @update(value)

  update: (value) ->
    canvas = @refs.canvas
    ctx = canvas.getContext("2d")

    ctx.save()
    ctx.beginPath()
    ctx.rect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = 'white'
    ctx.fill()

    r = (value / 100 * 0.75 + 0.25) * canvas.width

    P1 =
      x: canvas.width * 0.25
      y: canvas.height * 0.5

    P2 =
      x: canvas.width * 0.75
      y: canvas.height * 0.5

    ctx.beginPath()
    ctx.strokeStyle = 'black'
    debug = drawArc(ctx, P1.x, P1.y, P2.x, P2.y, r)
    ctx.stroke()

    ctx.beginPath()
    ctx.strokeStyle = 'blue'
    ctx.moveTo(P1.x, P1.y)
    ctx.lineTo(debug.C.x, debug.C.y)
    ctx.lineTo(P2.x, P2.y)
    ctx.stroke()

    ctx.beginPath()
    ctx.strokeStyle = 'green'
    ctx.moveTo(P1.x, P1.y)
    ctx.lineTo(debug.Q.x, debug.Q.y)
    ctx.lineTo(P2.x, P2.y)
    ctx.stroke()

    ctx.beginPath()
    ctx.strokeStyle = 'red'
    ctx.moveTo(debug.C.x, debug.C.y)
    ctx.lineTo(debug.Q.x, debug.Q.y)
    ctx.moveTo(P1.x, P1.y)
    ctx.lineTo(P2.x, P2.y)
    ctx.stroke()
    ctx.restore()

    ctx.font = "24px bold"
    ctx.fillText("P1", P1.x-24, P1.y)
    ctx.fillText("P2", P2.x+12, P2.y)
    ctx.fillText("r", (P1.x+debug.C.x)/2-24, (P1.y+debug.C.y)/2)
    ctx.fillText("r", (P2.x+debug.C.x)/2+12, (P2.y+debug.C.y)/2)
    ctx.fillText("Q", debug.Q.x-12, debug.Q.y-24)

  render: ->
    <canvas ref="canvas" width={400} height={800} />

export default Canvas