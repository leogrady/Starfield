
Particle [] cluster;

void setup()
 {
   size (600,600);
   cluster = new Particle[1500];
   for (int i = 0; i < cluster.length; i++)
       cluster[i] = new NormalParticle();
       cluster[1498] = new Jumbo();
       cluster[1499] = new Oddball();
 }
 
 void draw()
 {
     background (0);
       for (int i = 0; i <cluster.length;i++)
       {
         cluster[i].move();
         cluster[i].show();
       }
 }

 
 class NormalParticle implements Particle
 {
   double partX,partY,partAngle,partSpeed;
   int partColor;
   NormalParticle()
   {
     partX = partY = 300;
     double pi2 = 2*PI;
     partColor = (int)(Math.random()*200);
     partAngle = (Math.random()*Math.PI*2);
     partSpeed = (Math.random()*5+1);
   } 
   public void move()
   {
     partX = partX + ((Math.cos(partAngle))*(partSpeed));
     partY = partY + ((Math.sin(partAngle))*(partSpeed));
   }
   public void show()
   {
     stroke (255,partColor,0);
     strokeWeight(1);
     ellipse ((float)partX-10, (float)partY-10, 3,3);
     line (300,300,(float)partX, (float)partY);
   }
 }
 
 interface Particle
 {
   public void show();
   public void move();
 }
 
 class Jumbo extends NormalParticle{
    public void show()
   {
  stroke(0,0,200);
  fill (0,0,200);
  ellipse ((float)partX,(float)partY,35,35);
  fill (0,200,0);
  noStroke();
  triangle((float)partX-10,(float)partY-5,(float)partX,(float)partY-12,(float)partX+10,(float)partY-10);
  triangle((float)partX-10,(float)partY-10,(float)partX+10,(float)partY,(float)partX-10,(float)partY+10);
  triangle((float)partX-10,(float)partY,(float)partX+5,(float)partY,(float)partX+15,(float)partY+10);
   }
    
 }
 
  class Oddball implements Particle 
 {
   int rockX, rockY;
   Oddball()
   {
     rockX = 700;
     rockY = -100;
   } 
   public void move()
   {
     rockX = rockX-10;
     rockY = rockY+10;
   }
   public void show()
   {
     noStroke();
    fill (100);
    rect (rockX-20,rockY-20,40,40,10);
    beginShape();
    vertex (rockX, rockY-25);
    vertex (rockX + 25, rockY);
    vertex (rockX, rockY+25); 
    vertex (rockX - 25,rockY);  
    vertex (rockX, rockY-25); 
    endShape();
    fill (180);
    ellipse (rockX-10,rockY+5,5,5);
    ellipse (rockX+10,rockY+15,7,5);
    ellipse (rockX-1,rockY-13,10,10);
    ellipse (rockX+15,rockY-8,7,5);
    stroke (255,0,0);
    strokeWeight(5);
    line (rockX+30, rockY-30,rockX+70, rockY-70);
    line (rockX+15, rockY-35,rockX+55, rockY-75);
   }
 }
