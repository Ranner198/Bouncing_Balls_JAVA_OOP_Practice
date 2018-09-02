class Ball {

  PShape circle;
  
  float x = 0;
  float y = 0;
  
  PVector location;  
  PVector speed;
  
  float damping = 0.6, _frameRate;
  
  int size;
  
  public int currLife;

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
  
  void Update(boolean gravity) {
    currLife++;
    _frameRate = 30;
    //Update Current Location 
    location = buildPVector();
    //Check for collition before the next Draw call
    Collition(); 
    //Speed
    if (gravity)
      Speed();
    else
      this.damping = 1;
    //Finally call Draw call
    Draw();
  }

  PVector buildPVector() {
    PVector newLocation;
    newLocation = new PVector(this.location.x + speed.x, this.location.y + speed.y);
    return newLocation;
  }

  void Draw() {  
    fill(this.Color);
    ellipse(this.location.x, this.location.y, this.size, this.size);
  }
  
  void Speed() {
    speed = new PVector(this.speed.x, this.speed.y + (9.81/_frameRate)); 
  }
  
  void Collition() {
    
    if (this.location.x - this.size/2 < 0) {
      this.location.x = this.size/2;
      this.speed.x = this.speed.x * damping;
      this.speed.x *= -1;
    }
    if (this.location.x + this.size/2 > width) {  
      this.location.x = width - this.size/2;
      this.speed.x = this.speed.x * damping;
      this.speed.x *= -1;
    }
    if (this.location.y - this.size/2 < 0) { 
      this.location.y = this.size/2;
      this.speed.y = this.speed.y * damping;
      this.speed.y *= -1;
    }
    if (this.location.y + this.size/2 > height) {
      this.location.y = height - this.size/2;
      this.speed.y = this.speed.y * damping;
      this.speed.y *= -1;
    }
  }

}
