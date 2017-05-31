#encoding: utf-8

require_relative 'prize'
require_relative 'death_bad_consequence'
require_relative 'specific_bad_consequence'
require_relative 'numeric_bad_consequence'

module NapakalakiGame

  class Monster
    
    def initialize( nombre, nivel, buenrollo, malrollo, ic=0)
      @name = nombre
      @combatLevel = nivel
      @prize = buenrollo
      @badConsequence = malrollo 
      @levelChangeAgainstCultistPlayer = ic
    end
    
    def getName
      return @name
    end
    
    def getCombatLevel
      return @combatLevel
    end
    def getCombatLevelAgainstCultistPlayer
      level = @combatLevel + @levelChangeAgainstCultistPlayer
      return level
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
