/**
 * Scene1 being
 */
class Scene1Being extends Being {
  int startFrameCount;
  float t;
  boolean playing;
  static final int chartY = 280;
  static final int velocity = 2;
  
  Scene1Being(float x, float y, int w, int h) {
      super(new Rectangle(x, y, w, h));
  }

  public void update() {
  }

  public void draw() {
    if (playing) {
      background(255);
      fill(0);
      drawPulseTransversalWaveText1();
      //if (frameCount > startFrameCount + 100) {
        drawPulseTransversalWaveText2();
      //}
      //if (frameCount > startFrameCount + 450) {
        drawPulseTransversalWave();
      //}
    }
  }

  private void drawPulseTransversalWaveText1() {
    pushMatrix();
    textSize(18);
    text("Waves", LEFT_MARGIN, 30);
    textSize(14);
    StringBuilder sb = new StringBuilder();
    sb.append("Waves propagates though a medium which may be solid, liquid or gaz.");
    sb.append(" Particles don't move along the wave, they oscilates as the wave passes.");
    text(sb.toString(), LEFT_MARGIN, 50, width - LEFT_MARGIN*2, 100);
    popMatrix();
  }
  
  private void drawPulseTransversalWaveText2() {
    pushMatrix();
    StringBuilder sb2 = new StringBuilder();
    sb2.append("There are two types of wave motion: longitudinal and transversal.");
    sb2.append(" \n\nIn transversal waves, particle displacement is perpendicular to the wave's direction.");
    text(sb2.toString(), LEFT_MARGIN, 115, width - LEFT_MARGIN*2, 100);
    popMatrix();
  }
  
  private void drawPulseTransversalWave() {
    fill(0);
    pushMatrix();
    float pulseMin = HALF_PI;
    float pulseMax = HALF_PI*5;
    float ropeMax = 450;
    strokeWeight(1);
    fill(0,0,0);
    for(float i=0; i<t/DENSITY+pulseMin; i+=SAMPLING) {
      float x = (i*DENSITY) + LEFT_MARGIN;
      float y = AMPLITUDE + chartY;
      if (x < ropeMax) {
        ellipse(x, y, POINT_SIZE, POINT_SIZE);
      }
    }
    
    for(float i=pulseMin; i<pulseMax; i+=SAMPLING) {
        float x = (i*DENSITY) + LEFT_MARGIN + t - 3;
        float y = (AMPLITUDE * sin(i)) + chartY;
      if (x < ropeMax) {
        ellipse( x, y, POINT_SIZE, POINT_SIZE);
      }
    }
   
    for(float i=pulseMax+t/DENSITY; i<ropeMax/DENSITY; i+=SAMPLING) {
      float x = (i*DENSITY) + LEFT_MARGIN;
      float y = AMPLITUDE + chartY;
      if (x < ropeMax) {
        ellipse(x, y, POINT_SIZE, POINT_SIZE);
      }
    }
  
    int hrzArrowX = 200;
    int hrzArrowY = chartY + 80;
    drawHorizontalArrow(hrzArrowX, hrzArrowY, 80);
    text("wave direction" , hrzArrowX, hrzArrowY + 15, width - LEFT_MARGIN*2, 100);
    
    strokeWeight(2);
    int vrtArrowX = 500;
    int vrtArrowY = chartY - 20;
    drawVerticalArrow(vrtArrowX, vrtArrowY, 80);
    text("particle displacement" , vrtArrowX - 30, vrtArrowY - 50, 100, 100);
    popMatrix();
    
    t+=velocity;
  }
  
  private void drawHorizontalArrow(int x, int y, int w) {
    strokeWeight(2);
    line(x, y, x + w, y);
    line(x + w - 10, y - 10, x + w, y);
    line(x + w - 10, y + 10, x + w, y);
  }
  
  
  private void drawVerticalArrow(int x, int y, int h) {
    strokeWeight(2);
    line(x, y, x, y + h);
    line(x - 10, y + h - 10, x, y + h);
    line(x + 10, y + h - 10, x, y + h);
    line(x - 10, y + 10, x, y);
    line(x + 10, y + 10, x, y);
  }

}

