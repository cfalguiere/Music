/**
 * Scene2 being
 */
class Scene2Being extends Being {
  int startFrameCount;
  float time;
  boolean playing;
  static final int chartY = 200;
  static final int velocity = 2;
  
  Scene2Being(float x, float y, int w, int h) {
      super(new Rectangle(x, y, w, h));
      startFrameCount = frameCount;
  }

  public void update() {
  }

  public void draw() {
    if (playing) {
      background(255);
      drawPulseTransversalWaveMinimalText1();
      //if (frameCount > startFrameCount + 130) {
        drawPulseTransversalWaveMinimal();
      //}
      //if (frameCount > startFrameCount + 320) {
        drawPulseTransversalWaveMinimalText2();
      //}
    }
  }

  private void drawPulseTransversalWaveMinimalText1() {
    fill(0,0,0);
    textSize(18);
    text("Transverse Waves", LEFT_MARGIN, 30);
    textSize(14);
    StringBuilder sb = new StringBuilder();
    sb.append("For instance, if a transverse wave propagates from left to right, particles moves up and down.");
    sb.append("\n\nFollow the red particle.");
    text(sb.toString(), LEFT_MARGIN, 50, width - LEFT_MARGIN*2, 100);
  }
  
  private void drawPulseTransversalWaveMinimalText2() {
    fill(0,0,0);
    textSize(14);
    StringBuilder sb = new StringBuilder();
    sb.append("Transerve waves may occur on a string, on the surface of a liquid and throughout a solid.");
    sb.append("\nThey cannot propagate in a gas or a liquid.");
    text(sb.toString(), LEFT_MARGIN, 290, width - LEFT_MARGIN*2, 100);
  }
  
  
  private void drawPulseTransversalWaveMinimal() {
   
    float pulseMin = HALF_PI;
    float pulseMax = HALF_PI*5;
    float ropeMax = 450;
    noStroke();
    for(float i=0; i<time/DENSITY_ZOOM+pulseMin; i+=SAMPLING_ZOOM) {
      float x = (i*DENSITY_ZOOM) + LEFT_MARGIN;
      float y = AMPLITUDE + chartY;
      if (x < ropeMax) {
        pushMatrix();
        if (x > 270 && x < 285) {
          stroke(255,0,0);
          strokeWeight(2);
          fill(255,0,0);
        } else {
          noStroke();
          fill(0,0,0);
        }
        ellipse(x, y, POINT_SIZE_ZOOM, POINT_SIZE_ZOOM);
        popMatrix();
      }
    }
    
    for(float i=pulseMin; i<pulseMax; i+=SAMPLING_ZOOM) {
        float x = (i*DENSITY_ZOOM) + LEFT_MARGIN + time;
        float y = (AMPLITUDE * sin(i)) + chartY;
      if (x < ropeMax) {
        pushMatrix();
        if (x > 270 && x < 280) {
          stroke(255,0,0);
          strokeWeight(2);
          fill(255,0,0);
        } else {
          noStroke();
          fill(0,0,0);
        }
        ellipse( x, y, POINT_SIZE_ZOOM, POINT_SIZE_ZOOM);
        popMatrix();
      }
    }
   
    for(float i=pulseMax+time/DENSITY_ZOOM; i<ropeMax/DENSITY_ZOOM; i+=SAMPLING_ZOOM) {
      float x = (i*DENSITY) + LEFT_MARGIN;
      float y = AMPLITUDE + chartY;
      if (x < ropeMax) {
        pushMatrix();
        if (x > 270 && x < 280) {
          stroke(255,0,0);
          strokeWeight(2);
          fill(255,0,0);
        } else {
          noStroke();
          fill(0,0,0);
        }
        ellipse(x, y, POINT_SIZE_ZOOM, POINT_SIZE_ZOOM);
        popMatrix();
      }
    }
    
    strokeWeight(1);
    stroke(32,32,32);
    line(280, chartY-60, 280, chartY+60);
  
    time+=velocity;
  }
  
}

