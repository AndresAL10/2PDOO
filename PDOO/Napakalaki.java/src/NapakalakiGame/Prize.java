package NapakalakiGame;

/**
 * @author Andres Arco Lopez
 */
public class Prize {
    private int treasures;
   
    private int level;
    
    public Prize(int tr, int lv){
        treasures=tr;
        level=lv;
    }
    
    public int getTreasures(){
        return treasures; 
    }
    
    public int getLevel(){
        return level;
    }
    
    public String toString(){ 
        return "\n\tTesoros= " +Integer.toString(treasures) + "\n\tNiveles= "+ Integer.toString(level);
    }
}
