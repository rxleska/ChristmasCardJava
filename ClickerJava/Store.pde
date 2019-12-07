class Store{
  PImage[] imgArr;
  float[] typeVal;
  String[] names;
  PVector[] posArr;
  Store(){
    imgArr = new PImage[10];
    imgArr[0] = loadImage("../ClickArt/Blender.png");
    imgArr[1] = loadImage("../ClickArt/SnowCone.png");
    imgArr[2] = loadImage("../ClickArt/HolePuncher.png");
    imgArr[3] = loadImage("../ClickArt/Ski.png");
    imgArr[4] = loadImage("../ClickArt/CanTru.png");
    imgArr[5] = loadImage("../ClickArt/Scis.png");
    imgArr[6] = loadImage("../ClickArt/AC.png");
    imgArr[7] = loadImage("../ClickArt/Portal.png");
    imgArr[8] = loadImage("../ClickArt/Weat.png");
    imgArr[9] = loadImage("../ClickArt/Earth.png");
    
    typeVal = new float[10];
    typeVal[0] = 0.1 ;
    typeVal[1] = 1;
    typeVal[2] = 8;
    typeVal[3] = 47;
    typeVal[4] = 260;
    typeVal[5] = 1400;
    typeVal[6] = 7800;
    typeVal[7] = 44000;
    typeVal[8] = 260000;
    typeVal[9] = 1600000;
    
    names = new String[10];
    names[0] = "Blenders";
    names[1] = "Snow Cone Machines";
    names[2] = "Paper Hole punchers";
    names[3] = "Ski Snow Blasters";
    names[4] = "Canada Snow Shipments";
    names[5] = "Scissors for Paper Flakes";
    names[6] = "Outside AC Machines";
    names[7] = "Portals To Antartica";
    names[8] = "Weather Machines";
    names[9] = "Earth Movers";
    
    posArr = new PVector[10];
  }
  void show(){
    textAlign(RIGHT);
    for(int i = 0; i < 10; i++){
      if(store.canBuy(i)){
        fill(255,0,0);
      }
      else{
        fill(200);
      }
      circle(width-(0.05*height), (height/10)*(i+1)-(0.05*height), 0.08*height);
      posArr[i] = new PVector(width-(0.05*height), (height/10)*(i+1)-(0.05*height));
      fill(0,255,255);
      textSize(height* 0.02);
      text(names[i]+ "   " + store.formatMon(items[i]), width-100, (height/10)*(i+1)-(0.045*height));
      image(imgArr[i], width-(0.05*height), (height/10)*(i+1)-(0.05*height),0.06*height,0.06*height);
    }
  }
  
  public float getTypeVal(int a){
    return typeVal[a];
  }
  
  public PVector getPoint(int a){
    return posArr[a];
  }
  
  public Boolean canBuy(int a){
    double c = button.getTotal();
    if(c >= store.getCost(a)){
      return true;
    }
    return false;
  }
  
  public float getCost(int a){
    switch(a){
      case 0:
        return floor((float)((float)15  * (Math.pow(1.15, items[a]))));
      case 1:
        return floor((float)((float)100  * (Math.pow(1.15, items[a]))));
      case 2:
        return floor((float)((float)1100  * (Math.pow(1.15, items[a]))));
      case 3:
        return floor((float)((float)12000  * (Math.pow(1.15, items[a]))));
      case 4:
        return floor((float)((float)130000  * (Math.pow(1.15, items[a]))));
      case 5:
        return floor((float)((float)1400000  * (Math.pow(1.15, items[a]))));
      case 6:
        return floor((float)((float)20000000  * (Math.pow(1.15, items[a]))));
      case 7:
        return floor((float)((float)330000000  * (Math.pow(1.15, items[a]))));
      case 8:
        return floor((float)(5100000000f  * (Math.pow(1.15, items[a]))));
      case 9:
        return floor((float)(75000000000f  * (Math.pow(1.15, items[a]))));
    }
    return 0;
  }
  String formatMon(float x){
    if(x >            1000000000000000000000000000000000000f){
      String d = "" + x; 
      return "" + nf(x, 5,2) + " e" + (d.length() -1);
    }
    else if(x >      1000000000000000000000000000000000f){
      return floor(x/10000000000000000000000000000000f)/100 + " Dec";
    }
    else if(x >      1000000000000000000000000000000f){
      return floor(x/10000000000000000000000000000f)/100 + " Non";
    }
    else if(x >      1000000000000000000000000000f){
      return floor(x/10000000000000000000000000f)/100 + " Oct";
    }
    else if(x >      1000000000000000000000000f){
      return floor(x/10000000000000000000000f)/100 + " Sept";
    }
    else if(x >      1000000000000000000000f){
      return floor(x/10000000000000000000f)/100 + " Hex";
    }
    else if(x >      1000000000000000000f){
      return floor(x/10000000000000000f)/100 + " Quin";
    }
    else if(x >      1000000000000000f){
      return floor(x/10000000000000f)/100 + " Quad";
    }
    else if(x >      1000000000000f){
      return floor(x/10000000000f)/100 + " T";
    }
    else if(x >      1000000000){
      return floor(x/10000000)/100 + " B";
    }
    else if(x >      1000000){
      return floor(x/10000)/100 + " M";
    }
    else if(x >      1000){
      return floor(x/10)/100 + " K";
    }
    return "" + floor(x);
  }
}
