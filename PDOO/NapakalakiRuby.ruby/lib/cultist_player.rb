#encoding: utf-8

require_relative 'treasure'
require_relative 'monster'
require_relative 'treasure_kind'
require_relative 'combat_result'
require_relative 'dice'
require_relative 'player'


module NapakalakiGame
  
  class CultistPlayer < Player
  
    @@totalCultistPlayers = 0
    
    def initialize(p, c)
      @name = p.getName
      @level = p.getLevels
      @dead = p.isDead 
      @pendingBadConsequence = p.getPendingBadConsequence
      @visibleTreasures = p.getVisibleTreasures
      @hiddenTreasures = p.getHiddenTreasures
      @canISteal = p.canISteal
      @enemy = p.getEnemy
      @myCultistCard = c
      @@totalCultistPlayers += 1
    end
    
    protected
    
    def getCombatLevel
      combat = (super * 1.7).round(0)
      combat += @@totalCultistPlayers * @myCultistCard.getGainedLevels
    end
    
    
    def getOponentLevel(m)
        m.getCombatLevelAgainstCultistPlayer
    end
    
    def shouldConvert
        false    
    end
    
    public         #He tenido que hacer los dos metodos publicos porque sino me daba error al llamarlos desde otra clase
    
    def giveMeATreasure
      @visibleTreasures.at(rand(@visibleTreasures.size))
    end
      
    def canYouGiveMeATreasure
      @hiddenTreasures.any?      
    end
    
    public
    
    def getTotalCultistPlayers
      @@totalCultistPlayers    
    end
    
    def to_s
      mensaje = super
      mensaje += "\n\t#{@name} es un jugador Sectario. Niveles ganados #{@myCultistCard.getGainedLevels}\n"
    end
  end
end
