#encoding: utf-8

module NapakalakiGame
  
  class BadConsequence

    private_class_method :new
     
    MAXTREASURES = 10
    
    private 
    
    def initialize(atext, someLevels, someVisibleTreasures,someHiddenTreasures,someSpecificVisibleTreasures,someSpecificHiddenTreasures,death)
          @text = atext
          @levels = someLevels
          @nVisibleTreasures = someVisibleTreasures
          @nHiddenTreasures = someHiddenTreasures
          @specificVisibleTreasures = someSpecificVisibleTreasures
          @specificHiddenTreasures = someSpecificHiddenTreasures
          @death = death
    end
    
    public
    
    def self.newLevelNumberOfTreasures(aText, someLevels,someVisibleTreasures, someHiddenTreasures)
      new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,[],[],false)
    end

    def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText,someLevels, 0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
    end

    def self.newDeath (aText)
      new(aText,0,0,0,[],[],true)    
    end
    
    def isEmpty
      if @nVisibleTreasures == 0 && @nHiddenTreasures == 0 && @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
        empty = true
      else
        empty = false
      end
      return empty
    end
    
    def getLevels
      return @levels      
    end
    
    def getNVisibleTreasures
      return @nVisibleTreasures
    end
    
    def getNHiddenTreasures
      return @nHiddenTreasures
    end
    
    def getSpecificHiddenTreasures
      return @specificHiddenTreasures
    end
    
    def getSpecificVisibleTreasures
      return @specificVisibleTreasures
    end
    
    def substractVisibleTreasures(t)
      #No se sabe todavia
    end
    
    def substractHiddenTreasures(t)
      #No se sabe todavia
    end
    
    def adjustToFitTreasureLists(v, h)
      
    end
    
    def to_s
        mensaje = "\n\tTexto: #{@text}\n\tNiveles perdidos: #{@levels}"   
        mensaje += "\n\tTesoros visibles perdidos: #{@nVisibleTreasures}"
        mensaje += "\n\tTesoros ocultos perdidos: #{@nHiddenTreasures}"
        mensaje += "\n\tTesoros especificos visibles perdidos: #{@specificVisibleTreasures}"
        mensaje += "\n\tTesoros especificos ocultos perdidos: #{@specificHiddenTreasures}"

        if @death
          mensaje += "\n\tMuerte: Si"
        else
          mensaje += "\n\tMuerte: No"
        end
        
        mensaje
    end

  end  
end
