class Ball {

  PShape circle;
  
  float x = 0;
  float y = 0;
  
  PVector location;  
  PVector speed;
  
  int size;

  color Color = color(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));

  Ball(int size) {
    this.size = size;
    this.location = new PVector(random(0, height), random(0, width));  
    this.speed = new PVector (random(-2, 2), random(-2, 2));
  }
  Ball(int size, float speed) {
    this.size = size;
    this.location = new PVector(random(this.size, height-this.size), random(this.size, width-this.size));   
    this.speed = new PVector (random(-speed, speed), random(-speed, speed));  
  }
  Ball(int size, int startingLocation) {
    this.size = size;
    this.location = new PVector(startingLocation, startingLocation);  
    this.speed = new PVector (random(-5, 5), random(-5, 5));
  }
  Ball(int size, int startingLocation, float speed) {
    this.size = size;
    this.location = new PVector(startingLocation, startingLocation);  
    this.speed = new PVector (speed, speed);
  }
  
  void Update() {  
    //Update Current Location 
    location = buildPVector();
    //Check for collition before the next Draw call
    Collition(); 
    //Finally call Draw call
    Draw();
  }
  
  PVector buildPVector() {
    PVector newLocation = new PVector(this.location.x + speed.x, this.location.y + speed.y);
    return newLocation;
  }

  void Draw() {  
    fill(this.Color);
    ellipse(this.location.x, this.location.y, this.size, this.size);
  }

  void Collition() {
    if (this.location.x - this.size/2 < 0) {
      this.speed.x *= -1;
      this.speed.x += random(-.2, .2);
    }
    if (this.location.x + this.size/2 > width) {
      this.speed.x *= -1;
      this.speed.x += random(-.2, .2);
    }
    if (this.location.y - this.size/2 < 0) {
      this.speed.y *= -1;
      this.speed.y += random(-.2, .2);
    }
    if (this.location.y + this.size/2 > height) {
      this.speed.y *= -1;
      this.speed.y += random(-.2, .2);
    }
  }

}
