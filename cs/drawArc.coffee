computeQ = (x1, y1, x2, y2, radius) ->
  P1 = { x: x1, y: y1 }
  P2 = { x: x2, y: y2 }

  # Determine the midpoint (M) from P1 to P2
  M =
    x: (P1.x + P2.x) / 2
    y: (P1.y + P2.y) / 2

  # Determine the distance from P1 to M
  dP1M = Math.sqrt((M.x - P1.x)*(M.x - P1.x) + (M.y - P1.y)*(M.y - P1.y))

# Validate the radius
  if not radius? or radius < dP1M
    radius = dP1M

  # Determine the distance from M to the center of the circle (C)
  dCM = Math.sqrt(radius*radius - dP1M*dP1M)

  # Determine the unit vector from P1 to M
  uP1M =
    x: (M.x - P1.x) / dP1M
    y: (M.y - P1.y) / dP1M

  # Determine the unit vector from M to C (just uP1M rotated pi/2)
  uMC = { x: -uP1M.y, y: uP1M.x }

  # Determine the location of C
  C =
    x: M.x + uMC.x * dCM
    y: M.y + uMC.y * dCM

  # Determine the distance from C to Q
  dCQ = radius * radius / dCM

  # Determine the location of Q
  Q =
    x: C.x - uMC.x * dCQ
    y: C.y - uMC.y * dCQ

  return Q

# Given two points and a radius, determine the first parameter of the arcTo function and draw an arc from the
# first point to the second point
drawArc = (ctx, x1, y1, x2, y2, radius) ->
  Q = computeQ(x1, y1, x2, y2, radius)
  ctx.moveTo(x1, y1)
  ctx.arcTo(Q.x, Q.y, x2, y2, radius)
  return
