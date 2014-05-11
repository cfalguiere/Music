/**
 * Scene0 being
 */
class Scene0Being extends Being {
  int startFrameCount;
  boolean playing = true;
  
  Scene0Being(float x, float y, int w, int h) {
      super(new Rectangle(x, y, w, h));
  }

  public void update() {
  }

  public void draw() {
    if (playing) {
      background(255);
      fill(0);
      drawText();
    }
  }

  private void drawText() {
    pushMatrix();
    textSize(18);
    text(" ", LEFT_MARGIN, 30);
    textSize(14);
    StringBuilder sb = new StringBuilder();
    
    sb.append("My name is Claude. I'am French.");
    sb.append(" \n\nI'am a computer scientist and I'am interested in music (as well as drawing and other forms of arts) as ways");
    sb.append(" to motivate people to learm some computer skills.");
    sb.append(" \nI'am involved in an organization which goal is to inspire teenagers to programming and learning robotics.");
    sb.append(" \n\n\nThe presentation is about propagation.");
    sb.append(" \n\nThis program has been implemented with Processing, a Java development tool designed to facilitate the creation of visual structures.");
    text(sb.toString(), LEFT_MARGIN, 50, width - LEFT_MARGIN*2, 500);
    popMatrix();
  }
  

}

