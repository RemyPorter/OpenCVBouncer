float decayRate = 0.9;
float scalingFactor = 7;
PVector gravity = new PVector(0, 0.5);
class Ball {
  public Ball() {
    size = 25;
    shade = #FF0000;
    position = new PVector(120, 120);
    momentum = new PVector(0, 0);
  }
  public PVector position;
  public PVector momentum;
  public float size;
  public color shade;
  public void move() {
    position.add(momentum);
    momentum.add(gravity);
    momentum.mult(decayRate);
  }
  public void strike(Contour c, OpenCV opencv) {
    for (PVector p : c.getPoints()) {
        if (p.dist(position) <= size) {
            Rectangle box = c.getBoundingBox();
            PVector flow = opencv.getAverageFlowInRegion(box.x, box.y, box.width, box.height);
            flow.mult(scalingFactor);
            momentum.add(flow);
            return;
        }
    }
  }
}

void drawBall(Ball b) {
    fill(b.shade);
    ellipse(b.position.x, b.position.y,
        b.size, b.size);
}

void reflect(Ball b) {
    if (b.position.x - b.size <= 0) {
        b.position.x = b.size;
        b.momentum.x *= -1;
    } else if (b.position.x + b.size > width/2) {
        b.position.x = width/2 - b.size;
        b.momentum.x *= -1;
    }
    if (b.position.y - b.size <= 0) {
        b.position.y = b.size;
        b.momentum.y *= -1;
    } else if (b.position.y + b.size > height/2) {
        b.position.y = height/2 - b.size;
        b.momentum.y *= -1;
    }
}