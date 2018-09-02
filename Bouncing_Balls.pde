import javax.swing.*;

JCheckBox checkBox = new JCheckBox("Gravity: ");

String msg = "Gravity?"; 

Object[] msgContent = {msg, checkBox}; 

String input = JOptionPane.showInputDialog(frame, "Num of balls: ");

int n = JOptionPane.showConfirmDialog(null, msgContent,  "Title", 
JOptionPane.YES_NO_OPTION); 

boolean Gravity = checkBox.isSelected();

float speed = 6;
int size = 30;
int numOfBalls = Integer.parseInt(input);

int maxLife = 180, minLife = 100;

int[] lifeLength = new int[numOfBalls];

Ball[] ball = new Ball[numOfBalls];

void setup() {
  colorMode(RGB);
  size (800, 750);
  frameRate(30);
  for(int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(size, speed); 
    lifeLength[i] = floor(random(minLife, maxLife));
  }
}

void draw() {
  background(0);
  for(int i = 0; i < ball.length; i++) {
    ball[i].Update(Gravity);
    if (ball[i].currLife >= lifeLength[i]) {
      ball[i] = null;
      ball[i] = new Ball(size, speed);
    }
  }
} //<>//
