package napakalakiGame;

import java.util.ArrayList;
/**
 *
 * @author Andres Arco Lopez
 */
public class BadConsequence {
    
    private String text;
    
    private int levels;
    
    private int nVisibleTreasures;
    
    private int nHiddenTreasures;
    
    private boolean death;
    
    private ArrayList<TreasureKind> specificVisibleTreasures = new ArrayList();
    
    private ArrayList<TreasureKind> specificHiddenTreasures = new ArrayList();
    
    public BadConsequence(String text, int levels, int nVisible, int nHidden){
        this.text=text;
        this.levels=levels;
        this.nVisibleTreasures=nVisible;
        this.nHiddenTreasures=nHidden;
        this.death=false;
    }
    
    public BadConsequence(String text, boolean death){
        this.text=text;
        this.levels=0;
        this.nVisibleTreasures=0;
        this.nHiddenTreasures=0;
        this.death=death;
    }
    
    public BadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible, ArrayList<TreasureKind> tHidden){
        this.text=text;
        this.levels=levels;
        this.nVisibleTreasures=0;
        this.nHiddenTreasures=0;
        this.death=death;
        specificVisibleTreasures= tVisible;
        specificHiddenTreasures= tHidden;
    }
    
    public String getText(){
        return text;
    }
    
    public int getLevels(){
        return levels;
    }
    
    public int getnVisibleTreasures(){
        return nVisibleTreasures;
    }
    
    public int getnHiddenTreasures(){
        return nHiddenTreasures;
    }
    
    public boolean getDeath(){
        return death;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures(){
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures(){
        return specificVisibleTreasures;
    }
    
    public String toString(){
        String muerte;
        if(death)
            muerte="Si";
        else 
            muerte="No";
        
        return "\n\tTexto: "+ text +"\n\tNiveles perdidos: "+levels+"\n\tMuerte: "
                + muerte + "\n\tTesoros Visbles Perdidos: "+nVisibleTreasures+
                "\n\tTesoros Ocultos Perdidos: "+nHiddenTreasures+ "\n\tTesoros Especificos Visibles Perdidos: "+
                getSpecificVisibleTreasures()+"\n\tTesoros Especificos Ocultos Perdidos: "+  getSpecificHiddenTreasures();
    }
}