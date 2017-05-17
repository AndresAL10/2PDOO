#encoding: utf-8

module Test
  require_relative "card_dealer"
  require_relative "prize_examen"
  require "singleton"
  
  
  class Examen
    
    include Singleton
    
    @@contador = 0
    
    def principal
      puts "Ejecucion número: "
      contabilizar
      puts getContador
      
      
      
      for i in 0..5
        i= i + 1
        puts "ejecucion #{i}"
      end
      #carddealer = NapakalakiGame::CardDealer.instance
      #carddealer.stats
      
      #@@prize = []
      
      #@@prize << NapakalakiGame::PrizeExamen.newNumeroNiveles(1)
      #@@prize << NapakalakiGame::PrizeExamen.newNumeroTesoros(1)
      
      #for prize in @@prize
      #  puts prize
      #end
    
    end
    
    def getContador
      return @@contador
    end
    
    def contabilizar
      if @@contador <10 && @@contador >= 0
        @@contador = @@contador + 1
      else
        @@contador = 10
      end
      
      return @@contador
    end
    
    
  end
  
  Examen.instance.principal


end
