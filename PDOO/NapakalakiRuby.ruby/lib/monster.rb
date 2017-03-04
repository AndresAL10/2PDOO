require_relative "prize.rb"
require_relative "bad_consequence.rb"

#module Napakalaki

class Monster
  
  attr_reader :name, :combatlevel, :prize, :badConsequence
 
  def initialize( nombre, nivel, buenrollo, malrollo)
    @name = nombre
    @combatlevel = nivel
    @prize = buenrollo
    @badConsequence = malrollo 
  end
  
  def to_s
    mensaje = "\nNombre: #{@name} \nNivel de combate: #{@combatlevel}"
    mensaje += "\nPremio: #{@prize} \nMal rollo: #{@badConsequence}"
  end
  
end
