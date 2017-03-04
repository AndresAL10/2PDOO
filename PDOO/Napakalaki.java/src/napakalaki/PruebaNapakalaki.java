package napakalaki;

import java.util.ArrayList;
import java.util.Arrays;
/**
 *
 * @author Andres Arco Lopez
 */
public class PruebaNapakalaki {
    

    static ArrayList<Monster>monstruos = new ArrayList();
    
    static ArrayList<Monster> NivelSuperiorA10(ArrayList<Monster>monstruos){
        ArrayList<Monster>mons = new ArrayList();

        for(Monster monstruo:monstruos){
            if(monstruo.getCombatLevel()>10)
                mons.add(monstruo);
        }
        return mons;
    }
    
    static ArrayList<Monster> SoloPerdidaLevel(ArrayList<Monster>monstruos){
        ArrayList<Monster>mons = new ArrayList();
        
        for(Monster monstruo:monstruos){
            if(monstruo.getBadConsequence().getLevels() != 0 && monstruo.getBadConsequence().getnVisibleTreasures() == 0 && monstruo.getBadConsequence().getnHiddenTreasures() == 0  )
                if(monstruo.getBadConsequence().getSpecificHiddenTreasures().isEmpty()==true && monstruo.getBadConsequence().getSpecificVisibleTreasures().isEmpty()==true) { 
                    mons.add(monstruo);
                }
        }
        return mons;
    }
    
    static ArrayList<Monster> GananciaNivel(ArrayList<Monster>monstruos){
        ArrayList<Monster>mons = new ArrayList();
        
        for(Monster monstruo:monstruos){
            if(monstruo.getPrize().getLevel()>1)
                mons.add(monstruo);
        }
        return mons;
    }
    
    static ArrayList<Monster> PerdidaEspecifica(ArrayList<Monster>monstruos,TreasureKind treasurekind){
        ArrayList<Monster>mons = new ArrayList();
       
        for(Monster monstruo:monstruos)
            if(monstruo.getBadConsequence().getSpecificHiddenTreasures().contains(treasurekind) ||
               monstruo.getBadConsequence().getSpecificVisibleTreasures().contains(treasurekind))
                    mons.add(monstruo);
     
        return mons;
    }
    
    
    
    public static void main(String[] args){
            

        BadConsequence badConsequence;
    
        Prize prize;
        
        //monstruos[0]
        badConsequence = new BadConsequence("Pierdes tu armadura visible y otra oculta",0,new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
        prize = new Prize(2,1);     
        monstruos.add(new Monster("3 Byakhees de bonanza", 8, badConsequence, prize));
           
        //monstruos[1]
        badConsequence = new BadConsequence("Embobados con el lindo primigenio te descartas de tu casco visible", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET)), new ArrayList());
        prize = new Prize(1, 1);
        monstruos.add(new Monster("Tenochtitlan" , 2, badConsequence, prize));
         
        //monstruos[2]
        badConsequence = new BadConsequence("El primordial bostezo contagioso. Pierdes el calzado visible", 0, new ArrayList(Arrays.asList(TreasureKind.SHOES)), new ArrayList());
        prize = new Prize(1, 1);
        monstruos.add(new Monster("El sopor de Dunwich", 2, badConsequence, prize));
        
