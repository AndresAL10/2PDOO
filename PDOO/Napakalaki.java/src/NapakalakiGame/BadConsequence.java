package NapakalakiGame;

import java.util.ArrayList;
/**
 *
 * @author Andres Arco Lopez
 */
public abstract class BadConsequence {
      
    protected String text;
    protected int levels;
    protected boolean death;  
    
    public BadConsequence(String text, int levels){
        this.text=text;
        this.levels=levels;
    }
     
    abstract public int getNVisibleTreasures();
    
    abstract public int getNHiddenTreasures();
    
    abstract public boolean getDeath();
    
    abstract public ArrayList<TreasureKind> getSpecificVisibleTreasures();
    
    abstract public ArrayList<TreasureKind> getSpecificHiddenTreasures();
    
    public String getText(){
        return this.text;
    }
    
    public int getLevels(){
        return this.levels;
    }
         
    public abstract void substractVisibleTreasure(Treasure t);             
       
    public abstract void substractHiddenTreasure(Treasure t);
    
    public abstract boolean isEmpty();
    
    public abstract BadConsequence adjustToFitTreasureLists(ArrayList <Treasure> v, ArrayList <Treasure> h);
    
    public String toString(){
        return "\n\tTexto: "+ text +"\n\tNiveles perdidos: "+Integer.toString(levels);
    }
}