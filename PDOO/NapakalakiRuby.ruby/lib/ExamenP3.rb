#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "monster"
require_relative "player_card_deck"
#require_relative "treasure"

module Test4
  class ExamenP3
    @@contador=0
    def initialize
      
    end
    
    def self.contabilizar
      if @@contador<101
        @@contador=@@contador+1
      end
      puts @@contador
    end
    
    def ejercicio3
      self.class.contabilizar
      
      prize=NapakalakiGame::Prize.new(23, 12)
      
      specificVisibleTreasures=[NapakalakiGame::TreasureKind::ARMOR,NapakalakiGame::TreasureKind::SHOE]
      specificHiddenTreasures=[NapakalakiGame::TreasureKind::ONEHAND,NapakalakiGame::TreasureKind::ONEHAND,NapakalakiGame::TreasureKind::SHOE]
      bc=NapakalakiGame::SpecificBadConsequence.new("Pierdes una armadura y un calzado visibles y 2 tesoros de una mano y un calzado ocultos",
        0,specificVisibleTreasures, specificHiddenTreasures)
      
      m=NapakalakiGame::Monster.new("Monstruo 3",50,prize,bc)
      
      pCardDeck=NapakalakiGame::PlayerCardDeck.instance
      
      p1=pCardDeck.nextPlayer
      
      t1=NapakalakiGame::Treasure.new("Botas de lluvia ácida", 3, NapakalakiGame::TreasureKind::BOTHHANDS)
      t2=NapakalakiGame::Treasure.new("Botas de investigación", 3, NapakalakiGame::TreasureKind::SHOE)
      t3=NapakalakiGame::Treasure.new("A prueba de babas", 3, NapakalakiGame::TreasureKind::ARMOR)
      t4=NapakalakiGame::Treasure.new("Clavo de rail ferroviario", 3, NapakalakiGame::TreasureKind::ONEHAND)
      
      
      p1.aniadir_tesoro_oculto(t1)
      p1.aniadir_tesoro_oculto(t2)
      p1.aniadir_tesoro_oculto(t3)
      p1.aniadir_tesoro_oculto(t4)
      
      p1.makeTreasureVisible(t1)
      p1.makeTreasureVisible(t2)
      p1.makeTreasureVisible(t3)
      p1.makeTreasureVisible(t4)
      
      puts p1.combat(m)
      puts "\n"
      puts p1
      puts "\n"
      
    end
    
    def ejercicio4
      self.class.contabilizar
      
      pCardDeck=NapakalakiGame::PlayerCardDeck.instance
      p1=pCardDeck.nextPlayer
      
      t1=NapakalakiGame::Treasure.new("A prueba de babas", 4, NapakalakiGame::TreasureKind::ARMOR)
      t2=NapakalakiGame::Treasure.new("Botas de investigación", 4, NapakalakiGame::TreasureKind::SHOE)
      t3= NapakalakiGame::Treasure.new("Clavo de rail ferroviario", 4, NapakalakiGame::TreasureKind::ONEHAND)
      t4=NapakalakiGame::Treasure.new("Botas de lluvia ácida", 4, NapakalakiGame::TreasureKind::BOTHHANDS)
      t5=NapakalakiGame::Treasure.new("Botas 2", 4, NapakalakiGame::TreasureKind::SHOE)
      t6=NapakalakiGame::Treasure.new("Espada a una mano", 4, NapakalakiGame::TreasureKind::ONEHAND)
      t7=NapakalakiGame::Treasure.new("Armadura", 4, NapakalakiGame::TreasureKind::ARMOR)
      
      p1.aniadir_tesoro_oculto(t1)
      p1.aniadir_tesoro_oculto(t2)
      p1.aniadir_tesoro_oculto(t3)
      p1.aniadir_tesoro_oculto(t4)
      p1.aniadir_tesoro_oculto(t5)
      p1.aniadir_tesoro_oculto(t6)
      p1.aniadir_tesoro_oculto(t7)
      
      p1.makeTreasureVisible(t1)
      p1.makeTreasureVisible(t2)
      p1.makeTreasureVisible(t3)
      p1.makeTreasureVisible(t4)
      p1.makeTreasureVisible(t5)
      p1.makeTreasureVisible(t6)
      p1.makeTreasureVisible(t7)
      
      
      puts p1
      puts "\n"
      
    end
    def ejercicio51
      mimalrollo = NapakalakiGame::SpecificBadConsequence.new("Pierdes todos los cascos visibles, todos los calzados visibles, todos los tesoros de una mano ocultos y un tesoro de dos manos oculto", 0, [NapakalakiGame::TreasureKind::HELMET, NapakalakiGame::TreasureKind::SHOE], [NapakalakiGame::TreasureKind::ONEHAND, NapakalakiGame::TreasureKind::ONEHAND, NapakalakiGame::TreasureKind::BOTHHANDS])
      
        visibles = Array.new
        
        visibles << NapakalakiGame::Treasure.new("casco", 1, NapakalakiGame::TreasureKind::HELMET)
        visibles << NapakalakiGame::Treasure.new("dosmanos", 1, NapakalakiGame::TreasureKind::ONEHAND)
        
        ocultos = Array.new
        
        ocultos << NapakalakiGame::Treasure.new("unamano", 1, NapakalakiGame::TreasureKind::ONEHAND)
        
        bc=mimalrollo.adjustToFitTreasureLists(visibles, ocultos)
        
        puts mimalrollo
        puts "============"
        puts bc
    end
    def ejercicio5
      mimalrollo = NapakalakiGame::SpecificBadConsequence.new(
        "Pierdes tus tesoros visibles de las manos, pierdes un casco visible y además pierdes 2 tesoros de una mano ocultos y un casco oculto",
        0, [NapakalakiGame::TreasureKind::ONEHAND, NapakalakiGame::TreasureKind::ONEHAND,
          NapakalakiGame::TreasureKind::BOTHHANDS, NapakalakiGame::TreasureKind::HELMET],
        [NapakalakiGame::TreasureKind::ONEHAND, NapakalakiGame::TreasureKind::ONEHAND,
          NapakalakiGame::TreasureKind::HELMET])
      
        visibles = Array.new
        
        visibles << NapakalakiGame::Treasure.new("calzado", 1, NapakalakiGame::TreasureKind::SHOE)
        visibles << NapakalakiGame::Treasure.new("unamano", 1, NapakalakiGame::TreasureKind::ONEHAND)
        visibles << NapakalakiGame::Treasure.new("casco", 1, NapakalakiGame::TreasureKind::HELMET)
        visibles << NapakalakiGame::Treasure.new("unamano2", 1, NapakalakiGame::TreasureKind::ONEHAND)
        
        ocultos = Array.new
        
        ocultos << NapakalakiGame::Treasure.new("unamano3", 1, NapakalakiGame::TreasureKind::ONEHAND)
        
        puts mimalrollo
        
        bc=mimalrollo.adjustToFitTreasureLists(visibles, ocultos) #ADJUST DEBE MODIFICAR EL PROPIO BC O DEVOLVER OTRO??
        
        puts bc
    end
    
    
    def ejercicio6 #posible ejer P4
      malrollo1=NapakalakiGame::NumericBadConsequence.new("malrollo-numerico", 3, 2, 2)
      malrollo2=NapakalakiGame::DeathBadConsequence.new("malrollo-muerte")
      malrollo3=NapakalakiGame::SpecificBadConsequence.new("malrollo-Specific",0,
        [NapakalakiGame::TreasureKind::ARMOR, NapakalakiGame::TreasureKind::HELMET],
        [NapakalakiGame::TreasureKind::SHOE])
      
      malosrollos=Array.new
      
      malosrollos<<malrollo1
      malosrollos<<malrollo2
      malosrollos<<malrollo3
      
      t1=NapakalakiGame::Treasure.new("Armadura1", 3,NapakalakiGame::TreasureKind::ARMOR)
      t2=NapakalakiGame::Treasure.new("Shoe1", 3,NapakalakiGame::TreasureKind::SHOE)
      visibles=Array.new
      ocultos=Array.new
      visibles<<t1
      visibles<<t2
      ocultos<<t2
      for m in malosrollos
        puts m
        m.substractVisibleTreasure(t1)
        m.substractHiddenTreasure(t2)
        puts m
      end
      #for m in malosrollos
      #  puts m
      #  puts m.adjustToFitTreasureLists(visibles, ocultos)
      #end
    end
    
  end
  
  #ExamenP3.new.ejercicio3
  
  #ExamenP3.new.ejercicio4
  ExamenP3.new.ejercicio6
    
end


