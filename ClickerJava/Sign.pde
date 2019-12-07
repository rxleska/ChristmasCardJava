import java.util.Map;

class Sign{
  private float posX, posY;
  int word;
  private String[] words;
  Sign(){
    posX = (height/80) + (height/2);
    posY = ((height*9)/10);
    words = new String[12];
    words[0] = "GOOD MORNING ROSEMOUNT, HAVE A NICE DAY";
    words[1] = "THIS IS A TEST OF OUR EMERGENCY SERVICES";
    words[2] = "SCHOOL IS DELAYED 2 HOURS";
    words[3] = "AFTER SCHOOL ACTIVITIES CANCLED: VOLLY BALL, SOCCER, TENNIS. FOOTBALL IS STILL ON!";
    words[4] = "SCHOOL CANCLED TOMMARROW";
    words[5] = "SCHOOL CANCLED FOR 3 DAYS";
    words[6] = "SCHOOL CANCELED FOR THE WEEK";
    words[7] = "SCHOOL CANCLED UNTIL FURTHER NOTICE";
    words[8] = "Polar Bears Migrating north to warm up";
    words[9] = "PLOWS IMPROVED SCHOOL IS NO LONGER CANCLED";
    words[10] = "SCHOOL IS CANCLED AGAIN";
    words[11] = "THE SKY IS WHITE THERE IS NO TOMORROW";
  }
  void drawSign(){
    push();
    translate(height/80,0);
    fill(203, 65, 84);
    rect(0,height/1.5,height/2, height/3);
    fill(0);
    textSize(height/12);
    textAlign(CENTER);
    text("RHS", height/4, height/1.3);
    fill(100,255,100);
    rect(0,(height*8.5)/10,height/2,height/15);
    fill(0,255,255);
    pop();
    
    textAlign(LEFT);
    textSize(height*0.03);
    fill(255,0,255);
    text(words[word], posX,(height*9)/10);
    
    push();
    noStroke();
    fill(30);
    rect(0,height/1.5, height/75,height/3);
    rect((height/80) + (height/2),height/1.5, width,height/3);
    pop();
  }
  void signMove(){
    
    posX =  posX > - (words[word].length() * 20) ?  posX-1 : (height/80) + (height/2);
    if(posX == (height/80) + (height/2)){
      word = (button.getLen()/2);
    }
  }
}
