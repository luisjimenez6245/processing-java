/**
 * Clase principal, aquí se ejecutan los metodos para las graficar, y ejecutar lo principla de las graficas y/o puntos a pintar de nuestras parabolas
 * @author Luis Diego Jiménez Delgado 2018
 */

// se deifinen lo valores de las varbales, que como sun nombre lo dice el angulo y la velocidad iinicial puede variar
//se recominedad ir probando para llegar al resultado esperado
double angulo = 30;
double velocidad =  100;
int screenHeigth;
ArrayList<coordenadas> puntos;
ArrayList<coordenadas> resNuevo;
ArrayList<coordenadas> resViejo;
int numero = 0;
/**
 * metodo de processing en el cual se lleva acabo al principio del programa, por eso el nombre setup
*/
void setup() {
  
  puntos = new ArrayList<coordenadas>();
  resNuevo = new ArrayList<coordenadas>(); 
  screenHeigth = 1000;
  resNuevo.add(inicial(1000, 600,true));
  // aquí en el ciclo, se define el numebro de veces en las que se va a repetir el ciclo 
  for(int i = 0; i <3 ; ++i){
     // angulo = angulo - (angulo/4);
      resViejo = resNuevo;
      resNuevo = new ArrayList<coordenadas>();
      for(int j =  0; j < (Math.pow(2,i )); ++j){
            angulo = angulo - (angulo/12);
            //velocidad = velocidad - (velocidad /20);
      for(coordenadas obj: resViejo){
         aList(fines(obj.getCoordenadaX(),obj.getCoordenadaY()));
      }      
    }
  }
  
  screenHeigth = 1000;
  size(1000, 600);
}

/**
 * meotodo de procesing a ejecutar los métodos para pintar este problema
*/
void draw() {
  background(0);
  strokeWeight(4);
  stroke(255);
  imprime();

}
/**
 * metodo  con el que se agregan puntos para comenzar a graficar las graficas hijas de la principal 
*/
coordenadas[] fines(double x,double y){
  coordenadas[] arreglo =  new  coordenadas[2];
  arreglo[0] = inicial(x, y,true);
  arreglo[1] = inicial(x, y,false);
  return arreglo;
}

/**
 * metodo auxiliar con el que se agregan puntos a una areglo auxliar
*/
void aList(coordenadas[] arreglo){
  for(coordenadas obj: arreglo){
    resNuevo.add(obj);
  }
}

/**
 * metodo auxiliar para el calculo de coordenadas
*/

coordenadas inicial(double x,double y, boolean dir){
   double salto = .06;
   funcion primera = inicial(new coordenadas(x, y), angulo, (float) velocidad);
   parabolas fx = new parabolas(salto, primera, screenHeigth, dir);
   grafica graf = fx.calcula();
   for(coordenadas obj : graf.getPuntos() ){
        puntos.add(obj);
   }
   return graf.getPuntos().get(graf.getPuntos().size()-1);
}

/**
 * metodo auxiliar con el que se impirmimen los puntos del metodo draw
*/
void imprime(){
  for(int i = 0 ; i < numero; ++i)
             point((float)puntos.get(i).getCoordenadaX(),(float)puntos.get(i).getCoordenadaY());
 if(numero < puntos.size() -1) {           
   ++numero;
  
 }
}

/**
 * metodoque me regresa una funcion inicial como los parametros que se le mandaron
*/
 funcion inicial(coordenadas posicionInicial, double angulo, float velocidad) {
        funcion parabolica;
        parabolica = new funcion();
        parabolica.setAngulo((float) Math.toRadians(angulo));
        parabolica.setDireccion(true);
        parabolica.setPoscionInicial(posicionInicial);
        parabolica.setVelocidadIncial((velocidad));
        return parabolica;
    }
