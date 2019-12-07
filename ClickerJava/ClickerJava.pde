//Instantiate Arrays and Objects
Button button;
Store store;
int counter;
Sign sign;
int[] items;
ArrayList<SnowFlake> snowFlakes;
int snowFreq;
String version = "JAVA 1";

//Setup
void setup(){
  //Setup frame
  size(800,800);
  background(100);
  
  //initalize objects
  button = new Button();
  store = new Store();
  sign = new Sign();
  snowFlakes = new ArrayList<SnowFlake>();
  
  
  //create Array of item counters
  items = new int[10];
  items[0] = 0;  
  items[1] = 0;
  items[2] = 0;
  items[4] = 0;
  items[5] = 0;
  items[6] = 0;
  items[7] = 0;
  items[8] = 0;
  items[9] = 0;
  
  //other settings
  textSize(height * 0.04);
  counter = 0;
  imageMode(CENTER);
}

//Draw
void draw(){
  int lenOfTot = button.getLen();
  
  snowFreq = lenOfTot < 20 ? 1 : lenOfTot-19;
  
  addFlakes();
  
  background(30);
  
  sign.drawSign();
  
  //Snow build-up
  fill(255);
  rect(0, height, width,-((height/1000000000000f)*button.getTotal()));
  
  //snow anglur speed
  
  float t = frameCount / 240;
  fill(255);
  
  //Snow Creation Speed
  if(counter < 20- lenOfTot){
    counter ++;
  }
  else{
    createSnow();
    counter = 0;
  }
 
  moveSnow(t);
  
  button.show();
  
  store.show();
  
  fill(0,255,255);
  textAlign(LEFT);
  textSize(height* 0.04);
  text(store.formatMon(button.getTotal()),80,height/20);
  
  textAlign(LEFT);
  fill(0,255,255);
  textSize(height * 0.03);
  text(version, width/60, height-(height * 0.01));
  
  sign.signMove();
  
  
  //display drop downs on store items 
  info();
}

void moveSnow(float t){
  for (SnowFlake flake : snowFlakes) {
    if(flake.update(t)){
      moveSnow(t);
      break;
    } // update snowflake position
    flake.display(); // draw snowflake
  }
}

void mouseClicked(){
  //check for snow button click
  float d = dist(mouseX, mouseY, height/5,height/5);
  if(d < height/10){
    button.clicked();
  }
  
  //check for item buy
  for(int i = 0; i < 10; i++){
    d = dist(mouseX, mouseY, store.getPoint(i).x, store.getPoint(i).y);
      if(d < height*0.04){
        if(store.canBuy(i)){
          button.buyFrom(store.getCost(i));
          items[i]++;
        }
        
      }
   }
}

void addFlakes(){
  for(int i = 0; i < 10; i++){
    button.addTo((items[i])*store.getTypeVal(i)/60);
  }
}

void info(){
  for(int i = 0; i < 10; i++){
    float d = dist(mouseX, mouseY, store.getPoint(i).x, store.getPoint(i).y);
      if(d < height*0.04){
        textAlign(RIGHT);
        textSize(height* 0.015);
        text(getInfo(i), width-100, (height/10)*(i)+(0.072*height));
        
      }
   }
}

//gets Info of each item
public String getInfo(int a){
  switch(a){
      case 0:
        return "COST:" + store.formatMon(store.getCost(a)) + "\n More blenders for kids to blend ice cubes.";
      case 1:
        return "COST:" + store.formatMon(store.getCost(a)) + "\n Just plug it in and turn it on, summer skiing here we come!";
      case 2:
        return "COST:" + store.formatMon(store.getCost(a)) + "\n Hey, it looks kinda like snow.";
      case 3:
        return "COST:" + store.formatMon(store.getCost(a)) + "\n Good enough for buck hill, good enough for me.";
      case 4:
        return "COST:" + store.formatMon(store.getCost(a)) + "\n Canada always has Snow, eh?";
      case 5:
        return "COST:" + store.formatMon(store.getCost(a)) + "\n These look even more like snow.";
      case 6:        
        return "COST:" + store.formatMon(store.getCost(a)) + "\n This is how we'll fix global warming!";
      case 7:        
        return "COST:" + store.formatMon(store.getCost(a)) + "\n Most usefull task for a portal right?";
      case 8:        
        return "COST:" + store.formatMon(store.getCost(a)) + "\n I control the Weather - Bill Murray (Groundhog Day:1993)";
      case 9:        
        return "COST:" + store.formatMon(store.getCost(a)) + "\n Sun melts snow, less sun, more snow.";
  }
  return "";
}

void createSnow(){
  for(int i = 0; i < snowFreq; i++){
    snowFlakes.add(new SnowFlake()); // append snowflake object
  }
}
