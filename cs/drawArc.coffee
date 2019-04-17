debug =
  C:
    x: 0
    y: 0
  Q: 
    x: 0
    y: 0

computeQ = (x1, y1, x2, y2, radius) ->
  P1 = { x: x1, y: y1 }
  P2 = { x: x2, y: y2 }

  # Determine the midpoint (M) from P1 to P2
  M =
    x: (P1.x + P2.x) / 2
    y: (P1.y + P2.y) / 2

  # Determine the distance from M to P1
  dMP1 = Math.sqrt((P1.x - M.x)*(P1.x - M.x) + (P1.y - M.y)*(P1.y - M.y))

  # Validate the radius
  if not radius? or radius < dMP1
    radius = dMP1

  # Determine the unit vector from M to P1
  uMP1 =
    x: (P1.x - M.x) / dMP1
    y: (P1.y - M.y) / dMP1

  # Determine the unit vector from M to Q (just uMP1 rotated pi/2)
  uMQ = { x: -uMP1.y, y: uMP1.x }

  # Determine the distance from the center of the circle (C) to M
  dCM = Math.sqrt(radius*radius - dMP1*dMP1)

  # Determine the distance from M to Q
  dMQ = dMP1 * dMP1 / dCM

  # Determine the location of Q
  Q =
    x: M.x + uMQ.x * dMQ
    y: M.y + uMQ.y * dMQ
 
  debug =
    C:
      x: M.x - uMQ.x * dCM
      y: M.y - uMQ.y * dCM
    Q: Q

  return Q

# Given two points and a radius, determine the first parameter of the arcTo function and draw an arc from the
# first point to the second point
drawArc = (ctx, x1, y1, x2, y2, radius) ->
  ctx.moveTo(x1, y1)
  Q = computeQ(x1, y1, x2, y2, radius)
  ctx.arcTo(Q.x, Q.y, x2, y2, radius)
  return debug

export default drawArc
