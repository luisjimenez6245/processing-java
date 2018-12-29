PShape sun;
PShape mercury;
PShape venus;
PShape earth;
PShape mars;
PShape jupiter;
PShape saturn;
PShape uranus;
PShape neptune;

PImage suntex;
PImage mercurytex;
PImage venustex;
PImage earthtex;
PImage marstex;
PImage jupitertex;
PImage saturntex;
PImage uranustex;
PImage neptunetex;

void settings() {
  size(950, 650, P3D);
}

void setup() {
  /*********************  SE ESTABLECE UN FONDO DE COLO NEGRO (0)  *********************/
  background(0);

  /*********************  SE LES ASIGNA UN COLOR SÓLIDO A LAS ESFERAS Y UN NIVEL DE RESOLUSIÓN DE 40  *********************/
  noStroke();
  fill(204);
  sphereDetail(40);

  /*********************  SE CREAN LAS FIGURAS Y SE LES AÑADEN TEXTURAS  *********************/  
  suntex = loadImage("sun.jpg");
  mercurytex = loadImage("mercury.jpg");  
  venustex = loadImage("venus.jpg");
  earthtex = loadImage("planet.jpg");
  marstex = loadImage("mars.jpg");
  jupitertex = loadImage("jupiter.jpg");
  saturntex = loadImage("saturn.jpg");
  uranustex = loadImage("uranus.jpg");
  neptunetex = loadImage("neptune.jpg");

  sun = createShape(SPHERE, 150);
  sun.setTexture(suntex);

  mercury = createShape(SPHERE, 40);
  mercury.setTexture(mercurytex);
  
  venus = createShape(SPHERE, 60);
  venus.setTexture(venustex);

  earth = createShape(SPHERE, 50);
  earth.setTexture(earthtex);
  
  mars = createShape(SPHERE, 45);
  mars.setTexture(marstex);
  
  jupiter = createShape(SPHERE, 100);
  jupiter.setTexture(jupitertex);
  
  saturn = createShape(SPHERE, 56);
  saturn.setTexture(saturntex);
  
  uranus = createShape(SPHERE, 60);
  uranus.setTexture(uranustex);
  
  neptune = createShape(SPHERE, 56);
  neptune.setTexture(neptunetex);
}

void draw() {
  background(0);
  
   /*********************  SE ESTABLECE POSICIÓN DE LA CÁMARA  *********************/
  camera(width/2, height/6, (height/6) / tan(PI/8), width/2, height/6, 0, 0, 1, 0);

  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DEL SOL Y SE LE DAN VALORES DE ROTACIÓN  *********************/
  translate(width/2, height/2, -2500);  
  rotateY(PI * frameCount / 500);
  shape(sun);
  
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE MERCURIO Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 120);
  translate(0, 0, 300);
  shape(mercury);
  popMatrix();
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE VENUS Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 140);
  translate(0, 0, 500);
  shape(venus);
  popMatrix();
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE LA TIERRA Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 160);
  translate(0, 0, 700);
  shape(earth);
  popMatrix();
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE MARTE Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 180);
  translate(0, 0, 900);
  shape(mars);
  popMatrix();
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE JUPITER Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 200);
  translate(0, 0, 1100);
  shape(jupiter);
  popMatrix();
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE SATURNO Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 240);
  translate(0, 0, 1300);
  shape(saturn);
  popMatrix();
  
  pushMatrix();
  /*********************  SE ESTABLECE POSICIÓN DE URANO Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 270);
  translate(0, 0, 1500);
  shape(uranus);
  popMatrix();
  
  /*********************  SE ESTABLECE POSICIÓN DE NEPTUNO Y SE LE DAN VALORES DE ROTACIÓN SEGUN POSICIÓN DEL SOL  *********************/
  rotateY(PI * frameCount / 300);
  translate(0, 0, 1700);
  shape(neptune);
  popMatrix();
}
