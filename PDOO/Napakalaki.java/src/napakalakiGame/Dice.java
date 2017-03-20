package napakalakiGame;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez 
 */

public class Dice {
    private static final Dice instance = new Dice();
    
    private Dice(){}
    
    public Dice getInstance(){
        return instance;
    }
    
    public int nextNumber(){
        
    }
}
