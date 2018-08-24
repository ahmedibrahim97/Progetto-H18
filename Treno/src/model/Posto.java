package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * classe che permette di istanziare un nuovo posto
 * @author laurence
 */
public class Posto {
    
    private String nome;
    
   
            
    /**
     * costruttore
     * @param nome
     */
    public Posto(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return  nome ;
    }

    
    
    
    
    
    
}