        //monstruos[3]
        badConsequence = new BadConsequence("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Decarta 1 mano visible y 1 mano oculta", 0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
        prize = new Prize(4, 1);
        monstruos.add(new Monster("Demonios de Magaluf", 2, badConsequence, prize));
        
        //monstruos[4]
        badConsequence = new BadConsequence("Pierdes todos tus tesoros visibles", 0,Integer.MAX_VALUE,0);
        prize = new Prize(3, 1);
        monstruos.add(new Monster("El gorron en el umbral", 13, badConsequence, prize));
        
        //monstruos[5]
        badConsequence = new BadConsequence("Pierdes la armadura visible", 0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        prize = new Prize(2, 1);
        monstruos.add(new Monster("H.P Munchcraft", 6, badConsequence, prize));
        
        
        //monstruos[6]
        badConsequence = new BadConsequence("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        prize = new Prize(1, 1);
        monstruos.add(new Monster("Necrofago", 13, badConsequence, prize));
        
        
        //monstruos[7] 
        badConsequence = new BadConsequence("Pierdes 5 niveles y 3 tesoros visibles", 5, 3, 0);
        prize = new Prize(3, 2);
        monstruos.add(new Monster("El rey de rosado", 11, badConsequence, prize));
        
        
        //monstruos[8] 
        badConsequence = new BadConsequence("Toses los pulmones y pierdes 2 niveles", 2, 0, 0);
        prize = new Prize(1, 1);
        monstruos.add(new Monster("Flecher", 2, badConsequence, prize));
        
        
        //monstruos[9] 
        badConsequence = new BadConsequence("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto", true);
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Los hondos", 8, badConsequence, prize));
        
        
        //monstruos[10] 
        badConsequence = new BadConsequence("Pierdes 2 niveles y 2 tesoros ocultos", 2, 0, 2);
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Semillas Cthulhu", 4, badConsequence, prize));
        
        
        //monstruos[11]
        badConsequence = new BadConsequence("Te intentas escaquear. Pierdes una mano visible", 0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList());
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Dameargo", 1, badConsequence, prize));
        
        
        //monstruos[12]
        badConsequence = new BadConsequence("Da mucho asquito. Pierdes 3 niveles", 3, 0, 0);
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Pollipolipo volante", 3, badConsequence, prize));
        
        
        //monstruos[13]
        badConsequence = new BadConsequence("No le hace gracia que pronuncien mal su nombre. Estas muerto", true);
        prize = new Prize(3, 1);
        monstruos.add(new Monster("Yskhtihyssg-Goth", 14, badConsequence, prize));
        
        
        //monstruos[14]
        badConsequence = new BadConsequence("La familia te atrapa. Estas muerto", true);
        prize = new Prize(3, 1);
        monstruos.add(new Monster("Familia feliz", 1, badConsequence, prize));
        
        
        //monstruos[15]
        badConsequence = new BadConsequence("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible", 2, new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Roboggoth", 8, badConsequence, prize));
        
        
        //monstruos[16]
        badConsequence = new BadConsequence("Te asusta en la noche. Pierdes un casco visible", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET)), new ArrayList());
        prize = new Prize(1, 1);
        monstruos.add(new Monster("El espia sordo", 5, badConsequence, prize));
        
        
        //monstruos[17]
        badConsequence = new BadConsequence("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles", 2, 5, 0);
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Tongue", 19, badConsequence, prize));
        
        
        //monstruos[18]
        badConsequence = new BadConsequence("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos", 3, new ArrayList(Arrays.asList(TreasureKind.ONEHAND, TreasureKind.ONEHAND, TreasureKind.BOTHHANDS)), new ArrayList());
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Bicefalo", 21, badConsequence, prize));
        
        //monstruos[19] -2 contra sectarios
        badConsequence = new BadConsequence("Pierdes una mano visible", 0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList());
        prize = new Prize(3, 1);
        monstruos.add(new Monster("El mal indecible impronunciable", 10, badConsequence, prize));
        
        //monstruos[20] +2 contra sectarios
        badConsequence = new BadConsequence("Pierdes tus tesoros visibles. Jajaja.", 0, Integer.MAX_VALUE, 0);
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Testigos oculares", 6, badConsequence, prize));
        
        //monstruos[21] +4 contra sectarios
        badConsequence = new BadConsequence("Hoy no es tu dia de suerte. Mueres", true);
        prize = new Prize(5, 2);
        monstruos.add(new Monster("El gran cthulhu", 20, badConsequence, prize));
        
        //monstruos[22] -2 contra sectarios
        badConsequence = new BadConsequence("Tu gobierno te recorta 2 niveles", 2, 0, 0);
        prize = new Prize(2, 1);
        monstruos.add(new Monster("Serpiente Politico", 8, badConsequence, prize));
        
        //monstruos[23] +5 contra sectarios
        badConsequence = new BadConsequence("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET, TreasureKind.ARMOR)), new ArrayList(Arrays.asList(TreasureKind.ONEHAND, TreasureKind.ONEHAND, TreasureKind.ONEHAND, TreasureKind.ONEHAND,TreasureKind.BOTHHANDS, TreasureKind.BOTHHANDS, TreasureKind.BOTHHANDS, TreasureKind.BOTHHANDS)));
        prize = new Prize(1, 1);
        monstruos.add(new Monster("Felpuggoth", 2, badConsequence, prize));
        
        //monstruos[24] -4 contra sectarios
        badConsequence = new BadConsequence("Pierdes 2 niveles", 2, 0, 0);
        prize = new Prize(4, 2);
        monstruos.add(new Monster("Shoggoth", 16, badConsequence, prize));
        
        //monstruos[25] +3 contra sectarios
        badConsequence = new BadConsequence("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0);
        prize = new Prize(1, 1);
        monstruos.add(new Monster("Lolitagooth", 2, badConsequence, prize));
        
        ArrayList<Monster>monstruosmasnivel10 = new ArrayList();
        ArrayList<Monster>soloperdidanivel = new ArrayList();
        ArrayList<Monster>gananciaSuperiorA1 = new ArrayList();
        ArrayList<Monster>perdidaEspecificaArmor = new ArrayList();
        ArrayList<Monster>perdidaEspecificaBothHands = new ArrayList();
        ArrayList<Monster>perdidaEspecificaHelmet = new ArrayList();
        ArrayList<Monster>perdidaEspecificaOneHand = new ArrayList();
        ArrayList<Monster>perdidaEspecificaShoes = new ArrayList();
                
        
        monstruosmasnivel10 = NivelSuperiorA10(monstruos);
        soloperdidanivel = SoloPerdidaLevel(monstruos);
        gananciaSuperiorA1 = GananciaNivel(monstruos);
        perdidaEspecificaArmor = PerdidaEspecifica(monstruos,TreasureKind.ARMOR);
        perdidaEspecificaBothHands = PerdidaEspecifica(monstruos,TreasureKind.BOTHHANDS);
        perdidaEspecificaHelmet = PerdidaEspecifica(monstruos,TreasureKind.HELMET);
        perdidaEspecificaOneHand = PerdidaEspecifica(monstruos,TreasureKind.ONEHAND);
        perdidaEspecificaShoes = PerdidaEspecifica(monstruos,TreasureKind.SHOES);
        
        
        System.out.println("MONSTRUOS CUYO NIVEL ES SUPERIOR A 10");
        System.out.println( monstruosmasnivel10.toString());
        
        System.out.println("--------------------------------------------------------------------------------------------------------");
        System.out.println("MONSTRUOS CUYO MAL ROLLO SOLO IMPLICA PERDIDA DE NIVEL");
        System.out.println( soloperdidanivel.toString());   
        
        System.out.println("--------------------------------------------------------------------------------------------------------");
        System.out.println("MONSTRUOS CUYO BUEN ROLLO ES GANANCIA DE NIVEL SUPERIOR A 1");
        System.out.println( gananciaSuperiorA1.toString());
        
        System.out.println("---------------------------------------------------------------------------------------------------------");
        System.out.println("MONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE ARMADURA");
        System.out.println( perdidaEspecificaArmor.toString());
   
        System.out.println("MONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE DOS MANOS");
        System.out.println( perdidaEspecificaBothHands.toString());
        
        System.out.println("MONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE CASCO");
        System.out.println( perdidaEspecificaHelmet.toString());
        
        System.out.println("MONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE UNA MANO");
        System.out.println( perdidaEspecificaOneHand.toString());
    
        System.out.println("MONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE CALZADO");
        System.out.println( perdidaEspecificaShoes.toString());
    }
    
}
