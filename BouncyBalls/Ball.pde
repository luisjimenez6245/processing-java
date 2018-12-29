class Ball{
    PVector position;
    PVector velocity;

  float radius, m;

  Ball(float x, float y, float r_) {
    //Método constructor de la clase Ball, todo objeto requiere de una posición inicial (x,y) para la creación de un vector, y un radio.
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(3);
    radius = r_;
    m = radius*.1;
  }

  void update() {
    //Este método se encarga de actualizar la posición del objeto.
    position.add(velocity);
  }

  void checkBoundaryCollision() {
    //Este método se encarga de verificar que la posición del objeto se encuentre dentro de la ventana declarada. En caso de colisionar con los bordes, el sentido del cuerpo se cambiará
    if (position.x > width-radius) {
      position.x = width-radius;
      velocity.x *= -1;
    } else if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    } else if (position.y > height-radius) {
      position.y = height-radius;
      velocity.y *= -1;
    } else if (position.y < radius) {
      position.y = radius;
      velocity.y *= -1;
    }
  }

  void checkCollision(Ball other) {

    // Obtiene las distancias entre los demás objetos.
    PVector distanceVect = PVector.sub(other.position, position);

    //Calcula la magnitud del vector que separa los objetos.
    float distanceVectMag = distanceVect.mag();

    // Se establece la mínima distancia para producir la colisión.
    float minDistance = radius + other.radius;

    if (distanceVectMag < minDistance) {
      //Se produce la colisión.
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.position.add(correctionVector);
      position.sub(correctionVector);

      // Obtiene el ángulo del distanceVect
      float theta  = distanceVect.heading();
      // Precalcula valores trigonométricos
      float sine = sin(theta);
      float cosine = cos(theta);

 
      /*bTemp es una variable temporal que retendrá las posiciones del objeto*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* La posisión de las pelotas son relativas con respecto a las demás así que se puede usar un vector entre ellos (bVect)
      como referencia en la rotación. bTemp[0].position.x y bTemp[0].position.y obtendrá  el punto 0.0 que se busca desde que b[1] inicia la rotación haia b[0]*/
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // Velocidades temporales de rotación
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      /* Ya que las velocidades han rotado, se pueden usar las ecuaciones de conservación del momeno para calcular la velocidad a lo largo del eje x */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // Velocidad final de rotación para b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // Velocidad final de rotación para b[1]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Cambiar velocidades y posición a un signo contrario para cambiar la dirección de la pelota */
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // Actualizs la posición de los objetos en pantalla.
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // Actualiza las velocidades.
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
  }

  void display() {
    //Muestra los objetos en la pantalla, dibujando una elipse con la posición (x,y) y el radio establecido en el constructor.
    try{
      noStroke();
      fill(204);
      ellipse(position.x, position.y, radius*2, radius*2);
    }catch(Exception e){
        System.out.println(e);
    }
  }
}
