#encoding: utf-8

require_relative "prize"
require_relative "monster"
require_relative "bad_consequence"
require_relative "treasure_kind"
module NapakalakiGame

class Test
  
  prize = Prize.new(0,0)
  badConsequence = BadConsequence.newLevelSpecificTreasures("------",0, [], [])
  @@monster = Monster.new("----------",0,prize,badConsequence)
  
  def initialize
    prize = Prize.new(0,0)
    badConsequence = BadConsequence.newLevelSpecificTreasures("------",0, [], [])
    @monster = Monster.new("----------",0,prize,badConsequence)
  end

  def testClase
    prize = Prize.new(0,0)
    badConsequence = BadConsequence.newLevelSpecificTreasures("------",0, [], [])
    @@monster = Monster.new("-----Prueba test-----",0,prize,badConsequence)
  end
  
  def testInstancia
    @monster = @@monster
    puts @monster
  end
  
  def main 
    test = Test.new
    test.testClase()
    test.testInstancia()
  end
end

puts "PRUEBA CLASE TEST"
Test.new.main
end
