package napakalakiGame;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author usuario
 */
public class Test {
    
    static Monster monstruo;
    
    public Test(Monster monstruo){
        this.monstruo = monstruo;
   }
    static public Monster testClase(){
        BadConsequence badConsequence;
        Prize prize;
        Monster monster;
        
        badConsequence = new BadConsequence("------",0,new ArrayList(), new ArrayList());
        prize = new Prize(0,0);     
        monster = new Monster("Monstruo prueba", 0, badConsequence, prize);
        
        return monster;
    }
    
    public void testInstancia(){
        System.out.println(monstruo);
        
    }
}
