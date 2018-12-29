/*
 *Clase en la que se almacenan y que invcluye lométodo correspondientes para el calculo de la grafica    
 */



/**
 *
 * @author Luis Diego Jiménez Delgado 2018
 */
public class parabolas {

    private coordenadas individual;
    private funcion parabolica;
    private final double GRAVEDAD = 9.81;
    private double salto = .01;
    private int sec = 0;
    private boolean dir = false;

    public funcion getParabolica() {
        return parabolica;
    }

    public void setParabolica(funcion parabolica) {
        this.parabolica = parabolica;
    }

    public parabolas(double salto) {
        this.salto = salto;
        parabolica = new funcion();
        parabolica.setAngulo((float) Math.toRadians(150));
        parabolica.setDireccion(true);
        parabolica.setPoscionInicial(individual);
        parabolica.setVelocidadIncial((float) 15.5);
    }

    public parabolas(double salto, funcion parabolica) {
        this.salto = salto;
        this.parabolica = parabolica;

    }
    
    public parabolas(double salto, funcion parabolica, int sec, boolean dir) {
        this.salto = salto;
        this.parabolica = parabolica;
        this.sec = sec;
        this.dir = dir;
    }

    public parabolas() {
        parabolica = new funcion();
        parabolica.setAngulo((float) Math.toRadians(36));
        parabolica.setDireccion(true);
        parabolica.setPoscionInicial(individual);
        parabolica.setVelocidadIncial((float) 15.5);
    }

    public parabolas(funcion parabolica) {
        this.parabolica = parabolica;
    }

    public grafica calcula() {
        grafica graf = new grafica();
        double tiempoMax = tiempo();
        graf.setAlcanceMaximo(poscion(tiempoMax));
        double tiempo = 0;
        while (tiempo <= tiempoMax) {
            graf.getPuntos().add(poscion(tiempo));
            tiempo += salto;
        }

        return graf;
    }

    private double tiempo() {
        return Math.nextUp(parabolica.getVelocidadIncial() * (Math.sin(parabolica.getAngulo())) / (GRAVEDAD));
    }

    private coordenadas poscion(double tiempo) {

        double y = (parabolica.getVelocidadIncial() * ((Math.sin(parabolica.getAngulo())) * tiempo)) - (((GRAVEDAD * (Math.pow(tiempo, 2))) / 2));
        double x = parabolica.getVelocidadIncial() * (Math.cos(parabolica.getAngulo())) * tiempo;
        y =  parabolica.getPoscionInicial().getCoordenadaY() - y;
       if(parabolica.getPoscionInicial().getCoordenadaX() !=  sec){
           if(dir)
                x =  parabolica.getPoscionInicial().getCoordenadaX() - x;
            else
                x =  parabolica.getPoscionInicial().getCoordenadaX() + x;
       }

        individual = new coordenadas(x, y, tiempo);

        return individual;
    }
}
