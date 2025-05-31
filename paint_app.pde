PImage smile;
PImage iconSmile;

PImage star;
PImage iconStar;

PImage joke;
PImage iconJoke;

PImage meme;
PImage iconMeme;

color black = 0;
color grey = 74;
color lightGrey = 150;
color white = 255;
color active = 0;

float sliderX = 80;
boolean change = false;
float hue = 0;
float thickness = 10;
boolean changeScale = false;
float sliderY = 330;
boolean isDraw = false;
int s = 150;
boolean isSmile = false;
String state = "draw";
boolean wipe = false;

void setup() {
  size(800,550);
  background(white);
  strokeWeight(7);
  colorMode(HSB);
  textAlign(CENTER, CENTER);
  
  //images
  smile = loadImage("elims.png");
  smile.resize(int(thickness*5),int(thickness*5));
  iconSmile = loadImage("elims.png");
  iconSmile.resize(20,20);
  
  star = loadImage("star2.0.png");
  star.resize(int(thickness*5),int(thickness*5));
  iconStar = loadImage("star2.0.png");
  iconStar.resize(20,20);
  
  joke = loadImage("joke.png");
  joke.resize(int(thickness*5),int(thickness*5));
  iconJoke = loadImage("joke.png");
  iconJoke.resize(20,20);
  
  meme = loadImage("Trollface.png");
  meme.resize(int(thickness*5),int(thickness*5));
  iconMeme = loadImage("Trollface.png");
  iconMeme.resize(20,20);
}

void draw() {
  //clear screen
  if(wipe) {
    background(white);
    wipe = false;
    
  }
  
  //draw
  if(isDraw && mouseX > 120) {
    if(state == "draw") {
      strokeWeight(thickness*2);
      if(s == 0) strokeWeight(thickness * 4);
      stroke(active);
      line(mouseX,mouseY, pmouseX,pmouseY);
    } else if(state == "smile") {
      smile.resize(int(thickness*5),int(thickness*5));
      image(smile, mouseX-thickness*5/2, mouseY-thickness*5/2);
      isDraw = false;
    } else if(state == "star") {
      star.resize(int(thickness*5),int(thickness*5));
      image(star, mouseX-thickness*5/2, mouseY-thickness*5/2);
      isDraw = false;
    } else if(state == "joke") {
      joke.resize(int(thickness*5),int(thickness*5));
      image(joke, mouseX-thickness*5/2, mouseY-thickness*5/2);
      isDraw = false;
    } else {
      meme.resize(int(thickness*5),int(thickness*5));
      image(meme, mouseX-thickness*5/2, mouseY-thickness*5/2);
      isDraw = false;
    }
  }
  
  
  //tool box
  noStroke();
  fill(grey);
  active = color(hue, s ,300);
  rect(0,0, 120,height);
  
  //the active colour
  strokeWeight(7);
  stroke(black);
  fill(active);
  circle(60,60, 100);
  
  //colour select slider
  if(change) sliderX = mouseX;
  sliderX = constrain(sliderX,15,105);
  hue = map(sliderX, 15,105, 0,230);
  strokeWeight(7);
  fill(black);
  stroke(white);
  line(15,130, 105,130);
  stroke(black);
  fill(black);
  strokeWeight(8);
  line(15,130, sliderX,130);
  noStroke();
  circle(sliderX, 130, 20);
  
  //eraser button
  stroke(black);
  fill(white);
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 145 && mouseY < 195 || s == 0) fill(lightGrey);
  rect(20,150, 80, 40);
  pushMatrix();
  translate(60,170);
  rotate(radians(255));
  fill(white);
  rect(-8,-16, 16,32, 5);
  fill(grey);
  strokeWeight(5);
  rect(-8,16, 16,-23, 5);
  popMatrix();
  
  //smile button
  stroke(black);
  fill(white);
  if (mouseX >= 15 && mouseX <= 55 && mouseY > 205 && mouseY < 245 || state == "smile") fill(lightGrey);
  strokeWeight(7);
  rect(20,210, 30,30);
  pushMatrix();
  image(iconSmile, 25,215);
  popMatrix();
  
  //star button
  stroke(black);
  fill(white);
  if (mouseX >= 65 && mouseX <= 105 && mouseY > 205 && mouseY < 245 || state == "star") fill(lightGrey);
  strokeWeight(7);
  rect(70,210, 30,30);
  image(iconStar, 75,215);
  
  //joke button
  stroke(black);
  fill(white);
  if (mouseX >= 15 && mouseX <= 55 && mouseY > 255 && mouseY < 295 || state == "joke") fill(lightGrey);
  strokeWeight(7);
  rect(20,260, 30,30);
  image(iconJoke, 25,265);
  
  //meme button
  stroke(black);
  fill(white);
  if (mouseX >= 65 && mouseX <= 105 && mouseY > 255 && mouseY < 295 || state == "meme") fill(lightGrey);
  strokeWeight(7);
  rect(70,260, 30,30);
  image(iconMeme, 75,265);
  
  //stroke weight slider
  if(changeScale) sliderY = mouseY;
  sliderY = constrain(sliderY,310,400);
  thickness = map(sliderY, 310,400, 50,5);
  strokeWeight(7);
  fill(black);
  stroke(white);
  line(60,310, 60,400);
  stroke(black);
  fill(black);
  strokeWeight(8);
  line(60,sliderY, 60,400);
  noStroke();
  circle(60, sliderY, 20);
  
  //clear button
  stroke(black);
  fill(white);
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 415 && mouseY < 455) fill(lightGrey);
  rect(20,420, 80, 30);
  textSize(20);
  fill(black);
  text("clear", 60, 435);
  
  //load button
  stroke(black);
  fill(white);
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 460 && mouseY < 500) fill(lightGrey);
  rect(20,465, 80, 30);
  textSize(20);
  fill(black);
  text("load", 60, 480);
  
  //save button
  stroke(black);
  fill(white);
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 505 && mouseY < 545) fill(lightGrey);
  rect(20,510, 80, 30);
  textSize(20);
  fill(black);
  text("save", 60, 525);
}

