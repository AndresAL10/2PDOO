#encoding: utf-8

require_relative 'bad_consequence'

module NapakalakiGame
  
  class NumericBadConsequence < BadConsequence
    
    def initialize(atext, somelevels, nVisible, nHidden)
      bc = super(atext, somelevels)
      @nVisibleTreasures=nVisible
      @nHiddenTreasures=nHidden
    end
  
    def getNVisibleTreasures
      @nVisibleTreasures
    end
  
    def getNHiddenTreasures
      @nHiddenTreasures
    end
    
    def isEmpty
    if @nVisibleTreasures == 0 && @nHiddenTreasures == 0 
        empty = true
      else
        empty = false
      end
      return empty
    end
    
    def substractVisibleTreasures(t)
      if @nVisibleTreasures > 0 then
        @nVisibleTreasures -= 1
      end
    end 
    
    def substractHiddenTreasures(t)
      if @nHiddenTreasures > 0 then
        @nHiddenTreasures -= 1
      end
    end
    
    public
    
    def adjustToFitTreasureLists(v, h)
=begin      
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
     
      if (isEmpty == false)
        NumericBadConsequence.new(getText, 0, nVT, nHT)
      end
=end
      n_visible = @nVisibleTreasures
      n_hidden = @nHiddenTreasures
      if v.size < n_visible then
        n_visible = v.size
      end
      if h.size < n_hidden then
      n_hidden = h.size
      end
      bc = NumericBadConsequence.new(@text, @levels, n_visible, n_hidden)
      bc
    end
    
    
    
    def to_s
      cadena = super
      cadena
    end 
  end
end
