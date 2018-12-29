/*
 *Clase en la que se almacenan las propiedades de la funcion  
 */

/**
 *
 * @author Luis Diego Jiménez Delgado 2018
 */
public class funcion {
    
    private double angulo;
    private double tiempo;
    private double velocidadIncial;
    
    private boolean direccion;
    
    private coordenadas poscionInicial;

    public double getAngulo() {
        return angulo;
    }

    public void setAngulo(float angulo) {
        this.angulo = angulo;
    }

    public double getTiempo() {
        return tiempo;
    }

    public void setTiempo(float tiempo) {
        this.tiempo = tiempo;
    }

    public double getVelocidadIncial() {
        return velocidadIncial;
    }

    public void setVelocidadIncial(float velocidadIncial) {
        this.velocidadIncial = velocidadIncial;
    }

    public boolean isDireccion() {
        return direccion;
    }

    public void setDireccion(boolean direccion) {
        this.direccion = direccion;
    }

    public coordenadas getPoscionInicial() {
        return poscionInicial;
    }

    public void setPoscionInicial(coordenadas poscionInicial) {
        this.poscionInicial = poscionInicial;
    }
    
    
}
