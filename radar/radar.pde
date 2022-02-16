//projeto radar

int getDist=0;
int getAng = 0;

int coordX=0;
int coordY=0;

int raz = 10/3;

void setup(){
  size(820,500);

}


void draw(){
  
  background(0,0,0);
  drawArcs();
  drawLines();
  drawText();
  
  delay(2000);
 
  getDist = int(random(150));
  getAng = int(random(180));
 
  coordX = calcPosX(getAng);
  coordY = calcPosY(getAng);
  
  int ajustX = ((width/2) - (coordX*raz));
  int ajustY = ((height) - (coordY*raz) );
  
  println("x: " + coordX + "  y: " + coordY);
  
  drawPoints(ajustX,ajustY);
  drawCoords(getDist,getAng,coordX,coordY);
}

void drawArcs(){
  smooth();
  int y = 500;
  int t = 150;
  stroke(0,255,0);
  strokeWeight(3);
  fill(0,200,0,50);
  for(int i = 7; i >= 1; i--){
    arc(width/2,y,t*i,t*i,PI,TWO_PI);
  }
}

void drawPoints(int x, int y){
  if(x <=10){
    x = 10;
  }
  if(y <=10){
    y = 10;
  }
  strokeWeight(10);
    stroke(250,0,0);
    point(x,y);
    delay(50);

}

void drawLines(){
  int y = 50;
  int x = 50;
  fill(0,200,0,1.25);
  strokeWeight(0.75);
  for(int i = 0; i < (height/y);i++){
    line(0,y*i,width,y*i);
  }
  for(int i = 0; i < (width/x); i++){
    line(x*i + 20,0,x*i + 20,height);
  }
}

void drawText(){
  int x = 0, y = 0;
  String posX = "";
  String pos = "",pos2 ="";
  fill(255);
  textSize(15);
  strokeWeight(5);
  for(int i = (height/50), t = 0; i >=0; i--, t++){
    y = 50*i;
    x = 15*t;
    posX = str(x);
    text(posX,3,y+15);
  }
  for(int i = 1; i <= 8; i++){
    pos = str(15*i);
    pos2 = str(15*i*(-1));
    text(pos,width/2 - (50*i + 10),height);
    text(pos2,width/2 + (50*i + 10),height);

  }

  
  text("0,0",width/2,height);
  
}
int calcPosX(int ang){
  float rad = radians(ang);
  float coss = cos(rad);
  int posX = int(coss* getDist);
    
  return posX;
}

int calcPosY(int ang){
  float rad = radians(ang);
  float sen = sin(rad);
  int posY = int(sen* getDist);
  
  //int ajustY = (height - posY);
  
  return posY;
}

void drawCoords(int dist,int angle, int x, int y){
  String textDist = str(dist);
  String textAng = str(angle);
  fill(255);
  textSize(15);
  strokeWeight(5);
  text("Dist: "+ textDist, width - 55,20);
  text("Ang: " + textAng,width-55,40);
  text("("+x+", "+y+")", width -55,70);
  
}

void drawVar(int a){
  int ang = abs(a);
  //if(ang > 51){ang = 51;}
  float rad = radians(ang);
  float tg = tan(rad);
  stroke(0,255,0);
  strokeWeight(5);
  int posY = int (tg*410);
  int ajust  = 500 - posY;
  if(ang < 90){
  line(0,ajust,width/2,height);
  }else if(ang == 90){
    line(width/2,0,width/2,height);
  }else{
    line(width,ajust,width/2,height);
  }
}
