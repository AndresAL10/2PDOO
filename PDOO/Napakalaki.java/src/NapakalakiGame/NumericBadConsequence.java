package NapakalakiGame;

import java.util.ArrayList;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class NumericBadConsequence extends BadConsequence{
    static final int MAXTREASURES = 10;
    
    private int nVisibleTreasures;
    private int nHiddenTreasures;
    
    public NumericBadConsequence(String text, int level, int nVis, int nHid){
        super(text, level);
        nVisibleTreasures = nVis;
        nHiddenTreasures = nHid;
    }
    
    @Override
    public int getNVisibleTreasures(){
        return nVisibleTreasures;
    }
    
    @Override
    public int getNHiddenTreasures(){
        return nHiddenTreasures;
    }
    
    @Override 
    public ArrayList<TreasureKind> getSpecificVisibleTreasures(){
        return new ArrayList();
    }
    
    @Override
    public ArrayList<TreasureKind> getSpecificHiddenTreasures(){
        return new ArrayList();
    }
    
    @Override
    public boolean getDeath(){
        return false;
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t){
        if(getNVisibleTreasures()>0)
            nVisibleTreasures--;
    }
    
    @Override
    public void substractHiddenTreasure(Treasure t){
        if(getNHiddenTreasures()>0)
            nHiddenTreasures--;
    }
    
    @Override
    public boolean isEmpty(){
        boolean vacio = false;
        
        if(getNVisibleTreasures()==0 && getNHiddenTreasures()==0)
            vacio=true;
        return vacio;
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList <Treasure> v, ArrayList <Treasure> h){
        int nVis=nVisibleTreasures;
        int nHid=nHiddenTreasures;
        
        if(v.size()<nVis)
            nVis = v.size();
        if(h.size()<nHid)
            nHid = h.size();
        
        BadConsequence badcons = new NumericBadConsequence(text, levels, nVis, nHid);
        
        return badcons;
    }
    
    @Override
    public String toString(){
        String mensaje = super.toString();
        mensaje += "\nTesoros visibles perdidos: " + Integer.toString(nVisibleTreasures)
        +"\nTesoros ocultos perdidos: " + Integer.toString(nHiddenTreasures);
        
        return mensaje;
    }
}
