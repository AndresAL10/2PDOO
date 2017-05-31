package NapakalakiGame;

import java.util.ArrayList;

/**
 *
 * @author Andres Arco Lopez
 */
public class SpecificBadConsequence extends BadConsequence {
    private ArrayList<TreasureKind> specificVisibleTreasures;
    private ArrayList<TreasureKind> specificHiddenTreasures;
    
    public SpecificBadConsequence(String text, int level, ArrayList<TreasureKind> vis, ArrayList<TreasureKind> hid){
        super(text, level);
        specificVisibleTreasures = vis;
        specificHiddenTreasures = hid;
    }
    
    @Override
    public int getNVisibleTreasures(){
        return 0;
    }
    
    @Override 
    public int getNHiddenTreasures(){
        return 0;
    }
            
    
    @Override
    public ArrayList getSpecificHiddenTreasures(){
        return specificHiddenTreasures;
    }
    
    @Override
    public ArrayList getSpecificVisibleTreasures(){
        return specificVisibleTreasures;
    }
    
    @Override
    public boolean getDeath(){
        return false;
    }
    
    @Override
    public boolean isEmpty(){
        boolean empty = false;
        
        if(getSpecificVisibleTreasures().isEmpty() && getSpecificHiddenTreasures().isEmpty())
            empty = true;
        
        return empty;
    }
    
    @Override 
    public void substractVisibleTreasure(Treasure t){
        TreasureKind tkind = t.getType();
        
        if(!getSpecificVisibleTreasures().isEmpty())
            if(getSpecificVisibleTreasures().contains(tkind))
                specificVisibleTreasures.remove(specificVisibleTreasures.indexOf(tkind));
            
    }
    
    @Override 
    public void substractHiddenTreasure(Treasure t){
        TreasureKind tkind = t.getType();
        
        if(!getSpecificHiddenTreasures().isEmpty())
            if(getSpecificHiddenTreasures().contains(tkind))
                specificHiddenTreasures.remove(specificHiddenTreasures.indexOf(tkind));
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v, ArrayList<Treasure> h){
        ArrayList<TreasureKind> specV = new ArrayList();
        ArrayList<TreasureKind> copy_spV = new ArrayList(specificVisibleTreasures);
        ArrayList<TreasureKind> specH = new ArrayList();
        ArrayList<TreasureKind> copy_spH = new ArrayList(specificHiddenTreasures);
        ArrayList<TreasureKind> typesH = new ArrayList();
        ArrayList<TreasureKind> typesV = new ArrayList();
        
        
        for(Treasure t: v){
            typesV.add(t.getType());
        }
        
        for(Treasure t: h){
            typesH.add(t.getType());
        }
                    
        for(TreasureKind t: typesV){
            if(copy_spV.contains(t)){
                specV.add(t);
                copy_spV.remove(t);
            }
        }
        
        for(TreasureKind t: typesH){
            if(copy_spH.contains(t)){
                specH.add(t);
                copy_spH.remove(t);
            }
        }
            
        BadConsequence bc = new SpecificBadConsequence(text, levels, specV, specH);
        
        return bc;        
    }
    
    @Override
    public String toString(){
        String mensaje = super.toString();
        mensaje += "\nTesoros especificos visibles perdidos: " + getSpecificVisibleTreasures().toString()
        + "\nTesoros especificos ocultos perdidos: " + getSpecificHiddenTreasures().toString();
        
        return mensaje;
    }
}
