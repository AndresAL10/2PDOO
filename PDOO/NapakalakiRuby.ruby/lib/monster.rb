require_relative "prize.rb"
require_relative "bad_consequence.rb"

#module Napakalaki

class Monster
  
  attr_reader :name, :combatLevel, :prize, :badConsequence
 
  def initialize( nombre, nivel, buenrollo, malrollo)
    @name = nombre
    @combatLevel = nivel
    @prize = buenrollo
    @badConsequence = malrollo 
  end
  
  def to_s
    mensaje = "\nNombre: #{@name} \nNivel de combate: #{@combatLevel}"
    mensaje += "\nPremio: #{@prize} \nMal rollo: #{@badConsequence}"
  end
  
end
