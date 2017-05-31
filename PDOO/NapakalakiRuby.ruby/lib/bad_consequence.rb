#encoding: utf-8

require_relative 'treasure_kind'
require_relative 'player'

module NapakalakiGame
  
  class BadConsequence
     
    MAXTREASURES = 10
=begin
    def initialize(atext, someLevels, someVisibleTreasures,someHiddenTreasures,someSpecificVisibleTreasures,someSpecificHiddenTreasures,death)
          @text = atext
          @levels = someLevels
          @nVisibleTreasures = someVisibleTreasures
          @nHiddenTreasures = someHiddenTreasures
          @specificVisibleTreasures = someSpecificVisibleTreasures
          @specificHiddenTreasures = someSpecificHiddenTreasures
          @death = death
    end
=end
    def initialize(atext, somelevels)
          @text = atext
          @levels = somelevels
    end
    
    public
=begin
    def self.newLevelNumberOfTreasures(aText, someLevels,someVisibleTreasures, someHiddenTreasures)
      new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,[],[],false)
    end

    def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText,someLevels, 0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
    end

    def self.newDeath (aText)
      new(aText,Player.getMAXLEVEL,MAXTREASURES,MAXTREASURES,[],[],true)    
    end

    def isEmpty
      if @nVisibleTreasures == 0 && @nHiddenTreasures == 0 && @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
        empty = true
      else
        empty = false
      end
      return empty
    end
=end
    def getLevels
      return @levels      
    end
    def getText
      return @text
    end
    
=begin    
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
=end
=begin
    def substractVisibleTreasures(t)
      if (!isEmpty)
        if (!@specificVisibleTreasures.empty?)
          if @specificVisibleTreasures.include?(t.getType)
            @specificVisibleTreasures.delete_at(@specificVisibleTreasures.index(t.getType))
          end
        else
          @nVisibleTreasures = (@nVisibleTreasures - 1)
          if (@nVisibleTreasures < 0)
            @nVisibleTreasures = 0
          end
        end
      end
    end
    
    def substractHiddenTreasures(t)
      if (!isEmpty)
        if (!@specificHiddenTreasures.empty?)
          if @specificHiddenTreasures.include?(t.getType)
            @specificHiddenTreasures.delete_at(@specificHiddenTreasures.index(t.getType))
          end
        else
          @nHiddenTreasures = (@nHiddenTreasures - 1)
          if (@nHiddenTreasures < 0)
            @nHiddenTreasures = 0
          end
        end
      end
    end

    def adjustToFitTreasureLists(v, h)
      vTypes = Array.new
      hTypes = Array.new
      if((@nVisibleTreasures)  < ( v.size + 1))
        nVT = @nVisibleTreasures
      else
        nVT = v.size
      end

      if (@nHiddenTreasures < h.size + 1)
        nHT = @nHiddenTreasures 
      else 
        nHT = h.size
      end
      
      for vis in v
        vTypes << vis.getType
      end
      for hid in h
        hTypes << hid.getType
      end
     
      specVT = Array.new
      cpySpecVT = @specificVisibleTreasures.dup
      specHT = Array.new 
      cpySpecHT = @specificHiddenTreasures.dup
        
      
      for visT in vTypes
         if cpySpecVT.include?(visT)
           specVT << visT
           cpySpecVT.delete(visT)
         end
      end 
      
      for hidT in hTypes
        if cpySpecHT.include?(hidT)
          specHT << hidT
          cpySpecHT.delete(hidT)
        end
      end
     
      if specVT.empty? && specHT.empty?
        BadConsequence.newLevelNumberOfTreasures(@text, 0, nVT, nHT)
      else
        BadConsequence.newLevelSpecificTreasures(@text, 0, specVT, specHT)
      end
    end
=end    
  
    def to_s
    cadena = "#{@text}"
    if @levels != 0 then
        cadena += "\nLevels_Down = #{@levels}"
      end
    cadena
  end

  end  
end
