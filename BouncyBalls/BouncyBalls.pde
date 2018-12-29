/*Arreglo de objetos pertenecientes a la clase Ball*/
ArrayList <Ball> balls = new ArrayList <Ball>();

void setup() {
  //Declarando el tamaño de la ventana
  size(1000,500);
}

void draw() {
  /*Se establecen las características de la ventana (fondo,grosor de la línea*/
  background(0);
  stroke(255,255,255);
  /*Utilizando el arreglo de objetos que se ha declarado en la segunda línea*/
  for (Ball b : balls) {
    /*Por cada elemento contenido en el arreglo se utilizarán los métodos propios de la clase Ball.
    update: encargado de actulizar la posición de la bola en la ventana (calcular).
    display: encargado de mostrar la actualización de la posición.
    checkBoundaryCollision: encargado de comprobar que ocurra una colisión con los bordes de la ventana, de otra manera los objetos revasarían los límites y no serían visibles. */
    b.update();
    b.display();
    b.checkBoundaryCollision();
  }
  /*Esta vez se utilizan dos ciclos para recorrer el arreglo de objetos, con la intención de comprobar la colisión que existe entre un elemento del arreglo con los demás. */
  for(int i=0;i<balls.size();i++){
    for(int j=0;j<balls.size();j++){
        //Se comprueba que no sea el mismo elemento.
        if(i!=j){
            //El método checkColllision necesita dos elementos de tipo Ball para verificar la colisión.
            balls.get(i).checkCollision(balls.get(j));
        }
    }
  }
}

void mouseClicked(){
  /*Este método se encarga de agregar (al arreglo declarado en la segunda línea) un objeto de clase Ball, con caracterísicas (posición inicial en x, posición en y, radio) random.*/
  balls.add(new Ball(random(1000),random(1000),random(80)));
}
