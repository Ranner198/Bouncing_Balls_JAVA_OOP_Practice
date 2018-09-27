import javax.swing.*; 
import processing.video.*;

//Camera
Capture cam;
  
JCheckBox gravityCheck = new JCheckBox("Gravity: ");
JCheckBox deathCheck = new JCheckBox("Ball Life: ");
JCheckBox trail = new JCheckBox("Trail: ");
JCheckBox camCapture = new JCheckBox("Enabled: ");
String msg1 = "Gravity"; 
String msg2 = "Enable Ball Lifetime";
String msg3 = "Ball Trail Effect";
String msg4 = "Camera Capture";
Object[] msgContent = {msg1, gravityCheck, msg2, deathCheck, msg3, trail, msg4, camCapture}; 

String input = JOptionPane.showInputDialog(frame, "Num of balls: ");

int n = JOptionPane.showConfirmDialog(null, msgContent,  "Title", 
JOptionPane.YES_NO_OPTION); 

boolean Gravity = gravityCheck.isSelected();
boolean Death = deathCheck.isSelected();
boolean Trail = trail.isSelected();
boolean camEnabled = camCapture.isSelected(); 

int maxLife = 180, minLife = 100;

float speed = 6;
int size = 30;
int numOfBalls = Integer.parseInt(input);

int[] lifeLength = new int[numOfBalls];

Ball[] ball = new Ball[numOfBalls];

color transparency = color(0, 0, 0, 30);


void setup() {
  colorMode(RGB);
  size (800, 750);
  frameRate(30);
  for(int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(size, speed, Death); 
    lifeLength[i] = floor(random(minLife, maxLife));
  }
  background(0);
  
  //Get Camera Input
  if (camEnabled) {
    String[] cameras = Capture.list();
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  
  if (camEnabled) {
  cam.read();
  image(cam, 0, 0); 
  }
  
  if (Trail) {
    fill(transparency);
    rect(-1, -1, 801, 751);
  } 
  else
    background(0);

  for(int i = 0; i < ball.length; i++) {
    ball[i].Update(Gravity);
    if (ball[i].currLife >= lifeLength[i]) {
      ball[i] = null;
      ball[i] = new Ball(size, speed, Death);
    }
  }
} //<>//
