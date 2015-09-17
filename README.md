# OpenCV Hello World
This is just a simple OpenCV project in Processing which tracks movements in foreground objects and uses that to allow those movements to move a bouncing ball around.

The current visualization mode includes some debugging symbols to make it easier to see what OpenCV detects as moving objects.

Slow, clear movements will have better effects on the ball. Quick movements will pass right "through" it, barely touching it.

Pressing any key will reset the ball to its starting point.

In the file Ball.pde, there are a few values that can control the behavior of the game- decayRate, scalingFactor, and gravity.