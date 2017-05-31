package NapakalakiGame;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */

import java.util.ArrayList;
import java.util.Random;

public class Napakalaki {
    
    private static final Napakalaki instance = new Napakalaki(); 
    private Monster currentMonster;
    private CardDealer dealer = CardDealer.getInstance();
    public Player currentPlayer;
    private ArrayList<Player> players;
    
    private Napakalaki(){
        currentMonster = null;
        currentPlayer = null;
        players = null;
    }
    
    public static Napakalaki getInstance(){
        return instance;
    }
    
    private void initPlayers(ArrayList <String> names){
        players = new ArrayList();
        
        for (String s : names)
            players.add(new Player(s));
                    
    }
    
    private Player nextPlayer(){
        int jugador;
        if (currentPlayer == null){
            jugador = (int) (Math.random() *(players.size()));
            currentPlayer = players.get(jugador);
        }
        else{
            jugador = players.indexOf(currentPlayer)+1;
            if(jugador == players.size()){
                currentPlayer = players.get(0);
            }
                else {
               currentPlayer = players.get(jugador);
        }
    }
        return currentPlayer;
    }
    
    private boolean nextTurnAllowed(){
        boolean allowed;
        if (currentPlayer == null){
            allowed = true;
        }
        else{
            allowed = currentPlayer.validState();
        }
        
        return allowed;
    }
    
    private void setEnemies(){
        int jugador;
        for(int i = 0; i < players.size() ; ++i){
            jugador = (int) (Math.random() *(players.size()));
            while(jugador == i){
                jugador = (int) (Math.random() *(players.size()));
            }
            players.get(i).setEnemy(players.get(jugador));
        
        }
    }
    
    public CombatResult developCombat(){
        CombatResult combatResult = currentPlayer.combat(currentMonster);
        
        if(combatResult==CombatResult.LOSEANDCONVERT){
            CultistPlayer sectario = new CultistPlayer(currentPlayer, CardDealer.getInstance().nextCultist());
            
            for(Player p:players){
                if(p.getEnemy()==currentPlayer)
                    p.setEnemy(sectario);
            }
        
            players.set(players.indexOf(currentPlayer),sectario);
            currentPlayer = sectario;
        }
        
        CardDealer.getInstance().giveMonsterBack(currentMonster);
        return combatResult;
    }
    
    public void discardVisibleTreasures(ArrayList <Treasure> treasures){
        for(Treasure treasure : treasures){
            currentPlayer.discardVisibleTreasure(treasure);
            dealer.giveTreasureBack(treasure);
        }
    }
    
    public void discardHiddenTreasures(ArrayList <Treasure> treasures){
        for(Treasure treasure : treasures){
            currentPlayer.discardHiddenTreasure(treasure);
            dealer.giveTreasureBack(treasure);
    }
    }
    
    public void makeTreasuresVisible(ArrayList <Treasure> treasures){
        for(Treasure t : treasures){
            currentPlayer.makeTreasureVisible(t);            
        }
    }
    
    public void initGame(ArrayList <String> players){
        initPlayers(players);
        setEnemies();
        dealer.initCards();
        nextTurn();
    }
    
    public Player getCurrentPlayer(){
        return currentPlayer;
    }
    
    public Monster getCurrentMonster(){
        return currentMonster;
    }
    
    public boolean nextTurn(){
       
        boolean stateOK = nextTurnAllowed();
        
        if(stateOK){
            currentMonster = dealer.nextMonster();
            currentPlayer = nextPlayer();
            boolean dead = currentPlayer.isDead();
            if(dead){
                currentPlayer.initTreasures();
            }
        }
        return stateOK;
            
    }
    
    public boolean endOfGame(CombatResult result){
        boolean eog = false;
        if (result == CombatResult.WINGAME){
            eog = true;
        }
        return eog;     
            
    }
    
}

