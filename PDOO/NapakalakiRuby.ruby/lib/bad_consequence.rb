#module Napakalaki

class BadConsequence
  
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
    :specificVisibleTreasures, :specificHiddenTreasures, :death
  
  def initialize(atext, someLevels, someVisibleTreasures,someHiddenTreasures,someSpecificVisibleTreasures,someSpecificHiddenTreasures,death)
        @text = atext
        @levels = someLevels
        @nVisibleTreasures = someVisibleTreasures
        @nHiddenTreasures = someHiddenTreasures
        @specificVisibleTreasures = someSpecificVisibleTreasures
        @specificHiddenTreasures = someSpecificHiddenTreasures
        @death = death
  end
  
  def BadConsequence.newLevelNumberOfTreasures(aText, someLevels,someVisibleTreasures, someHiddenTreasures)
    BadConsequence.new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,[],[],false)
  end
  
  def BadConsequence.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    BadConsequence.new(aText,someLevels, 0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
  end
  
  def BadConsequence.newDeath (aText)
    BadConsequence.new(aText,0,0,0,[],[],true)    
  end
  
  def to_s
      mensaje = "\n\tTexto: #{@text}\n\tNiveles perdidos: #{@levels}"   
      mensaje += "\n\tTesoros visibles perdidos: #{@nVisibleTreasures}"
      mensaje += "\n\tTesoros ocultos perdidos: #{@nHiddenTreasures}"
      mensaje += "\n\tTesoros especificos visibles perdidos: #{@specificVisibleTreasures}"
      mensaje += "\n\tTesoros especificos ocultos perdidos: #{@specificHiddenTreasures}"
      
      if death
        mensaje += "\n\tMuerte: Si"
      else
        mensaje += "\n\tMuerte: No"
      end
      mensaje
  end
  
end  
  
