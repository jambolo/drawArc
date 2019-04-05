# drawArc

**Draws an arc of a given radius between two points**

Typically, the HTML canvas `arcTo` method is used to draw rounded corners and determining the values of the parameters is generally trivial because the first endpoint is simply the corner. However, computing the first endpoint in the case of drawing a generic arc is complicated. The `drawArc` method does that computation for you.

## The Math

![Diagram](diagram.png)

Given a starting point, *P<sub>1</sub>*, an endpoint, *P<sub>2</sub>*, and a radius, *r*, compute a point, *Q*, such that *P<sub>1</sub>Q* and *P<sub>2</sub>Q* are tangent at *P<sub>1</sub>* and *P<sub>2</sub>* to a circle with the given radius with *P<sub>2</sub>* counter-clockwise from *P<sub>1</sub>*.

![Derivation](derivation.jpg)
<!--
P_{1} = ( x_{1} , y_{1} ) \\
P_{2} = ( x_{2} , y_{2} ) \\ \\
M = ( \frac{ x_{1} + x_{2} }{2} , \frac{ y_{1} + y_{2} } {2}) \\ \\
\widehat{MQ} = \perp \frac { \overrightarrow{MP_{1}} } { \left | \overrightarrow{MP_{1}} \right | } \\ \\
\left | \overline{CM} \right | = \sqrt{ r^2 - \left | \overline{MP_{1}} \right |^2 } \\ \\
\left | \overline{MQ} \right | = \frac { \left | \overline{MP_{1}} \right |^2 } { \left | \overline{CM} \right | } \\ \\
Q = M + \left | \overline{MQ} \right | \widehat{MQ}
-->

## API

drawArc(context, x1, y1, x2, y2, radius)

 * **context** - HTML drawing context
 * **x1, y1** - start of the arc
 * **x2, y2** - end of the arc
 * **radius** - radius of curvature

