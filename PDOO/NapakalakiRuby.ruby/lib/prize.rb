#encoding: utf-8
#module Napakalaki

class Prize
  
  attr_reader :treasures, :level
  
  def initialize(treasures, levels)
    @treasures = treasures
    @level = levels
  end
 
  def to_s
    "\n\tTesoros ganados: #{@treasures}\n\tNiveles ganados: #{@level}"
  end
end
