# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#module Napakalaki

class BadConsequence
  
  attr_reader :text, :level, :nVisibleTreasures, :nHiddenTreasures
  
  def initialize(texto, nivel, nvisible, nhidden)
        @text = texto
        @level = nivel
        @nVisibleTreasures = nvisible
        @nHiddenTreasures = nhidden
  end
  
  def get_text
      @text
  end
  
  def get_level
      @level
  end
  
  def getn_visible_treasures
      @nVisibleTreasures
  end
  
  def getn_hiden_treasures
      @nHiddenTreasures
  end
  
  def to_s
      "Texto: #{@text}\nNiveles perdidos: #{@level}"   
  end
end  
  
