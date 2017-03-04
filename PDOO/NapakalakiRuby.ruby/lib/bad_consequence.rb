#module Napakalaki

class BadConsequence
  
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
    :specificVisibleTreasures, :specificHiddenTreasures, :death
  
  def initialize(texto, nivel, nvisible, nhidden,nSvisible,nShidden,death)
        @text = texto
        @levels = nivel
        @nVisibleTreasures = nvisible
        @nHiddenTreasures = nhidden
        @specificVisibleTreasures = nSvisible
        @specificHiddenTreasures = nShidden
        @death = death
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
  
