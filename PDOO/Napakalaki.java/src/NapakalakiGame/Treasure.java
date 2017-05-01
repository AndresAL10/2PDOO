package NapakalakiGame;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class Treasure {
    
    private String name;
    
    private int bonus;
    
    private TreasureKind type;
    
    public Treasure(String n, int bonus, TreasureKind t){       
        this.name = n;
        this.bonus = bonus;
        this.type = t;
    }
    
    public String getName(){
        return name;
    }
    
    public int getBonus(){
        return bonus;
    }
    
    public TreasureKind getType(){
        return type;
    }
    public String toString(){
        return "\n\n\t\tTesoro " + this.name + "\n\t\tTipo: " + getType() + "\n\t\tBonus: " + getBonus();
    }
}
