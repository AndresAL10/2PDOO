package NapakalakiGame;

import java.util.ArrayList;
/**
 *
 * @author Andres Arco Lopez
 */
public class BadConsequence {
    
    private static final int MAXTREASURES = 10;
    
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
    
    public BadConsequence(String text, int levels,int ocult, int visible,  ArrayList<TreasureKind> tVisible, ArrayList<TreasureKind> tHidden){
        this.text=text;
        this.levels=levels;
        this.nVisibleTreasures=ocult;
        this.nHiddenTreasures=visible;
        this.death=false;
        specificVisibleTreasures= tVisible;
        specificHiddenTreasures= tHidden;
    }
    
    public BadConsequence(String text){
        Player p = new Player("Jugador prueba");
        this.text = text;
        this.levels = p.getMAXLEVEL();
        this.nVisibleTreasures = MAXTREASURES;
        this.nHiddenTreasures = MAXTREASURES;
        this.death = true;
    }
    
    public String getText(){
        return this.text;
    }
    
    public int getLevels(){
        return this.levels;
    }
    
    public int getnVisibleTreasures(){
        return this.nVisibleTreasures;
    }
    
    public int getnHiddenTreasures(){
        return this.nHiddenTreasures;
    }
    
    public boolean getDeath(){
        return this.death;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures(){
        return this.specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures(){
        return this.specificVisibleTreasures;
    }
    
    
    public void substractVisibleTreasure(Treasure t){
            if( !specificVisibleTreasures.isEmpty()){
                if(specificVisibleTreasures.contains(t.getType())){
                    specificVisibleTreasures.remove(t.getType());
                    nVisibleTreasures = nVisibleTreasures - 1;
                    if (nVisibleTreasures < 0)
                        nVisibleTreasures = 0;
                }
            }
            else{
                nVisibleTreasures = nVisibleTreasures - 1;
                    if (nVisibleTreasures < 0)
                        nVisibleTreasures = 0;
            }
               
    }
   
    public void substractHiddenTreasure(Treasure t){
            if( !specificHiddenTreasures.isEmpty()){
                if(specificHiddenTreasures.contains(t.getType())){
                    specificHiddenTreasures.remove(t.getType());
                    nHiddenTreasures = nHiddenTreasures - 1;
                    if (nHiddenTreasures < 0)
                        nHiddenTreasures = 0;
                }
            }
            else{
                nHiddenTreasures = nHiddenTreasures - 1;
                    if (nHiddenTreasures < 0)
                        nHiddenTreasures = 0;
            }
    }
    
    public boolean isEmpty(){
        boolean vacio = false;
        if(nVisibleTreasures == 0 && nHiddenTreasures == 0 && specificVisibleTreasures.isEmpty() && specificHiddenTreasures.isEmpty() )
            vacio = true;
        
        return vacio;
    }
    
    public BadConsequence adjustToFitTreasureLists(ArrayList <Treasure> v, ArrayList <Treasure> h){
       BadConsequence ajustado;
       ArrayList <TreasureKind> visibles = new ArrayList();
       ArrayList <TreasureKind> ocultos = new ArrayList();
       int nVisibles = 0;
       int nOcultos = 0;
                       
       if(v.size() < nVisibleTreasures){
           nVisibles = v.size();
       }
       if(h.size() < nHiddenTreasures){
           nOcultos = h.size();
       }
       
       if(nVisibleTreasures == 0 && nHiddenTreasures == 0){
           for(Treasure t : v){
               if(specificVisibleTreasures.contains(t.getType())){
                   visibles.add(t.getType());
               }
           }
           for(Treasure t : h){
               if(specificHiddenTreasures.contains(t.getType())){
                   ocultos.add(t.getType());
               }
           }
       }
       
       ajustado = new BadConsequence( text, levels, nVisibles, nOcultos, visibles, ocultos);
          
       return ajustado;
       
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