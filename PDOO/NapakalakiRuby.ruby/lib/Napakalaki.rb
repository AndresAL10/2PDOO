# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  require "singleton"
  
  class Napakalaki
    
    include Singleton
    
    private
    
    def initialize
      @currentMonster = nil
      @currentPlayer = nil
      @players = Array.new
      @dealer = CardDealer.instance
    end
    
    def initPlayers(names)
      for name in names
        @players << Player.new(name)
      end
    end
    
    def nextPlayer
      if @currentPlayer == nil
        @currentPlayer = @players.at(rand(@players.size))
      else
        indice = @players.index(@currentPlayer)
        if (@players.size -1) == indice
          indice = 0
        else
          indice = @currentPlayer + 1
        end
      end 
      return @currentPlayer = @players.at(indice)
    end
    
    def nextTurnAllowed
      allowed = false;
      allowed = (@currentPLayer == nil) || @currentPLayer.validState
    end
    
    def setEnemies
      for player in @players
        loop do 
        enemigo = @players.at(rand(@players.size))
        break if (player != enemigo)
        end
        player.setEnemy(enemigo)
      end
      
    end
    
    public 
    
    def developCombat
      cres = @currentPLayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      return cres
    end
    
    def discardVisibleTreasures(treasures)
      for treasure in treasures
        treas = treasure
        @currentPlayer.discardVisibleTreasure(treas)
        @dealer.giveTreasureBack(treas)
      end
    end
    
    def discardHiddenTreasures(treasures)
      for treasure in treasures
        treas = treasure
        @currentPlayer.discardHiddenTreasure(treas)
        @dealer.giveTreasureBack(treas)
      end
    
    def makeTreasuresVisible(treasures)
      for treasure in treasures
        @currentPlayer.makeTreasureVisible(treasure)
      end
    end
    
    def initGame(players)
      initPLayers(players)
      setEnemies
      @dealer.initCards
      nextTurn
    end
    
    def getCurrentPlayer
      @currentPlayer
    end
    
    def getCurrentMonster
      @currentMonster
    end
    
    def nextTurn
      stateOK = nextTurnAllowed
      if (stateOK)
        @currentMonster = @dealer.nextMonster
        @currentPlayer = nextPlayer
        dead = @currentPlayer.isDead
        
        if (dead)
          @currentPlayer.initTreasures
        end
      end
      stateOK
    end
   
    def endOfGame(result)
      res = result == CombatResult::WINGAME
      return res
    end
  end
end
