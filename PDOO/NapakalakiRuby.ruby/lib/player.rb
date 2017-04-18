#encoding: utf-8

require_relative "treasure"
require_relative "bad_consequence"
require_relative "combat_result"
require_relative "prize"
require_relative "card_dealer"
require_relative "dice"

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
      @hiddenTreasures = Array.new
      @visibleTreasures = Array.new
      @pendingBadConsequence = nil
      
    end
    
    public 
    
    def getName
      return @name
    end
    
    private
    
    def bringToLife
      @dead = false
    end
    
    def getCombatLevel
      cLevel = @level
      for vTreasure in @visibleTreasures 
        cLevel = cLevel + vTreasure.getBonus
      end
      cLevel
    end
    
    def incrementLevels(i)
      @level = @level + i
    end
    
    def decrementLevels(i)
      @level = @level - i
      if @level <= 0 
        @level = 1
      end
    end
    
    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end
    
    def applyPrize(m)
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      
      nTreasures = m.getTreasuresGained
      
      if(nTreasures > 0)
        dealer = CardDealer.instance
        
        nTreasures.times do
          treasure = dealer.nextTreasure
          @hiddenTreasures << treasure
        end
      end
    end
    
    def applyBadConsequence(m)
      badConsequence = m.getBadConsequence
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      
      pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end
    
    def canMakeTreasureVisible(t)
      @@manos=0
      @@armadura=0
      @@casco=0
      @@pies=0
      for tes in @visibleTreasures
        if tes.getType == TreasureKind::ONEHAND
          @@manos += 1
        elsif tes.getType == TreasureKind::BOTHHANDS
          @@manos += 2
        elsif tes.getType == TreasureKind::HELMET
          @@casco += 1
        elsif tes.getType == TreasureKind::SHOES
          @@pies += 1
        elsif tes.getType == TreasureKind::ARMOR
          @@armadura += 1
        end
      end 
   
      if t.getType == TreasureKind::ONEHAND
        @@manos < 2
      elsif t.getType == TreasureKind::BOTHHANDS
        @@manos == 0
      elsif t.getType == TreasureKind::HELMET
        @@casco == 0
      elsif t.getType == TreasureKind::SHOES
        @@pies == 0
      elsif t.getType == TreasureKind::ARMOR
        @@armadura == 0
      end
    end
    
    def howManyVisibleTreasures(tKind)
      return @visibleTreasures.count(tKind)
    end
    
    def dieIfNoTreasures
      if @hiddenTreasures.empty? == true && @visibleTreasures.empty? == true
        @dead = true
      end
    end
    
    public
    
    def isDead
      return @dead
    end
    
    def getHiddenTreasures
      @hiddenTreasures
    end
    
    def getVisibleTreasures
      @visibleTreasures
    end
    
    def combat(m)
      myLevel = getCombatLevel
      monsterLevel = m.getCombatLevel
      
      if (!canISteal)
        dice = Dice.getInstance
        number = dice.nextNumber
        
        if(number < 3)
          enemyLevel = @enemy.getCombatLevel
          monsterLevel += enemyLevel 
        end
      end
      
      if ( myLevel > monsterLevel)
        if(@level >= MAXLEVEL)
          combatResult = CombatResult::WINGAME
        else
          combatResult = CombatResult::WIN
        end
        applyPrize(m)
        
      else
        combatResult = CombatResult::LOSE
        applyBadConsequence(m)
      end
      
      combatResult
    end  
    
    def makeTreasureVisible(t)
      canI = canMakeTreasureVisible(t)
      if canI
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
      end
    end
    
    def discardHiddenTreasure(t)
      @hiddenTreasures.delete(t)
      if((@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty))
        @pendingBadConsequence.substractHiddenTreasures(t)
      end
      
      dieIfNoTreasures
    end
    
    def discardVisibleTreasure(t)
      @visibleTreasures.delete(t)
      if ((@pendingBadConsequence != nil) && (!@pendingBadConsequence.isEmpty))
        @pendingBadConsequence.substractVisibleTreasures(t)
      end
      
      dieIfNoTreasures
    end
    
    def validState
      return false if (@hiddenTreasures.size > 4)
      
      return true if (@pendingBadConsequence == nil)
      
      return true if (@pendingBadConsequence.isEmpty)
      
      return false
    end
    
    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance 
      
      bringToLife
      
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
      
      number = dice.nextNumber
      if( number > 1)
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
      
      if( number == 6)
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end  
    end   
    
    def getLevels
      return @levels
    end
    
    def stealTreasure
      treasure = nil
      canI = canISteal
      if (canI)
        canYou = @enemy.canYouGiveMeATreasure
        if (canYou)
          treasure = @enemy.giveMeATreasure
          @hiddenTreasures << treasure
          haveStolen
        end 
      end
      treasure
    end
    
    def setEnemy(jugador)
      @enemy = jugador
    end
    
    public
    
    def giveMeATreasure
      tesoro = @hiddenTreasures.at(rand(@hiddenTreasures.size))
      @hiddenTreasures.delete(tesoro)
      return tesoro
    end 
    
    public 
    
    def canISteal
      return @canISteal
    end
    
    public
    
    def canYouGiveMeATreasure
      return !(@visibleTreasures.empty?)
    end
    
    def haveStolen
      @canISteal  = false
    end
    
    public 
    
    def discardAllTreasures
      for visT in @visibleTreasures
        discardVisibleTreasure(visT)
      end
     
      for hidT in @hiddenTreasures
        discardHiddenTreasure(hidT)
      end
    end
    
    def to_s
      "#{@name} \n\tNivel: #{@level} \n\tCombat Level: #{getCombatLevel}"
    end
  end
end
