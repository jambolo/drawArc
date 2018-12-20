

computeQ = (x1, y1, x2, y2, radius) ->
  P1 = { x: x1, y: y1 }
  P2 = { x: x2, y: y2 }

  # Determine the distance between P1 and P2
  d12 = Math.sqrt((P2.x - P1.x)*(P2.x - P1.x) + (P2.y - P1.y)*(P2.y - P1.y))

  # Determine the midpoint (M)
  M =
    x: (P1.x + P2.x) / 2
    y: (P1.y + P2.y) / 2

  # Determine the distance from P1 (or P2) to M
  d1M = d12 / 2

# Validate the radius
  if not radius? or radius < d1M
    radius = d1M

  # Determine the distance from M to the center of the circle (C)
  dCM = Math.sqrt(radius*radius - d1M*d1M)

  # Determine the unit vector from P1 to P2
  u12 =
    x: (P2.x - P1.x) / d12
    y: (P2.y - P1.y) / d12

  # Determine the unit vector from M to C (just u12 rotated pi/2)
  uMC = { x: -u12.y, y: u12.x }

  # Determine the location of C
  C =
    x: M.x + uMC.x * dCM
    y: M.y + uMC.y * dCM

  # Determine the unit vector from C to P1
  uC1 =
    x: (P1.x - C.x) / radius
    y: (P1.y - C.y) / radius

  # Determine the unit vector from C to P2
  uC2 =
    x: (P2.x - C.x) / radius
    y: (P2.y - C.y) / radius

  # Determine the unit vector from P1 to Q (just uC1 rotated pi/2)
  u1Q = { x: -uC1.y, y: uC1.x }

  # Determine the unit vector from P2 to Q (just uC2 rotated -pi/2)
  u2Q = { x: uC2.y, y: -uC2.x }

  # Determine the distance from P1 (also P2) to the result (Q)
  d1Q = d12 / Math.sqrt((u1Q.x - u2Q.x)*(u1Q.x - u2Q.x) + (u1Q.y - u2Q.y)*(u1Q.y - u2Q.y))

  # Determine the distance from C to Q
  dCQ = Math.sqrt(radius*radius + d1Q*d1Q)

  # Determine the result
  Q =
    x: C.x - uMC.x * dCQ
    y: C.y - uMC.y * dCQ

  return Q

# Given two points and a radius, determine the first parameter of the arcTo function that draws an arc from the
# first point to the second point
arcTo = (ctx, x1, y1, x2, y2, radius) ->
  Q = computeQ(x1, y1, x2, y2, radius)
  ctx.moveTo(x1, y1)
  ctx.arcTo(Q.x, Q.y, x2, y2, radius)
  return

export default arcTo