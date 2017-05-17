#encoding: utf-8

require_relative "treasure"
require_relative "bad_consequence"
require_relative "combat_result"
require_relative "prize"
require_relative "card_dealer"
require_relative "dice"

module NapakalakiGame
  
  class Player
    
    @@MAXLEVEL = 10
    
    def self.getMAXLEVEL
      @@MAXLEVEL
    end
    
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
    
    def Player.copyPlayer(p)
      new(p.getName, p.getLevels. p.isDead, p.pendingBadConsequence, p.getVisibleTreasures, p.getHiddenTreasures, p.canIsteal, p.enemy)
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
      manos=0
      armadura=0
      casco=0
      pies=0
      for tes in @visibleTreasures
        if tes.getType == TreasureKind::ONEHAND
          manos += 1
        elsif tes.getType == TreasureKind::BOTHHANDS
          manos += 2
        elsif tes.getType == TreasureKind::HELMET
          casco += 1
        elsif tes.getType == TreasureKind::SHOES
          pies += 1
        elsif tes.getType == TreasureKind::ARMOR
          armadura += 1
        end
      end 
   
      if t.getType == TreasureKind::ONEHAND
        manos < 2
      elsif t.getType == TreasureKind::BOTHHANDS
        manos == 0
      elsif t.getType == TreasureKind::HELMET
        casco == 0
      elsif t.getType == TreasureKind::SHOES
        pies == 0
      elsif t.getType == TreasureKind::ARMOR
        armadura == 0
      end
    end
    
    def howManyVisibleTreasures(tKind)
      return @visibleTreasures.count(tKind)
    end
    
    def dieIfNoTreasures
      if @hiddenTreasures.empty? == true && @visibleTreasures.empty? == true
        @dead = true
        @level = 1
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
      monsterLevel = getOponentLevel(m)
      
      if (!canISteal)
        dice = Dice.instance
        number = dice.nextNumber
        
        if(number < 3)
          enemyLevel = @enemy.getCombatLevel
          monsterLevel += enemyLevel 
        end
      end
      
      if ( myLevel > monsterLevel)
        applyPrize(m)
        
        if(getLevels >= @@MAXLEVEL)
          combatResult = CombatResult::WINGAME
        else
          combatResult = CombatResult::WIN
        end       
      else
        applyBadConsequence(m)
        if shouldConvert 
          combatResult = CombatResult::LOSEANDCONVERT
        else
          combatResult = CombatResult::LOSE
        end       
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
      return @level
    end
    
    def getPendingBadConsequence
      @pendingBadConsequence
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
    
    protected
    
    def getOponentLevel(m)
      m.getCombatLevel
    end
    
    def shouldConvert
      if (Dice.instance.nextNumber == 6)
        should = true
      else 
        should = false
      end
      return should
    end
       
    public 
    
    def getEnemy 
      return @enemy
    end
       
    def discardAllTreasures
      visTreas = @visibleTreasures.dup
      hidTreas = @hiddenTreasures.dup
      
      for visT in visTreas
        discardVisibleTreasure(visT)
      end
     
      for hidT in hidTreas
        discardHiddenTreasure(hidT)
      end
    end
    
    def to_s
      mensaje = "#{@name} \n\tNivel: #{@level} \n\tCombat Level: #{getCombatLevel} \n\tMuerto: "
      if (@dead == true)
        mensaje += "Si" 
      else
        mensaje += "No"
      end
      
      if (@enemy == nil) 
        mensaje += "\n\tEnemigo: No hay enemigo"
      else
        mensaje += "\n\tEnemigo: #{@enemy.getName}"
      end
      
      mensaje += "\n\tTesoros visibles: "
      
      for t in @visibleTreasures
        mensaje += t.to_s
      end
      
      mensaje += "\n\tTesoros ocultos: "
      
      for t in @hiddenTreasures
        mensaje += t.to_s
      end
      
      mensaje += @pendingBadConsequence.to_s
      
    end
  end
end
