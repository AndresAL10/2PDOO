#encoding: utf-8

require_relative 'numeric_bad_consequence'

module NapakalakiGame
  
  class DeathBadConsequence < NumericBadConsequence
    
    def initialize(b)
      bc=super(b, Player.getMAXLEVEL, MAXTREASURES, MAXTREASURES)
    end
    
    def getDeath
      true
    end
        
    def to_s
      cadena = super 
      cadena += "\nDeath: #{@death}"
end
end
end
