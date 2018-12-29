/*
 *Clase en la que se almacenan las propiedades de las coordenadas  
 */

/**
 *
 * @author Luis Diego Jiménez Delgado 2018
 */
public class coordenadas {

    private double coordenadaY;
    private double coordenadaX;
    private double tiempo;

    public double getTiempo() {
        return tiempo;
    }

    public void setTiempo(double tiempo) {
        this.tiempo = tiempo;
    }
    
    public coordenadas(){
        
    }
    
    public coordenadas(double coordenadaX, double coordenadaY) {
        this.coordenadaY = coordenadaY;
        this.coordenadaX = coordenadaX;
    }
    public coordenadas(double coordenadaX, double coordenadaY, double tiempo) {
        this.coordenadaY = coordenadaY;
        this.coordenadaX = coordenadaX;
        this.tiempo =  tiempo;
    }

    public double getCoordenadaY() {
        return coordenadaY;
    }

    public void setCoordenadaY(float coordenadaY) {
        this.coordenadaY = coordenadaY;
    }

    public double getCoordenadaX() {
        return coordenadaX;
    }

    public void setCoordenadaX(float coordenadaX) {
        this.coordenadaX = coordenadaX;
    }
    
    
}
