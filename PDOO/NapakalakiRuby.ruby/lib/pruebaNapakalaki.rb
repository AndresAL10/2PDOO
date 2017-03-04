#include

require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'treasure_kind'
require_relative 'prize'

class PruebaNapakalaki
  
  attr_reader :monsters
  
  
  def initialize 
    createMonsters
    puts "\nTodos los monstruos:"
    puts "\n--------------------------------------------------------" 
    printMonsters(@@monsters)
    
  end
  
  private def createMonsters
    @@monsters = Array.new
    
    prize = Prize.new(2,1)
    badConsequence = BadConsequence.new("Pierdes tu armadura visible y otra oculta.", 1, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    @@monsters << Monster.new("3 Byakhees de bonanza",8,prize,badConsequence)
  end
  
  private def printMonsters(monsters)
    monsters.each {|monster|puts monster }
  end
  
end

PruebaNapakalaki.new