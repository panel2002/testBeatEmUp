PGraphics pg;
PImage photo;
Animation anime;
boolean clicked = false;
boolean jump = false;
float posX = 0;
float velocityX = 0;
float t = 0;
float g;
float bottom = 700;
float posY = bottom;
float imgX = 100, imgY = 100;
float accelerationY = 0;
float velocityY = 0;
float speedCap = 15;

boolean stop = true;
boolean leftMove;


void setup() {
  size(1600, 900);
  anime = new Animation(5,5);
  anime.getWalk(8,3);
  background(40);
}




void draw() {
  
  frameRate(30);
  if (!jump){
    g = 1;
  }
  else {
    g = 0.25;
  }
  
  
  posY += velocityY + g;
  
  if (posY < bottom){
    velocityY += g;
  }
  else {
    velocityY = 0;
    posY = bottom;
  }
  
  
  
  
  if (mousePressed || (clicked && anime.frame < 5)){
    if (posY == bottom) velocityX *= 0.75f;
    clicked = true;
    anime.play(posX,posY);
    if (anime.frame == 4){
      clicked = false;
      anime.frame = 0;
    //  anime.idle(posX,posY);
    }
  }
  else if (!stop){
    if(leftMove){ 
      if (velocityX > -speedCap) velocityX-=1.5;
      if(posX <= 0) velocityX = 0;
      anime.walk(posX, posY);
    }
    else {
      if (velocityX < speedCap) velocityX+=1.5;
      if(posX >= (1600-100)) velocityX = 0;
      anime.walk(posX,posY);
    }
  }
  
    
  else {
    velocityX *= 0.75f;
    anime.frame = 0;
    anime.idle(posX,posY);
  }
  
  
  
  
  if(posX > (1600-100)) {
    velocityX = 0;
    posX = 1600-100;
  }
  if(posX <0){
    velocityX = 0;
    posX = 0;
  }
  posX += velocityX;


  
}




boolean hitWall(){
  return (posX <=0 || posX>=(1600-100));
}


void keyPressed(){
  if (key == ' ' && posY >= bottom){
    velocityY = -10;
    jump = true;
  }
  if (key == 'a' || key == 'A'){
    if (posX > 0){
      stop = false;
      leftMove = true;
    }
  } else if (key == 'd' || key == 'D'){
    if (posX < (1600-100)){
      stop = false;
      leftMove = false;
    }
  }
  
}


void keyReleased(){
  if (key == ' '){
    jump = false;
  }
  if (key == 'a' || key == 'A'){
    stop = true;
    anime.frame = 0;
  } else if (key == 'd' || key == 'D'){
    stop = true;
    anime.frame = 0;
  }
}

void dynamicGravity(){
  
}
