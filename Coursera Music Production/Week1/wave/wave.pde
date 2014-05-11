/*
 * Wave animation
 */
import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;

static final int WINDOW_WIDTH = 800;
static final int WINDOW_HEIGHT = 600;
static final int BASE_PORT_IN = 8080;
static final int BASE_PORT_OUT = 8000; 


static final int TOP_MARGIN = 250;
static final int LEFT_MARGIN = 50;
static final int AMPLITUDE = 50;
static final int DENSITY = 20;
static final int DENSITY_ZOOM = 20;
static final int POINT_SIZE = 3;
static final int POINT_SIZE_ZOOM = 8;
static final float SAMPLING = 0.05;
static final float SAMPLING_ZOOM = 0.5;

AnimationWorld animationWorld;

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
  Hermes.setPApplet(this);

  frameRate(60);

  animationWorld = new AnimationWorld(BASE_PORT_IN, BASE_PORT_OUT);       
  animationWorld.start(); // this should be the last line in setup() method
}


void draw() {
    animationWorld.draw();
}


