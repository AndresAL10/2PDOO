package NapakalakiGame;

/**
 *
 * @author Andres Arco Lopez
 */
public class DeathBadConsequence extends NumericBadConsequence{
    
    public DeathBadConsequence(String t){
        super(t,Player.MAXLEVEL, MAXTREASURES, MAXTREASURES);
    }
    
    @Override
    public boolean getDeath(){
        return true;
    }
    
    @Override
    public String toString(){
        String mensaje = super.toString();
        mensaje += "\nMuerto: " + getDeath();
        
        return mensaje;
    }
    
}
