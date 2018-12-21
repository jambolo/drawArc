# drawArc

**Draws an arc of a given radius between two points**

Typically, the HTML canvas `arcTo` method is used to draw rounded corners and determining the values of the parameters is generally trivial because the first endpoint is simply the corner. However, computing the first endpoint in the case of drawing a generic arc is complicated. The `drawArc` method does that computation for you.
