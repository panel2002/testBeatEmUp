class Animation{
    PImage[] attackImages;
    PImage[] walkImages;
    int imageAttackCount;
    int imageWalkCount;
    int frame;
    
    Animation(int count,int column) {
      int positionX = 0,positionY = 0;
      imageAttackCount = count;
      attackImages = new PImage[imageAttackCount];
      PImage placeHolder;
      String filename=dataPath("");
      placeHolder = loadImage(filename+"//"+"attack.png");
      for (int i = 0, j = 1; i < imageAttackCount; i++,j++) {
        // Use nf() to number format 'i' into four digits
        attackImages[i] = placeHolder.get(positionX, positionY, 2380, 2380);
        positionX += 2380;
        if (j == column){
          positionX = 0;
          positionY+=2380;
          j  = 1;
        }
      }
      
      
    }
    
    
    void getWalk(int count,int column){
      int positionX = 0,positionY = 0;
      imageWalkCount = count;
      walkImages = new PImage[imageWalkCount];
      PImage placeHolder2;
      String filename=dataPath("");
      placeHolder2 = loadImage(filename+"//"+"walk.png");
      positionX = 0;
      positionY = 0;
      for (int i = 0, j = 1; i < imageWalkCount; i++,j++) {
        // Use nf() to number format 'i' into four digits
        walkImages[i] = placeHolder2.get(positionX, positionY, 2380, 2380);
        positionX += 2380;
        if (j == column){
          positionX = 0;
          positionY+=2380;
          j  = 1;
        }
      }
    
    }
    
  
    void play(float xpos, float ypos) {
      //while (frame < 18){
        background(40);
        image(attackImages[frame],xpos, ypos,imgX,imgY);
        frame = (frame+1)%imageAttackCount;
        frameRate(30);
      //}
      
    }
    void walk(float xpos, float ypos){
        background(40);
        image(walkImages[frame],xpos, ypos,imgX,imgY);
        frame = (frame+1)%imageAttackCount;
        frameRate(30);
    }
    
    void idle(float xpos, float ypos) {
      background(40);
      image(attackImages[0], xpos, ypos,imgX,imgY);
    }
    
    int getWidth() {
      return attackImages[0].width;
    }
}
