#encoding: utf-8

module NapakalakiGame
  class Player
    
    MAXLEVEL = 10
    
    private
    
    def initialize(name)
      @name = name
      @dead = true
      @enemy = nil
      @level = 1
      @canISteal = true
      @hiddenTreasures = 0
      @visibleTreasures = 0
      @pendingBadConsequence = nil
      
    end
    
    public 
    
    def getName
      return @name
    end
    
    private
    
    def bringToLife
      @dead = true
    end
    
    def getCombatLevel
      
    end
    
    def incrementLevels(i)
      @level = @level + i
    end
    
    def decrementLevels(i)
      @level = @level - i
    end
    
    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end
    
    def applyPrize(m)
      
    end
    
    def applyBadConsequence(m)
      
    end
    
    def canMakeTreasureVisible(t)
      
    end
    
    def howManyVisibleTreasures(tKind)
      return @visibleTreasures.count(tKind)
    end
    
    def dieIfNoTreasures
      if @hiddenTreasures.empty? == true && @visibleTreasure.empty? == true
        @dead = true
      end
    end
    
    public
    
    def isDead
      return @dead
    end
    
    def getHiddenTreasures
      
    end
    
    def getVisibleTreasures
      
    end
    
    def combat(m)
      
    end
    
    def makeTreasureVisible(t)
     
    end
    
    def discardHiddenTreasure(t)
      
    end
    
    def discardVisibleTreasure(t)
      
    end 
    
    def validState
      if @visibleTreasures.size() < 4 && !(self.pendingBadConsequence())
        return true
      else 
        return false
      end
    end
    
    def initTreasures
      
    end   
    
    def getLevels
      return @levels
    end
    
    def stealTreasure
      
    end
    
    def setEnemy(jugador)
      @enemy = jugador
    end
    
    private
    
    def giveMeATreasure
      
    end 
    
    public 
    
    def canISteal
      return @canISteal
    end
    
    private 
    
    def canYouGiveMeATreasure
      return !(@visibleTreasure.empty?)
    end
    
    def haveStolen
      @canISteal  = false
    end
    
    public 
    
    def discardAllTreasures
     
    end
  end
end
