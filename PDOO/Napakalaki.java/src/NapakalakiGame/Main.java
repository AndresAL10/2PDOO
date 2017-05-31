package NapakalakiGame;

import GUI.NapakalakiView;
import GUI.Dice;
import GUI.PlayerNamesCapture;
import java.util.*;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class Main {
    
    public static void main (String[] args){
        Napakalaki game = Napakalaki.getInstance();
        NapakalakiView napakalakiView = new NapakalakiView();
        
        Dice.createInstance (napakalakiView);
        
        ArrayList<String> names = new ArrayList();
        PlayerNamesCapture namesCapture = new PlayerNamesCapture(napakalakiView, true);
        
        names = namesCapture.getNames();
                 
        game.initGame(names);
        napakalakiView.setNapakalaki(game);
        napakalakiView.setVisible(true);
    }
    
}
