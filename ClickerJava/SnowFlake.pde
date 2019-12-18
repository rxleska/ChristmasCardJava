class SnowFlake{
  float posX, posY, initialAngle, size, radius;
  SnowFlake(){
    posX = 0;
    posY = random(-50,0);
    initialAngle = random(0, 2 * PI);
    size = random(2,5);
    radius = sqrt(random(pow(width /2, 2)));
  }
  Boolean update(float t){
    float w = 0.6;
    float angle = w * t + initialAngle;
    posX = width / 2 + radius * sin(angle);
    
    posY+= pow(size, 0.5);
    
    if(posY > height){
      int index = snowFlakes.indexOf(this);
      return true;
    }
    return false;
    
  }
  void display(){
    fill(255);
    circle(posX, posY, size);
  }
}
