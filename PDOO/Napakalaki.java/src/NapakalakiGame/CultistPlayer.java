package NapakalakiGame;

/**
 *
 * @author Andres Arco Lopez
 */
public class CultistPlayer extends Player{
    private static int totalCultistPlayers=0;
    Cultist myCultistCard;
    
    public CultistPlayer(Player p, Cultist c){
        super(p);
        myCultistCard = c;
        totalCultistPlayers++;
    }
    
    @Override
    public int getCombatLevel(){
        int combatL = (int) (super.getCombatLevel()*0.7);
        combatL += myCultistCard.getGainedLevels()*totalCultistPlayers;
    
        return combatL;
    }
    
    public int getOponentLevel(Monster m){
        return m.getCombatLevelAgainstCultistPlayer();
    }
    
    @Override
    public boolean shouldConvert(){
        return false;
    }
    
    @Override
    public Treasure giveMeATreasure(){
        Treasure tesoro = getVisibleTreasures().get((int) (Math.random()*getVisibleTreasures().size()-1));
        return tesoro;
    }
   
    public static int getTotalCultistPlayers(){
        return totalCultistPlayers;
    }
    
    @Override
    public String toString(){
        String mensaje = super.toString();
        mensaje += "\n\tEl jugador "+this.getName()+" es Sectario";
        
        return mensaje;
    }
}
