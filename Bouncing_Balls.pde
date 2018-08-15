import javax.swing.*;

String input = JOptionPane.showInputDialog(null, "Enter Num of Balls: ");

float speed = 6;
int size = 30;
int numOfBalls = Integer.parseInt(input);

Ball[] ball = new Ball[numOfBalls];

void setup() {
  colorMode(RGB);
  for(int i = 0; i < ball.length; i++)
    ball[i] = new Ball(size, speed);
  size(600, 600);
  frameRate(30);
}

void draw() {
  background(0);
  for(int i = 0; i < ball.length; i++) {    
    ball[i].Update();
  }
}
