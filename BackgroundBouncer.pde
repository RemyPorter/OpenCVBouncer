import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;
Flow f;
Ball b;

void setup() {
    size(640,480, P3D);
    frameRate(30);
    ellipseMode(RADIUS);
    video = new Capture(this, 640/2, 480/2);
    opencv = new OpenCV(this, 640/2, 480/2);
    b = new Ball();


    video.start();
    video.read();

    opencv.startBackgroundSubtraction(50,3,0.5);

}

void draw() {
    clear();
    scale(2);
    //image(video, 0, 0 );
    opencv.loadImage(video);
    opencv.flip(OpenCV.HORIZONTAL);
    opencv.updateBackground();
    opencv.calculateOpticalFlow();
    opencv.dilate();
    opencv.erode();
    noFill();stroke(255,0,0);
    strokeWeight(1);
    image(opencv.getOutput(), 0, 0);
    //opencv.drawOpticalFlow();
    for (Contour c : opencv.findContours()) {
        Contour hull = c.getConvexHull();
        Rectangle box = hull.getBoundingBox();
        PVector flow = opencv.getAverageFlowInRegion(box.x, box.y, box.width, box.height);
        rect(box.x, box.y, box.width, box.height);
        b.strike(c, opencv);
        //hull.draw();
    }
    b.move();
    reflect(b);
    drawBall(b);

}

void keyPressed() {
    b.position = new PVector(120, 120);
    b.momentum = new PVector(0, 0);
}
void captureEvent(Capture c) {
  c.read();
}
