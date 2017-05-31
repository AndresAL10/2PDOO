package NapakalakiGame;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 * 
 */
public class Monster {
    private String name;
    private int combatLevel;
    private Prize prize;
    private BadConsequence badConsequence;
    private int levelChangeAgainstCultistPlayer = 0;
    
    public Monster(String name, int level, BadConsequence bc, Prize prize){
        this.name=name;
        this.combatLevel=level;
        this.badConsequence=bc;
        this.prize=prize;
    }
    
    public Monster(String name, int level, BadConsequence bc, Prize prize, int levelChange){
        this.name=name;
        this.combatLevel=level;
        this.badConsequence=bc;
        this.prize=prize;
        this.levelChangeAgainstCultistPlayer = levelChange;
    }
    
    public String getName(){
        return name;
    }
       
    public int getCombatLevel(){
        return combatLevel;
    }
    public int getCombatLevelAgainstCultistPlayer(){
        return combatLevel + levelChangeAgainstCultistPlayer;
    }
    
    public Prize getPrize(){
        return prize;
    }
    
    public int getLevelsGained(){
        return this.prize.getLevel();
    }
    
    public int getTreasuresGained(){
        return this.prize.getTreasures();
    }
    public BadConsequence getBadConsequence(){
        return badConsequence;
    }
    
    public String toString(){
        return "Nombre: " + name + "\nNivel: " + Integer.toString(combatLevel)+ "\nMal rollo: "+badConsequence+"\nPremio: "+prize;
    }
}

