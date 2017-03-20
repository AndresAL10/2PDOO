package napakalakiGame;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class Player {
    
    private static final int MAXLEVEL = 10;
    
    private String name;
    
    private int level;
    
    private boolean dead = true;
    
    private boolean canISteal = true;
    
    public Player(String name){
        this.name = name;
        this.level= 1;
    }
    
    public String getName(){
        return name;
    }
    
    private void bringToLife(){
        dead = true;
    }
    
    private int getCombatLevel(){
        int combatlevel= 0;
        
        return combatlevel;
    }
    
    private void incrementLevels(int I){
        level += 1;
    }
    
    private void decrementLevels(int I){
        level -= 1;
    }
    
    private void setPendingBadConsequence(BadConsequence b){
        
    }
    
    private void applyPrize(Monster m){
        
    }
    
    private void applyBadConsequence(Monster m){
        
    }
    
    private boolean canMakeTreasureVisible(Treasure t){
        boolean can=true;
        return can;
    }
    
    private int howManyVisibleTreasures(TreasureKind tKind){
        int n = 0;
        return n;
    }
    
    private void dieIfNoTreasures(){
        
    }
    
    public boolean isDead(){
        boolean muerto = true;
        
        return muerto;
    }
    
    public Treasure [] getHiddenTreasures(){
        
    }
    
    public Treasure [] getVisibleTreasures(){
        
    }
    
    public CombatResult combat(Monster m){
        
    }
    
    public void makeTreasureVisible(Treasure t){
        
    }
    
    public void discardVisibleTreasure(Treasure t){
        
    }
    
    public void discardHiddenTreasure(Treasure t){
        
    }
    
    public boolean validState(){
        
    }
    
    public void initTreasures(){
        
    }
    
    public int getLevels(){
        
    }
    
    public Treasure stealTreasure(){
        
    }
    
    public void setEnemy(Player enemy){
        
    }
    
    private Treasure giveMeATreasure(){
        
    }
    
    public boolean canISteal(){
        
    }
    
    private boolean canYouGiveMeATreasure(){
        
    }
    
    private void haveStolen(){
        
    }
    
    public void discardAllTreasures(){
        
    } 
    
}

