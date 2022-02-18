
void setup(){
  size(820,500);
}

int ang = 0;

void draw(){
    background(0);
    drawVar(91);
    delay(1000);
}

void drawVar(int ang){
  
  stroke(255);
  strokeWeight(5);
  
  int ang2 = ang > 90 ? 180 - ang : ang;
  float rad = radians(ang2);
  float tg = tan(rad);
  int posX = int(height/tg);
  int posY = int((width/2) * tg);
  int ajustX = 0,ajustY = 0;
  if(posY > height){
    posY = height;
  }
  if(posY < 0){
    posY = 0;
  }
  if(posX > width){
    posX = width;
  }
  
  if(ang < 90){
    if(ang2 <= 50){
      ajustY = height - posY;
      line(width/2,height,0,ajustY);
    }else{
      ajustX = width/2 - posX;
      line(width/2,height,ajustX,0); 
    } 
  }
  else if(ang == 90){
    line(width/2,height,width/2,0);
  }
  else{
    if(ang2 <= 50){
      ajustY = height - (posY);
      line(width/2,height,width,ajustY);
    }else{
      ajustX =posX + width/2;
      line(width/2,height,ajustX,0);
    }
  }
  println("ang: " + ang2 + "| posX: "+ posX +" posY: "+ posY);
}
