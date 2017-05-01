package NapakalakiGame;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;


/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class CardDealer {
    
    private static CardDealer instance = new CardDealer();
    
    
    private ArrayList<Treasure> unusedTreasures = new ArrayList();
    private ArrayList<Treasure> usedTreasures = new ArrayList();
    private ArrayList<Monster> unusedMonsters = new ArrayList();
    private ArrayList<Monster> usedMonsters = new ArrayList();
    
    private CardDealer(){}
    
    private void initTreasureCardDeck(){
        
       unusedTreasures.add(new Treasure("¡Sí, mi amo!",3,TreasureKind.HELMET));
       unusedTreasures.add(new Treasure("Botas de investigación",3,TreasureKind.SHOES));
       unusedTreasures.add(new Treasure("Capucha de Cthulhu",3,TreasureKind.HELMET));
       unusedTreasures.add(new Treasure("A prueba de babas",2,TreasureKind.ARMOR));
       unusedTreasures.add(new Treasure("Botas de lluvia ácida",1,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Casco minero",2,TreasureKind.HELMET));
       unusedTreasures.add(new Treasure("Ametralladora ACME",1,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Camiseta de la ETSIIT",1,TreasureKind.ARMOR));
       unusedTreasures.add(new Treasure("Clavo de rail ferroviario",3,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Cuchillo de sushi arcano",2,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Fez alópodo",3,TreasureKind.HELMET));
       unusedTreasures.add(new Treasure("Hacha prehistórica",2,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("El aparato del Pr. Tesla",4,TreasureKind.ARMOR));
       unusedTreasures.add(new Treasure("Gaita",4,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Insecticida",2,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Escopeta de 3 cañones",4,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Garabato mísitco",2,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("La rebeca metálica",2,TreasureKind.ARMOR));
       unusedTreasures.add(new Treasure("Lanzallamas",4,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Necrocomicón",1,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Necronomicón",5,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Linterna a 2 manos",3,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Necrognomicón",2,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Necrotelecom",2,TreasureKind.HELMET));
       unusedTreasures.add(new Treasure("Mazo de los antiguos",3,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Necroplayboycón",3,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Porra preternatural",2,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Shogulador",1,TreasureKind.BOTHHANDS));
       unusedTreasures.add(new Treasure("Varita de atizamiento",3,TreasureKind.ONEHAND));
       unusedTreasures.add(new Treasure("Tentáculo de pega",2,TreasureKind.HELMET));
       unusedTreasures.add(new Treasure("Zapato deja-amigos",1,TreasureKind.SHOES));
    }
    
    private void initMonsterCardDeck(){
        BadConsequence badConsequence;       
        Prize prize;
        
        //unusedMonsters[0]
        badConsequence = new BadConsequence("Pierdes tu armadura visible y otra oculta",0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
        prize = new Prize(2,1);     
        unusedMonsters.add(new Monster("3 Byakhees de bonanza", 8, badConsequence, prize));
           
        //unusedMonsters[1]
        badConsequence = new BadConsequence("Embobados con el lindo primigenio te descartas de tu casco visible", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET)), new ArrayList());
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("Tenochtitlan" , 2, badConsequence, prize));
         
        //unusedMonsters[2]
        badConsequence = new BadConsequence("El primordial bostezo contagioso. Pierdes el calzado visible", 0, new ArrayList(Arrays.asList(TreasureKind.SHOES)), new ArrayList());
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("El sopor de Dunwich", 2, badConsequence, prize));
        
        //unusedMonsters[3]
        badConsequence = new BadConsequence("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Decarta 1 mano visible y 1 mano oculta", 0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
        prize = new Prize(4, 1);
        unusedMonsters.add(new Monster("Demonios de Magaluf", 2, badConsequence, prize));
        
        //unusedMonsters[4]
        badConsequence = new BadConsequence("Pierdes todos tus tesoros visibles", 0,Integer.MAX_VALUE,0);
        prize = new Prize(3, 1);
        unusedMonsters.add(new Monster("El gorron en el umbral", 13, badConsequence, prize));
        
        //unusedMonsters[5]
        badConsequence = new BadConsequence("Pierdes la armadura visible", 0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("H.P Munchcraft", 6, badConsequence, prize));
        
        
        //unusedMonsters[6]
        badConsequence = new BadConsequence("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("Necrofago", 13, badConsequence, prize));
        
        
        //unusedMonsters[7] 
        badConsequence = new BadConsequence("Pierdes 5 niveles y 3 tesoros visibles", 5, 3, 0);
        prize = new Prize(3, 2);
        unusedMonsters.add(new Monster("El rey de rosado", 11, badConsequence, prize));
        
        
        //unusedMonsters[8] 
        badConsequence = new BadConsequence("Toses los pulmones y pierdes 2 niveles", 2, 0, 0);
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("Flecher", 2, badConsequence, prize));
        
        
        //unusedMonsters[9] 
        badConsequence = new BadConsequence("Estos unusedMonsters resultan bastante superficiales y te aburren mortalmente. Estas muerto", true);
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Los hondos", 8, badConsequence, prize));
        
        
        //unusedMonsters[10] 
        badConsequence = new BadConsequence("Pierdes 2 niveles y 2 tesoros ocultos", 2, 0, 2);
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Semillas Cthulhu", 4, badConsequence, prize));
        
        
        //unusedMonsters[11]
        badConsequence = new BadConsequence("Te intentas escaquear. Pierdes una mano visible", 0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList());
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Dameargo", 1, badConsequence, prize));
        
        
        //unusedMonsters[12]
        badConsequence = new BadConsequence("Da mucho asquito. Pierdes 3 niveles", 3, 0, 0);
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Pollipolipo volante", 3, badConsequence, prize));
        
        
        //unusedMonsters[13]
        badConsequence = new BadConsequence("No le hace gracia que pronuncien mal su nombre. Estas muerto", true);
        prize = new Prize(3, 1);
        unusedMonsters.add(new Monster("Yskhtihyssg-Goth", 14, badConsequence, prize));
        
        
        //unusedMonsters[14]
        badConsequence = new BadConsequence("La familia te atrapa. Estas muerto", true);
        prize = new Prize(3, 1);
        unusedMonsters.add(new Monster("Familia feliz", 1, badConsequence, prize));
        
        
        //unusedMonsters[15]
        badConsequence = new BadConsequence("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Roboggoth", 8, badConsequence, prize));
        
        
        //unusedMonsters[16]
        badConsequence = new BadConsequence("Te asusta en la noche. Pierdes un casco visible", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET)), new ArrayList());
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("El espia sordo", 5, badConsequence, prize));
        
        
        //unusedMonsters[17]
        badConsequence = new BadConsequence("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles", 2, 5, 0);
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Tongue", 19, badConsequence, prize));
        
        
        //unusedMonsters[18]
        badConsequence = new BadConsequence("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3, new ArrayList(Arrays.asList(TreasureKind.ONEHAND, TreasureKind.ONEHAND, TreasureKind.BOTHHANDS)), new ArrayList());
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Bicefalo", 21, badConsequence, prize));
        
        //unusedMonsters[19] -2 contra sectarios
        badConsequence = new BadConsequence("Pierdes una mano visible", 0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList());
        prize = new Prize(3, 1);
        unusedMonsters.add(new Monster("El mal indecible impronunciable", 10, badConsequence, prize));
        
        //unusedMonsters[20] +2 contra sectarios
        badConsequence = new BadConsequence("Pierdes tus tesoros visibles. Jajaja.", 0, Integer.MAX_VALUE, 0);
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Testigos oculares", 6, badConsequence, prize));
        
        //unusedMonsters[21] +4 contra sectarios
        badConsequence = new BadConsequence("Hoy no es tu dia de suerte. Mueres", true);
        prize = new Prize(5, 2);
        unusedMonsters.add(new Monster("El gran cthulhu", 20, badConsequence, prize));
        
        //unusedMonsters[22] -2 contra sectarios
        badConsequence = new BadConsequence("Tu gobierno te recorta 2 niveles", 2, 0, 0);
        prize = new Prize(2, 1);
        unusedMonsters.add(new Monster("Serpiente Politico", 8, badConsequence, prize));
        
        //unusedMonsters[23] +5 contra sectarios
        badConsequence = new BadConsequence("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET, TreasureKind.ARMOR)), new ArrayList(Arrays.asList(TreasureKind.ONEHAND, TreasureKind.ONEHAND, TreasureKind.ONEHAND, TreasureKind.ONEHAND,TreasureKind.BOTHHANDS, TreasureKind.BOTHHANDS, TreasureKind.BOTHHANDS, TreasureKind.BOTHHANDS)));
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("Felpuggoth", 2, badConsequence, prize));
        
        //unusedMonsters[24] -4 contra sectarios
        badConsequence = new BadConsequence("Pierdes 2 niveles", 2, 0, 0);
        prize = new Prize(4, 2);
        unusedMonsters.add(new Monster("Shoggoth", 16, badConsequence, prize));
        
        //unusedMonsters[25] +3 contra sectarios
        badConsequence = new BadConsequence("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0);
        prize = new Prize(1, 1);
        unusedMonsters.add(new Monster("Lolitagooth", 2, badConsequence, prize));
    }
    
    private void shuffleTreasures(){
        Collections.shuffle(unusedTreasures);
    }
    
    private void shuffleMonsters(){
        Collections.shuffle(unusedMonsters);
    }
    
    //Puse static para que funcione
    public static CardDealer getInstance(){
            return instance;
    }
    
    public Monster nextMonster(){
        Monster devuelve;
        if(unusedMonsters.isEmpty()){
            for(int i = 0 ; i < usedMonsters.size(); i++){
                unusedMonsters.add(usedMonsters.get(0));
                usedMonsters.remove(0);
                
            }
            shuffleMonsters();
        }
        devuelve = unusedMonsters.get(0);
        usedMonsters.add(devuelve);
        unusedMonsters.remove(0);
       
        return devuelve;
    
    }
    
    public Treasure nextTreasure(){
        Treasure devuelve;
        if(unusedTreasures.isEmpty()){
            for(int i = 0 ; i < usedTreasures.size(); i++){
                unusedTreasures.add(usedTreasures.get(0));
                usedTreasures.remove(0);
                
            }
            shuffleTreasures();
        }
        devuelve = unusedTreasures.get(0);
        usedTreasures.add(devuelve);
        unusedTreasures.remove(0);
        return devuelve;
        
    }
    
    public void giveTreasureBack(Treasure t){
        
    }
    
    public void giveMonsterBack(Monster m){
        
    }
    
    public void initCards(){
        initTreasureCardDeck();
        initMonsterCardDeck();
        shuffleTreasures();
        shuffleMonsters();
    }


}