void mousePressed() {
  //sliders
  if (mouseX >= 0 && mouseX <= 120 && mouseY > 120 && mouseY < 140) {
    change = true;
    state = "draw";
    s = 150;
  }
  if (mouseX >= 0 && mouseX <= 120 && mouseY > 300 && mouseY < 410) changeScale = true;
  
  //eraser toggle
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 145 && mouseY < 195 && s == 150) {
    s = 0;
    state = "draw";
  } else if (mouseX >= 15 && mouseX <= 105 && mouseY > 145 && mouseY < 195 && s == 0) {
    s = 150;
    state = "draw";
  }
  
  //smile toggle
  if (mouseX >= 15 && mouseX <= 55 && mouseY > 205 && mouseY < 245 && !(state == "smile")) state = "smile";
  else if (mouseX >= 15 && mouseX <= 55 && mouseY > 205 && mouseY < 245 && state == "smile") state = "draw";
  
  //star toggle
  if (mouseX >= 65 && mouseX <= 105 && mouseY > 205 && mouseY < 245 && !(state == "star")) state = "star";
  else if (mouseX >= 65 && mouseX <= 105 && mouseY > 205 && mouseY < 245 && state == "star") state = "draw";
  
  //joke toggle
  if (mouseX >= 15 && mouseX <= 55 && mouseY > 255 && mouseY < 295 && !(state == "joke")) state = "joke";
  else if (mouseX >= 15 && mouseX <= 55 && mouseY > 255 && mouseY < 295 && state == "joke") state = "draw";
  
  //meme toggle
  if (mouseX >= 65 && mouseX <= 105 && mouseY > 255 && mouseY < 295 && !(state == "meme")) state = "meme";
  else if (mouseX >= 65 && mouseX <= 105 && mouseY > 255 && mouseY < 295 && state == "meme") state = "draw";
  
  //wipe
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 415 && mouseY < 465) wipe = true;
  
  //load
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 460 && mouseY < 500) selectInput("Pick an image to load", "openImage");
  
  //save
  if (mouseX >= 15 && mouseX <= 105 && mouseY > 505 && mouseY < 545) selectOutput("Choose a name for new image file", "saveImage");
  
  //click draw
  if(mouseX > 120) isDraw = true;
}

void mouseReleased() {
  //stop stuff
  change = isDraw = changeScale = false;
}

void saveImage(File f) {
  if(f != null) {
    PImage canvas = get(120, 0,width - 120, height);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if(f != null) {
    for(int i = 0; i < 100; i++) {
      PImage pic = loadImage(f.getPath());
      image(pic,120,0);
    }
  }
}
