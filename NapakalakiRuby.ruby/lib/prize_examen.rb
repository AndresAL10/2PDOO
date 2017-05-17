#encoding: utf-8

module NapakalakiGame
  
  class PrizeExamen
    
    private_class_method :new
    
    def initialize(treasures, levels)
      @treasures = treasures
      @level = levels
    end
    
    def self.newNumeroNiveles(n)
      new(2,n)
    end
    
    def self.newNumeroTesoros(t)
      new(t,3)
    end
    
    def getTreasures
      return @treasures
    end
    
    def getLevels
      return @level
    end

    def to_s
      "\n\tTesoros ganados: #{@treasures}\n\tNiveles ganados: #{@level}"
    end
  end
end
