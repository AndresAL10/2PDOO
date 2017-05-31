package NapakalakiGame;

import java.util.ArrayList;
import java.util.Arrays;
import GUI.Dice;

/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class Player {
    
    protected static final int MAXLEVEL = 10;
    
    private String name;
    private int level;
    private boolean dead = true;
    private boolean canISteal = true;
    private Player enemy = null;
    private ArrayList<Treasure> visibleTreasures =  new ArrayList();
    private ArrayList<Treasure> hiddenTreasures =  new ArrayList();
    private BadConsequence pendingBadConsequence = null;
    
    public Player(String name){
        this.name = name;
        this.level= 1;
    }
    
    public Player(Player p){
        this.name = p.name;
        this.level = p.level;
        this.dead = p.dead;
        this.enemy = p.enemy;
        this.canISteal = p.canISteal;
        this.visibleTreasures = p.visibleTreasures;
        this.hiddenTreasures = p.hiddenTreasures;
        this.pendingBadConsequence = p.pendingBadConsequence;
    }
    
    public boolean shouldConvert(){
        Dice dice = Dice.getInstance();
        int number = dice.nextNumber();
        boolean sectario = false;
        
        if(number == 6)
            sectario = true;
            
        return sectario;    
    }
    
    public int getMAXLEVEL(){
        return MAXLEVEL;
    }
    
    public String getName(){
        return name;
    }
    
    private void bringToLife(){
        dead = false;
    }
    
    public int getLevel(){
        return level;
    }
    public int getCombatLevel(){     
        int clevel = this.level;
        for(Treasure t : visibleTreasures)
            clevel = clevel + t.getBonus();
        return clevel;
    }
    
    public int getOponentLevel(Monster m){
        return m.getCombatLevel();
    }
    
    public BadConsequence getPendingBadConsequence(){
        return pendingBadConsequence;
    }
    
    private void incrementLevels(int i){
        this.level += i;
        
        if(this.level >10)
            this.level = 10;
    }
    
    private void decrementLevels(int i){
        this.level -= i; 
        if (this.level < 1)
            this.level = 1;            
    }
    
    private void setPendingBadConsequence(BadConsequence b){
        pendingBadConsequence = b;
    }
    
    private void applyPrize(Monster m){
        int nLevels = m.getLevelsGained();
        incrementLevels(nLevels);
        int nTreasures = m.getTreasuresGained();
        
        if(nTreasures > 0){
            CardDealer dealer = CardDealer.getInstance();
            
            for(int i = 0; i<nTreasures; ++i){
                Treasure treasure = dealer.nextTreasure();
                hiddenTreasures.add(treasure);
            }
        }
    }
    
    private void applyBadConsequence(Monster m){
        BadConsequence badConsequence = m.getBadConsequence();
        int nlevels = badConsequence.getLevels();
        decrementLevels(nlevels);
       
        BadConsequence pendingBadCon = badConsequence.adjustToFitTreasureLists(visibleTreasures, hiddenTreasures);
        setPendingBadConsequence(pendingBadCon);
    }
    
    private boolean canMakeTreasureVisible(Treasure t){
        int manos = 0;
        int armadura = 0;
        int casco = 0;
        int pies = 0;
        boolean can = false;
                
        for (Treasure tres :this.visibleTreasures){
            if(tres.getType() == TreasureKind.ONEHAND)
                manos +=1;
            if(tres.getType() == TreasureKind.BOTHHANDS)
                manos += 2;
            if(tres.getType() == TreasureKind.HELMET)
                casco += 1;
            if(tres.getType() == TreasureKind.SHOES)
                pies += 1;
            if(tres.getType() == TreasureKind.ARMOR)
                armadura += 1;   
        }
        
        if(t.getType() == TreasureKind.ONEHAND)
            can = manos < 2;
        if(t.getType() == TreasureKind.BOTHHANDS)
            can = manos == 0;
        if(t.getType() == TreasureKind.HELMET)
            can = casco == 0;
        if(t.getType() == TreasureKind.SHOES)
            can = pies == 0;
        if(t.getType() == TreasureKind.ARMOR)
            can = armadura == 0;
        
        return can;
    }
    
    private int howManyVisibleTreasures(TreasureKind tKind){
        int n = 0;
        
        for(Treasure t:visibleTreasures)
            if (t.getType() == tKind)
                n++;
            
        return n;
    }
    
    private void dieIfNoTreasures(){
        if(hiddenTreasures.isEmpty() && visibleTreasures.isEmpty() ){
            dead = true;
            level = 1;
        }
    }
    
    public boolean isDead(){
        boolean muerto = dead;
        
        return muerto;
    }
    
    public ArrayList<Treasure> getHiddenTreasures(){
        return hiddenTreasures;
    }
    
    public ArrayList<Treasure> getVisibleTreasures(){
        return visibleTreasures;
    }
    
    public CombatResult combat(Monster m){
        CombatResult combatResult;
        int myLevel = getCombatLevel();
        int monsterLevel = getOponentLevel(m);
        
        if(!canISteal){
            Dice dice = Dice.getInstance(); 
            int number = dice.nextNumber();
            
            if(number < 3){
                monsterLevel += enemy.getCombatLevel();
            }
        }
        if(myLevel > monsterLevel){
            applyPrize(m);
            
            if(level >= MAXLEVEL){
                combatResult = CombatResult.WINGAME;
            }
            else{
                combatResult = CombatResult.WIN;
            }
        }
        else{
            applyBadConsequence(m);
            combatResult = CombatResult.LOSE;
            
            if(shouldConvert())
                combatResult = CombatResult.LOSEANDCONVERT;
        }
        
        return combatResult;
        
    }
    
    public void makeTreasureVisible(Treasure t){
        boolean canI = canMakeTreasureVisible(t);
        
        if(canI){
            visibleTreasures.add(t);
            hiddenTreasures.remove(t);
        }
    }
    
    public void discardVisibleTreasure(Treasure t){
        visibleTreasures.remove(t);
        if ((pendingBadConsequence != null) && (!pendingBadConsequence.isEmpty() ) ){
            pendingBadConsequence.substractVisibleTreasure(t);
        }
        dieIfNoTreasures();
        
    }
    
    public void discardHiddenTreasure(Treasure t){
        hiddenTreasures.remove(t);
        if ((pendingBadConsequence != null) && (!pendingBadConsequence.isEmpty() ) ){
            pendingBadConsequence.substractHiddenTreasure(t);
        }
        dieIfNoTreasures();
    }

    public boolean validState(){
        if (hiddenTreasures.size() > 4)
            return false;
        if (pendingBadConsequence == null)
            return true;
        else return pendingBadConsequence.isEmpty();
    }
    
    public void initTreasures(){
        CardDealer dealer = CardDealer.getInstance();
        Dice dice = Dice.getInstance();  
        
        bringToLife();
        
        Treasure treasure = dealer.nextTreasure();
        hiddenTreasures.add(treasure);
        
        int number = dice.nextNumber();
        
        if(number > 1){
            Treasure t = dealer.nextTreasure();
            hiddenTreasures.add(t);
        }
        if(number == 6){
            Treasure t = dealer.nextTreasure();
            hiddenTreasures.add(t);
        }
    }
    
    public int getLevels(){
        return level;
    }
    
    public Player getEnemy(){
        return enemy;
    }
    
    public Treasure stealTreasure(){
        boolean canI = canISteal();
        Treasure treasure = null;
        if(canI){
            boolean canYou = enemy.canYouGiveMeATreasure();
            if(canYou){
                treasure = enemy.giveMeATreasure();
                hiddenTreasures.add(treasure);
                haveStolen();              
            }
        }
        return treasure;
    }
    
    public void setEnemy(Player enemy){
        this.enemy = enemy;
    }
    
    public Treasure giveMeATreasure(){
        int tesoro = (int) (Math.random()*hiddenTreasures.size()-1);
        Treasure devuelve= hiddenTreasures.get(tesoro);
        hiddenTreasures.remove(tesoro);
        return devuelve;
    }
    
    public boolean canISteal(){
        return canISteal;
    }
    
    public boolean canYouGiveMeATreasure(){
        return !hiddenTreasures.isEmpty();
    }
    
    private void haveStolen(){
        canISteal = false;
    }
    
    public void discardAllTreasures(){
        ArrayList<Treasure> vis = new ArrayList(visibleTreasures);
        ArrayList<Treasure> hid = new ArrayList(hiddenTreasures);
        
        
        for(Treasure t : vis){
            discardVisibleTreasure(t);
        }
          for(Treasure t : hid){
            discardHiddenTreasure(t);
        }
    } 
    
    
    public String toString(){ 
        String mensaje = this.name + "\n\tNivel: " + this.level + "\n\tNivel de combate: " + getCombatLevel() + "\n\tMuerto: ";
        if (this.dead)
            mensaje += "Si";
        else      
            mensaje += "No";
        
        if (enemy == null)
            mensaje += "\n\tEnemigo: No hay enemigo";
        else
            mensaje += "\n\tEnemigo: " + enemy.getName();
        
        mensaje += "\n\tTesoros visibles: ";
        
        for(Treasure t : visibleTreasures)
            mensaje += t.toString();
        
        mensaje += "\n\tTesoros ocultos: ";
        
        for(Treasure t : hiddenTreasures)
            mensaje += t.toString();
        
        mensaje += "\n\tMal rollo pendiente: ";
        
        if (this.pendingBadConsequence == null || this.pendingBadConsequence.isEmpty())
            mensaje += "No  hay mal rollo pendiente";
        else
            mensaje += this.pendingBadConsequence.toString();
                
        return mensaje;
    }
}

