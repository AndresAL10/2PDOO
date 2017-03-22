#encoding: utf-8

require_relative "prize"
require_relative "bad_consequence"

module NapakalakiGame

  class Monster

    private
    
    def initialize( nombre, nivel, buenrollo, malrollo)
      @name = nombre
      @combatLevel = nivel
      @prize = buenrollo
      @badConsequence = malrollo 
    end
    
    public 
    
    def getName
      return @name
    end
    
    def getCombatLevel
      return @combatLevel
    end
    
    def getBadConsequence
      return @badConsequence
    end
    
    def getLevelsGained
      return @prize.getLevels()
    end
    
    def getTreasuresGained
      return @prize.getTreasures()
    end
    
    def to_s
      mensaje = "\nNombre: #{@name} \nNivel de combate: #{@combatLevel}"
      mensaje += "\nPremio: #{@prize} \nMal rollo: #{@badConsequence}"
    end

  end
end
