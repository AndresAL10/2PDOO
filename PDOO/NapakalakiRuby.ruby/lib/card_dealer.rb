#encoding: utf-8
  
require "singleton"
require_relative "prize"
require_relative "monster"
require_relative "treasure"

module NapakalakiGame
  
  class CardDealer
    
    include Singleton
    
    private
    
    def initialize
      @unusedMonsters = Array.new
      @usedMonsters = Array.new
      @unusedTreasures = Array.new
      @usedTreasures = Array.new
      
      initCards
    end
    
    def initTreasureCardDeck
   
      @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigación", 3, TreasureKind::SHOES)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-comicón", 1, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-gnomicón", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necro-playboycón", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Tentáculo de pega", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
      
    end
    
    def initMonsterCardDeck
         
      #[0]
      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.",0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      @unusedMonsters << Monster.new("3 Byakhees de bonanza",8,prize,badConsequence)

      #[1]
      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new("Tenochtitlan", 2, prize, badConsequence)

      #[2]
      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("El primodial bostezo contagioso. Pierdes el calzado visible.", 0, [TreasureKind::SHOES], [])
      @unusedMonsters << Monster.new("El sopor de Dunwich", 2, prize, badConsequence)

      #[3]
      prize = Prize.new(4, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new("Demonios de Magaluf", 2, prize, badConsequence)

      #[4]
      prize = Prize.new(3, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles.", 0, BadConsequence::MAXTREASURES, 0)
      @unusedMonsters << Monster.new("El gorrón en el umbral", 13, prize, badConsequence)

      #[5]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.",0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new("H.P. Munchcraft", 6, prize, badConsequence)

      #[6]
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new("Necrófago", 13, prize, badConsequence)

      #[7]
      prize = Prize.new(3, 2)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
      @unusedMonsters << Monster.new("El rey de rosado", 11, prize, badConsequence)

      #[8]
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.new("Flecher", 2, prize, badConsequence)

      #[9]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
      @unusedMonsters << Monster.new("Los hondos", 8, prize, badConsequence)

      #[10]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
      @unusedMonsters << Monster.new("Semillas Cthulhu", 4, prize, badConsequence)

      #[11]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible.", 1, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("Dameargo", 1, prize, badConsequence)

      #[12]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
      @unusedMonsters << Monster.new("Pollipólipo volante", 3, prize, badConsequence)

      #[13]
      prize = Prize.new(3, 1)
      badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estás muerto.")
      @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 14, prize, badConsequence)

      #[14]
      prize = Prize.new(3, 1)
      badConsequence = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
      @unusedMonsters << Monster.new("Familia feliz", 1, prize, badConsequence)

      #[15]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2, [TreasureKind::BOTHHANDS], [])
      @unusedMonsters << Monster.new("Roboggoth", 8, prize, badConsequence)

      #[16]
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 1, [TreasureKind::HELMET], [])
      @unusedMonsters << Monster.new("El espía sordo", 5, prize, badConsequence)

      #[17]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      @unusedMonsters << Monster.new("Tongue", 19, prize, badConsequence)

      #[18]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("Bicéfalo", 21, prize, badConsequence)

      #[19] -2 contra sectarios
      prize = Prize.new(3,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes una mano visible", 0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("El mal indecible impronunciable", 10, prize, badConsequence)

      #[20] +2 contra sectarios
      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes tus tesoros visibles. Jajaja.", 0, BadConsequence::MAXTREASURES, 0)
      @unusedMonsters << Monster.new("Testigos oculares", 6, prize, badConsequence)

      #[21] +4 contra sectarios
      prize = Prize.new(5, 2)
      badConsequence = BadConsequence.newDeath("Hoy no es tu dia de suerte. Mueres")
      @unusedMonsters << Monster.new("El gran cthulhu", 20, prize, badConsequence)

      #[22] -2 contra sectarios
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Tu gobierno te recorta 2 niveles", 2, 0, 0)   
      @unusedMonsters << Monster.new("Serpiente Politico", 8, prize, badConsequence)

      #[23] +5 contra sectarios
      prize = Prize.new(1, 1);
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS])
      @unusedMonsters << Monster.new("Felpuggoth", 2, prize, badConsequence)

      #[24] -4 contra sectarios
      prize = Prize.new(4, 2);
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles", 2, 0, 0)
      @unusedMonsters << Monster.new("Shoggoth", 16, prize, badConsequence)

      #[25] +3 contra sectarios
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0)
      @unusedMonsters << Monster.new("Lolitagooth", 2, prize, badConsequence)
   
    end
    
    def initCultistCardDeck
      
    end
    
    def shuffleTreasures
      @unusedTreasures.shuffle!
    end
    
    def shuffleMonsters
      @unusedMonsters.shuffle!
    end
    
    def suffleCultists
      
    end
    
    public 
    
    def nextTreasure
      if(@unusedTreasures.empty?)
        for usedT in @usedTreasures
          @unusedTreasures << usedT
          @usedTreassures.delete(usedT)
        end
        shuffleTreasures
      end
      treasure = @unusedTreasures.pop
      @usedTreasures <<  treasure
      @unusedTreasures.delete(treasure)
      return treasure
    end
    
    def nextMonster
      if(@unusedMonsters.empty?)
        for usedM in @usedMonsters
          @unusedMonsters << usedM
          @usedMonsters.delete(usedM)
        end
        shuffleMonsters
      end
      monster = @unusedMonsters.pop
      @usedMonsters <<  monster
      @unusedMonsters.delete(monster)
      return monster
    end
    
    def nextCultist
      
    end
    
    def giveTreasureBack(t)
      @usedTreasures << t
      @unusedTreasures.delete(t)
    end
    
    def giveMonsterBack(m)
      @usedMonsters << m
      @unusedMonsters.delete(m)
    end
    
    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
      shuffleTreasures
      shuffleMonsters
    end
    
  end
  
end
