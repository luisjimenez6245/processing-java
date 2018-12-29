/*
 *Clase en la que se almacenan las propiedades de la grafica  
 */

import java.util.ArrayList;

/**
 *
 * @author Luis Diego Jiménez Delgado 2018
 */
public class grafica {
    
    private coordenadas alcanceMaximo;
    
    private coordenadas puntoInicial;
    
    private ArrayList<coordenadas> puntos;
    
    public grafica(){
      puntos = new ArrayList<coordenadas>();
    }

    public coordenadas getAlcanceMaximo() {
        return alcanceMaximo;
    }

    public void setAlcanceMaximo(coordenadas alcanceMaximo) {
        this.alcanceMaximo = alcanceMaximo;
    }

    public coordenadas getPuntoInicial() {
        return puntoInicial;
    }

    public void setPuntoInicial(coordenadas puntoInicial) {
        this.puntoInicial = puntoInicial;
    }

    public ArrayList<coordenadas> getPuntos() {
        return puntos;
    }

    public void setPuntos(ArrayList<coordenadas> puntos) {
        this.puntos = puntos;
    }
    
}
