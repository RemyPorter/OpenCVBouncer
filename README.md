# OpenCV Hello World
This is just a simple OpenCV project in Processing 3 which tracks movements in foreground objects and uses that to allow those movements to move a bouncing ball around. A ball is drawn, and any foreground objects are drawn. By moving the foreground objects (like your hands), you can move the ball on the screen.

Slow, clear movements will have better effects on the ball. Quick movements will pass right "through" it, barely touching it.

Pressing any key will reset the ball to its starting point.

In the file Ball.pde, there are a few values that can control the behavior of the game- decayRate, scalingFactor, and gravity.

## Dependencies
* OpenCV
* Processing.video

These can be installed from the "Add Library…" menu.

## Demo
[Watch on Youtube](https://www.youtube.com/embed/7czWjKFHC74")