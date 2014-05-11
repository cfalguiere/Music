/**
 * Animation World
 */
class AnimationWorld extends World implements KeySubscriber {
  Scene0Being scene0;
  Scene1Being scene1;
  Scene2Being scene2;
  Scene3Being scene3;
  int scene;
  
  AnimationWorld(int portIn, int portOut) {
    super(portIn, portOut);
  }

  void setup() {
    scene0 = new Scene0Being(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    register(scene0);
    
    scene1 = new Scene1Being(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    register(scene1);
   
    scene2 = new Scene2Being(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    register(scene2);
    
    scene3 = new Scene3Being(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    register(scene3);
    
    subscribe(this, POCodes.Key.LEFT);
    subscribe(this, POCodes.Key.RIGHT);    

  }
  
  void update() {
    super.update();
    
    if (frameCount < 1000) {
      println("scene 0");
      scene0.startFrameCount = frameCount;
      scene0.playing = true;
    } else if (frameCount < 1900) {
      println("going to scene 1");
      scene0.playing = false; 
      scene1.startFrameCount = frameCount;
      scene1.playing = true;
    } else if (frameCount < 2800) {
      scene1.playing = false;
      scene2.startFrameCount = frameCount;
      scene2.playing = true;
    } else  {
      scene2.playing = false;
      scene3.startFrameCount = frameCount;
      scene3.playing = true;
    }
  }
  
  void draw() {
      super.draw();
  }

  public void receive(KeyMessage m) {
    println("key");
    int code = m.getKeyCode();
    if (m.isPressed()) {
      if (code == POCodes.Key.LEFT) {
         scene = scene--;
      } 
      if (code == POCodes.Key.RIGHT) {
         scene = scene++;
      } 
    } 
  }

}

