class Button{
  private double total;
  private float bounce;
  private int freq, relay;
  private PImage img;
  Button(){
    total = 0;
    freq = 1;
    bounce = 1.0;
    relay = 10;
    img = loadImage("ClickArt/Snow.png");
  }
  
  void show(){
    if(relay > 4){
      bounce = 1;
    }
    else{
      relay++;
    }
    
    fill(80);
    circle(height/5,height/5,height/5*bounce);
    imageMode(CENTER);
    image(img, height/5, height/5,(height/6)*bounce,(height/6)*bounce);
  }
  
  public float getTotal(){
    return (float) total;
  }
  
  public void clicked(){
    total+= freq;
    bounce = 0.95;
    relay = 0;
  }
  
  public void addTo(double a){
    total+= a;
  }
  
  public void buyFrom(double a){
    total-=a;
  }
  
  public int getLen(){
    return ("" + total).length();
  }
}
