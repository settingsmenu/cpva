//landscape assignment. featured is a ice cream mountainscape, above which cottoncandy clouds float by, the sky alternating color as the day passes.
//the marshmallow sun also acts as moon in the evening, lightly toasted. click the marshmallow to toggle between night and day in cute world
//dana kirk
//feb 11 2020
boolean button = false; //for day/night toggle
PImage floss, cherry;
float mtnX, mtnY, mtnW, mtnH, sunX, sunY, cloud, r, g, b; //the variables

void setup() {
  floss = loadImage("floss.png");
  cherry = loadImage("cherry.png");

  mtnW=width/1.5; //mountain width
  mtnH=height/1.3; //mountain height
  mtnX=100; //mountain x coord
  mtnY=height-150; //mountain y coord
  sunX=width-115; //marshmallow x coord
  sunY=60; //marshmallow y coord

  r=200; //red start color
  g=100; //green start color
  b=200; //blue start color

  size(600, 500); //canvas
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
}
void draw() {
  background(r, g, b); //variables!
  //SUN
  fill(255);
  ellipse(sunX, sunY-35, 70, 30);//marshmallow sun 'top'
  rect(sunX, sunY, 70, 75); //marshmallow sun 'body'
  stroke(100);
  strokeWeight(1);
  ellipse(sunX, sunY+40, 70, 30); //marshmallow sun bottom/dimension
  if (button) { //night time mode
    noStroke();
    fill(255, 218, 31, 50);//glow yellow
    background(0); //night black
    ellipse(sunX, sunY, 150, 150); //glow yellow circle
    fill(255);
    ellipse(sunX, sunY-35, 70, 30);//marshmallow sun 'top'
    rect(sunX, sunY, 70, 75); //marshmallow sun 'body'
    stroke(100);
    strokeWeight(1);
    ellipse(sunX, sunY+40, 70, 30); //marshmallow sun bottom/dimension
    //toasty part of sun. surely this could have been done in a less tedious manner but the text book is not there yet and i don't remember how to do arrays/objects/etc :(
    stroke(216, 189, 164); //toasty lines (top)
    line(sunX-35, sunY-41, sunX-35, sunY+3); //leftmost
    line(sunX-30, sunY-45, sunX-30, sunY+3); //right of leftmost
    line(sunX-25, sunY-47, sunX-25, sunY+2); //left left left lower
    line(sunX-20, sunY-47, sunX-20, sunY+2);//left left lower
    line(sunX-15, sunY-47, sunX-15, sunY+2); //left lower
    line(sunX-10, sunY-48, sunX-10, sunY); //left of leftmiddle
    line(sunX-5, sunY-48, sunX-5, sunY); //left of middle
    line(sunX, sunY-48, sunX, sunY); //middle line
    line(sunX+5, sunY-48, sunX+5, sunY); //right of middle
    line(sunX+10, sunY-48, sunX+10, sunY); //right of rightmiddle
    line(sunX+15, sunY-47, sunX+15, sunY+2); //right lower
    line(sunX+20, sunY-47, sunX+20, sunY+2); //right right lower
    line(sunX+25, sunY-47, sunX+25, sunY+2); //right right right lower
    line(sunX+30, sunY-45, sunX+30, sunY+3); //left of rightmost
    line(sunX+34, sunY-41, sunX+34, sunY+3); //rightmost 
    fill(216, 189, 164);
    ellipse(sunX, sunY+42, 14, 10); //to be toasted the marshmallow had to be on a stick first
  }
  if (cloud>=height/2 || cloud>=width/2) { //background flows thru colors with clouds along x axis
    //if the cloud is halfway across the screen or further (horizontally OR vertically),
    r=r+1; //increase amount of red by one per loop
    b=b-1; //decrease amount of blue by one per loop
    g=g+.5; //increase green by half
  } else { //OTHERWISE, if the cloud is NOT halfway across the screen or further (hor OR ver),
    b=b+1; //increase blue by one per loop
    r=r-1; //decrease red by one per loop
  }

  //ICE CREAM MOUNTAINS. this could have also been better streamlined
  noStroke();
  fill(134, 255, 187); //right scoop green
  ellipse(mtnX+width/2, mtnY+50, mtnW+width/4, mtnH+height/4); //right ice cream scoop
  stroke(31, 255, 130); //right scoop outline
  ellipse(mtnX+width/2, mtnY+190, mtnW/1.7, mtnH/2); //right scoop bottom - left
  ellipse(mtnX+width/1.15, mtnY+190, mtnW/1.7, mtnH/2); //right scoop bottom - right
  noStroke();
  fill(255); //right snowtop white
  ellipse(mtnX+300, mtnY-115, mtnW-50, mtnH/2); //right snowtop
  fill(255, 175, 227); //left scoop pink
  ellipse(mtnX, mtnY, mtnW, mtnH); //left ice cream scoop
  stroke(255, 31, 177, 80); //icecream outline (left)
  ellipse(mtnX+200, mtnY+150, mtnW/2, mtnH/2); //bottom part of left scoop - right
  ellipse(mtnX, mtnY+150, mtnW/2, mtnH/2); //bottom of left - left
  noStroke();
  fill(255);
  ellipse(mtnX, mtnY-100, mtnW-100, mtnH/2.1); //left snowtop

  //COTTONCANDY CLOUD
  tint(255, 255); //need this tint for cherry, or else the candy floss opacity applies to the cherry as well
  cherry.resize(0, 175);
  image(cherry, mtnX-20, mtnY-290);
  floss.resize(0, 210);
  tint(255, 175); //lowered opacity of cloud
  image(floss, cloud, -20); //middle cloud
  image(floss, cloud+250, 20); //rightmost cloud
  image(floss, cloud-160, 10); //leftmost cloud
  cloud= cloud+1; //move clouds & reset when off screen(right)
  if (cloud>=width+width/2) {//if the cloud's distance is beyond the canvas width and a half,
    cloud=-width/1.2 ; //then the cloud will reset off screen(left)
  }
}
void mousePressed() {
  if (mouseX>445&&mouseX<525&&mouseY>11&&mouseY<120) { //if click marshmallow to toggle light,
    button=!button; // then button will become its boolean opposite
 
}
}
