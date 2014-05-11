/**
 * Scene3 being
 */
class Scene3Being extends Being {
  int startFrameCount;
  float time;
  boolean playing;
  static final int chartY = 150;
  static final float velocity = 0.2;
  static final float sampling = 0.6;
  
  Scene3Being(float x, float y, int w, int h) {
      super(new Rectangle(x, y, w, h));
  }

  public void update() {
  }

  public void draw() {
    if (playing) {
      background(255);
      drawTopText();
      //if (frameCount > startFrameCount + 50) {
        drawWave();
      //}
      //if (frameCount > startFrameCount + 320) {
        drawBottomText();
      //}
    }
  }

  private void drawTopText() {
    fill(0,0,0);
    textSize(18);
    text("Longitudinal Waves", LEFT_MARGIN, 30);
    textSize(14);
    StringBuilder sb = new StringBuilder();
    sb.append("In a longitudinal wave, particles movement is parallel to the wave's direction.");
    sb.append(" \n\nFollow the red particle.");
    text(sb.toString(), LEFT_MARGIN, 50, width - LEFT_MARGIN*2, 100);
  }
  
  private void drawBottomText() {
    fill(0,0,0);
    textSize(14);
    StringBuilder sb = new StringBuilder();
    sb.append("Sound waves in air are longitudinal waves. In solids, sounds may be either longitudinal or transverse");
    sb.append("\n\nWhen a vibrating object is moved outward, it compresses air particles into a small region of space.");
    sb.append(" This creates a high pressure region (compression).");
    sb.append(" When the objects goes inward and creates a low pressure region (rarefaction).");
    sb.append(" These regions are transported through the surrounding air, carrying the sound signal ");
    sb.append("\n\nLongitudinal waves are faster than transverse waves.");
    sb.append("\nLongitunal waves are often represented as sines like transverse waves.");
    text(sb.toString(), LEFT_MARGIN, 200, width - LEFT_MARGIN*2, 300);
  }
  
  private void drawWave() {
   
    float pulseMin = HALF_PI;
    float pulseMax = HALF_PI*5;
    float max = 450;
    noStroke();
    
    
    for(float i=0; i<max; i+=sampling) {
      float x = (i*DENSITY_ZOOM) + LEFT_MARGIN;
      if (i>=time-2 && i<time+1) {
        x += 8 * sin(time-i);//(30 * sin(i+HALF_PI));
      }
      float y = chartY;
      if (x < max) {
        pushMatrix();
        if (i > 12 && i < 12.5) {
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
    line(290, chartY - 20, 290, chartY + 20);
  
    time+=velocity;
  }
  
}

