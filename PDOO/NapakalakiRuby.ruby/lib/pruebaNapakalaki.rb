#encoding: utf-8

#include
require_relative "monster"
require_relative "bad_consequence"
require_relative "treasure_kind"
require_relative "prize"
require_relative "test"

class PruebaNapakalaki
  
  #attr_reader :monsters


  def initialize
    @@monsters = []
  end

  def main
    crearListaMonstruos
    puts "LISTA DE TODOS LOS MONSTRUOS"
    imprimirMonstruos(@@monsters)
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO NIVEL ES SUPERIOR A 10"
    imprimirMonstruos(nivelSuperiorA10)
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO MAL ROLLO SOLO IMPLICA PERDIDA DE NIVEL"
    imprimirMonstruos(soloPerdidaLevel)
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO BUEN ROLLO ES GANANCIA DE NIVEL SUPERIOR A 1"
    imprimirMonstruos(gananciaNivel)
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE ARMADURA"
    imprimirMonstruos(perdidaEspecifica(TreasureKind::ARMOR))
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE DOS MANOS"
    imprimirMonstruos(perdidaEspecifica(TreasureKind::BOTHHANDS))
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE CASCO"
    imprimirMonstruos(perdidaEspecifica(TreasureKind::HELMET))
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE UNA MANO"
    imprimirMonstruos(perdidaEspecifica(TreasureKind::ONEHAND))
    puts "-----------------------------------------------------------------"
    puts "\nMONSTRUOS CUYO MAL ROLLO ES UNA PERDIDA ESPECIFICA DE CALZADO"
    imprimirMonstruos(perdidaEspecifica(TreasureKind::SHOES))
    
  end

  def crearListaMonstruos


  #[0]
  prize = Prize.new(2,1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.",0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
  @@monsters << Monster.new("3 Byakhees de bonanza",8,prize,badConsequence)

  #[1]
  prize = Prize.new(1,1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0, [TreasureKind::ARMOR], [])
  @@monsters << Monster.new("Tenochtitlan", 2, prize, badConsequence)

  #[2]
  prize = Prize.new(1,1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("El primodial bostezo contagioso. Pierdes el calzado visible.", 0, [TreasureKind::SHOES], [])
  @@monsters << Monster.new("El sopor de Dunwich", 2, prize, badConsequence)

  #[3]
  prize = Prize.new(4, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
  @@monsters << Monster.new("Demonios de Magaluf", 2, prize, badConsequence)

  #[4]
  prize = Prize.new(3, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles.", 0, 5, 0)
  @@monsters << Monster.new("El gorrón en el umbral", 13, prize, badConsequence)

  #[5]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.",0, [TreasureKind::ARMOR], [])
  @@monsters << Monster.new("H.P. Munchcraft", 6, prize, badConsequence)

  #[6]
  prize = Prize.new(1, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0, [TreasureKind::ARMOR], [])
  @@monsters << Monster.new("Necrófago", 13, prize, badConsequence)

  #[7]
  prize = Prize.new(3, 2)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
  @@monsters << Monster.new("El rey de rosado", 11, prize, badConsequence)

  #[8]
  prize = Prize.new(1, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
  @@monsters << Monster.new("Flecher", 2, prize, badConsequence)

  #[9]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
  @@monsters << Monster.new("Los hondos", 8, prize, badConsequence)

  #[10]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
  @@monsters << Monster.new("Semillas Cthulhu", 4, prize, badConsequence)

  #[11]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible.", 1, [TreasureKind::ONEHAND], [])
  @@monsters << Monster.new("Dameargo", 1, prize, badConsequence)

  #[12]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
  @@monsters << Monster.new("Pollipólipo volante", 3, prize, badConsequence)

  #[13]
  prize = Prize.new(3, 1)
  badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estás muerto.")
  @@monsters << Monster.new("Yskhtihyssg-Goth", 14, prize, badConsequence)

  #[14]
  prize = Prize.new(3, 1)
  badConsequence = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
  @@monsters << Monster.new("Familia feliz", 1, prize, badConsequence)

  #[15]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2, [TreasureKind::BOTHHANDS], [])
  @@monsters << Monster.new("Roboggoth", 8, prize, badConsequence)

  #[16]
  prize = Prize.new(1, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 1, [TreasureKind::HELMET], [])
  @@monsters << Monster.new("El espía sordo", 5, prize, badConsequence)

  #[17]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
  @@monsters << Monster.new("Tongue", 19, prize, badConsequence)

  #[18]
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
  @@monsters << Monster.new("Bicéfalo", 21, prize, badConsequence)

  #[19] -2 contra sectarios
  prize = Prize.new(3,1)
  badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes una mano visible", 0, [TreasureKind::ONEHAND], [])
  @@monsters << Monster.new("El mal indecible impronunciable", 10, prize, badConsequence)

  #[20] +2 contra sectarios
  prize = Prize.new(2,1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes tus tesoros visibles. Jajaja.", 0, 5, 0)
  @@monsters << Monster.new("Testigos oculares", 6, prize, badConsequence)

  #[21] +4 contra sectarios
  prize = Prize.new(5, 2)
  badConsequence = BadConsequence.newDeath("Hoy no es tu dia de suerte. Mueres")
  @@monsters << Monster.new("El gran cthulhu", 20, prize, badConsequence)

  #[22] -2 contra sectarios
  prize = Prize.new(2, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Tu gobierno te recorta 2 niveles", 2, 0, 0)   
  @@monsters << Monster.new("Serpiente Politico", 8, prize, badConsequence)

  #[23] +5 contra sectarios
  prize = Prize.new(1, 1);
  badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS])
  @@monsters << Monster.new("Felpuggoth", 2, prize, badConsequence)

  #[24] -4 contra sectarios
  prize = Prize.new(4, 2);
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles", 2, 0, 0)
  @@monsters << Monster.new("Shoggoth", 16, prize, badConsequence)

  #[25] +3 contra sectarios
  prize = Prize.new(1, 1)
  badConsequence = BadConsequence.newLevelNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0)
  @@monsters << Monster.new("Lolitagooth", 2, prize, badConsequence)

  end
  
  def nivelSuperiorA10
    @@monsters.select{|monster| monster.combatLevel > 10}
  end
  
  def soloPerdidaLevel
    @@monsters.select {|monster| monster.badConsequence.levels != 0 &&
        monster.badConsequence.nVisibleTreasures == 0 && 
        monster.badConsequence.nHiddenTreasures == 0 &&
        monster.badConsequence.specificHiddenTreasures.empty? == true &&
        monster.badConsequence.specificVisibleTreasures.empty? == true &&
        monster.badConsequence.death == false
    }
  end
  
  def gananciaNivel
    @@monsters.select{ |monster| monster.prize.level > 1}
  end
  
  def perdidaEspecifica(tipoTesoro)
    @@monsters.select{ |monster| monster.badConsequence.specificHiddenTreasures.include?(tipoTesoro) ||
        monster.badConsequence.specificVisibleTreasures.include?(tipoTesoro)
    }
  end
  
  def imprimirMonstruos(monsters)
    for monstruo in monsters 
      puts monstruo
    end
  end
  
end
 
#PruebaNapakalaki.new.main

