package napakalakiGame;

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
    
    public Monster(String name, int level, BadConsequence bc, Prize prize){
        this.name=name;
        this.combatLevel=level;
        this.badConsequence=bc;
        this.prize=prize;
    }
    
    public String getName(){
        return name;
    }
       
    public int getCombatLevel(){
        return combatLevel;
    }
    
    public Prize getPrize(){
        return prize;
    }
    
    public BadConsequence getBadConsequence(){
        return badConsequence;
    }
    
    public String toString(){
        return "\n\nNombre: " + name + "\nNivel: " + Integer.toString(combatLevel)+ "\nMal rollo: "+badConsequence+"\nPremio: "+prize;
    }
}

