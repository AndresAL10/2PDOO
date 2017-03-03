# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'prize'
require_relative 'bad_consequence'

#module Napakalaki

class Monster
  
  attr_reader :name, :combatlevel, :prize, :badConsequence,
 
 def initialize( nombre, nivel, buenrollo, malrollo)
    @name = nombre
    @combatlevel = nivel
    @prize = buenrollo
    @badConsequence = malrollo 
  end
  
 def get_name
   @name
 end
 
 def get_combat_level
   @combatlevel
 end
 
 def get_prize
   @prize
 end
 
 def get_bad_consequence
   @badConsequence
 end
 
 def to_s
    "Nombre: #{@name} \nNivel de combate: #{@combatlevel}"
 end
end
