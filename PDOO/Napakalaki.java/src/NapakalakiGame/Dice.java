package NapakalakiGame;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez 
 */

public class Dice {
    private static final Dice instance = new Dice();
    
    private Dice(){}
    
    public static Dice getInstance(){
        return instance;
    }
    
    public int nextNumber(){
        return (int) ((Math.random()*6)+1);
        
    }
}
