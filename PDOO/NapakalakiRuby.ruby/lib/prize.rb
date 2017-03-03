
#module Napakalaki

class Prize
  
  attr_reader :treasures, :levels
  
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end
  
  def get_levels
        @levels
  end
  
  def get_treasures
        @treasures
  end
  
  def to_s
    "Tesoros ganados: #{@treasures}\nNiveles ganados: #{@level}"
  end
end
