init = ->
  canvas = document.createElement("canvas")
  canvas.width = document.documentElement.clientWidth
  canvas.height = document.documentElement.clientHeight
  document.body.insertBefore(canvas, document.body.childNodes[0])
  canvasRect = canvas.getBoundingClientRect()

  twoPi = 6.2831853071

  ctx = canvas.getContext("2d")

  ctx.beginPath()
  ctx.rect(0, 0, canvas.width, canvas.height)
  ctx.fillStyle = 'white'
  ctx.fill()

  C = 
    x: canvas.width / 2
    y: canvas.height / 2
  r = Math.min(canvas.width, canvas.height) / 4
  n = 8

  arcFactor = 0.4

  for i in [0..n]
    P1 =
      x: C.x+Math.cos(twoPi/n * i) * r
      y: C.y+Math.sin(twoPi/n * i) * r
    P2 =
      x: C.x+Math.cos(twoPi/n * (i+1)) * r
      y: C.y+Math.sin(twoPi/n * (i+1)) * r

    ctx.beginPath()
    ctx.strokeStyle = 'black'
    drawArc(ctx, P1.x, P1.y, P2.x, P2.y, r*arcFactor)
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

window.addEventListener('load', (e) ->
    init()
, false)
