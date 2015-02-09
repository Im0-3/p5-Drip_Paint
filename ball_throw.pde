GifRecorder recorder = new GifRecorder(this, 60, 3); //<>//
float base_color = 60;
int timer = 0;

ArrayList<Ball> ball = new ArrayList<Ball>();
void setup(){
  size(1500, 500);
  background(255);
  colorMode(HSB, 255);
  fill(200);
  frameRate(60);
  noStroke();
}

void draw(){
  background(255);
  smooth();
  
  //draw
  for (int i = 0; i < ball.size(); i++) {
    Ball part = ball.get(i);
    part.onDraw();
  }
  
  //remove
  for (int i = 0; i < ball.size(); i++) {
    Ball part = ball.get(i);
    if(part.finished()){
      ball.remove(i);
    }
  }

  //timer
  if(timer == 0){
    ball.add(new Ball(random(width), random(height)));
    timer ++;
  }else if(timer < 10){
    timer ++;
  }else if(timer >= 10){
    timer = 0;
  }
  
  recorder.onDraw();
}

class Ball{
  color c = color(base_color + (85 * floor(random(3))), 180, 240);
  float a = 255;
  float r = random(60,120);
  float pos_x;
  float pos_y;
  //splash
  int s_count = 0;
  float[] s_pos_x = new float[10];
  float[] s_pos_y = new float[10];
  //drop
  float d_count = 0;
  float d_pos_x;
  
  Ball(float x, float y){
    pos_x = x;
    pos_y = y;
    d_pos_x = x + random(r / 2) - (r / 4);
    for(int i = 0; i < 10; i++){
      s_pos_x[i] = splashPos(pos_x + (i * 2));
      s_pos_y[i] = splashPos(pos_y + (i * 2));
    }
  }
  
  float splashPos(float num){
    float val;
    val = num + random(r) - (r / 2);
    return val;
  }
  
  void onDraw(){
    if(d_count > 200){
      fadeOut();
    }
    drawSplash();
    drawDrop(); //<>//
  }
  
  void drawSplash(){
    fill(c, a);
    noStroke();
    ellipse(pos_x, pos_y, r, r);
    for(int i = 0; i < s_count; i++){
      ellipse(s_pos_x[i], s_pos_y[i], r - 30 - (i * 2), r - 30 - (i * 2));
    }
    if(s_count < 4){
      s_count ++;
    }
  }
  
  void drawDrop(){
    stroke(c, a);
    strokeWeight(r - (r * 0.8));
    line(d_pos_x, pos_y, d_pos_x, pos_y + d_count);
    d_count += random(0.5);
  }
  
  void fadeOut(){
    a -= 2;
  }
  
  boolean finished(){
    if(a <= 5){
      return true;
    }
    return false;
  }
}

void mouseClicked() {
  recorder.recordForSeconds("out.gif", 6); 
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "img.png" );
  }
}
