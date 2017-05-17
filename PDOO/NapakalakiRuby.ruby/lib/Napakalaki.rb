#encoding: utf-8

require "singleton"
require_relative "card_dealer"
require_relative "player"
require_relative 'combat_result'
require_relative 'cultist_player'


module NapakalakiGame
  
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
        if (@players.size() - 1) == indice
          indice = 0
        else
          indice += 1
        end
        @currentPlayer = @players.at(indice)
      end 
      @currentPlayer
    end
    
    def nextTurnAllowed
      allowed = false;
      allowed = (@currentPlayer == nil) || @currentPlayer.validState
    end
    
    def setEnemies
      enemigo = @players.at(0)
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
      combatResult = @currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      
      if (combatResult == CombatResult::LOSEANDCONVERT)
        card = CardDealer.instance.nextCultist
        sec = CultistPlayer.new(@currentPlayer, card)
        @players.each do |p|
          if (p.getEnemy == @currentPlayer)
            p.setEnemy(sec)
          end
        end
        i = @players.find_index(@currentPlayer)
        @players[i] = sec
        @currentPlayer = sec
      end
      
      return combatResult
    end
    
    def discardVisibleTreasures(treasures)
      for treasure in treasures
        @currentPlayer.discardVisibleTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      end
    end
    
    def discardHiddenTreasures(treasures)
      for treasure in treasures
        @currentPlayer.discardHiddenTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      end
    end
    
    def makeTreasuresVisible(treasures)
      for treasure in treasures
        @currentPlayer.makeTreasureVisible(treasure)
      end
    end
    
    def initGame(players)
      initPlayers(players)
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