#encoding: utf-8

require_relative 'bad_consequence'

module NapakalakiGame
  
class SpecificBadConsequence < BadConsequence
  
   def initialize(t, l, v, h)
      bc = super(t, l)
      @specificVisibleTreasures = v
      @specificHiddenTreasures = h
   end
   
    def getSpecificHiddenTreasures
      return @specificHiddenTreasures
    end
    
    def getSpecificVisibleTreasures
      return @specificVisibleTreasures
    end
    
    def isEmpty
      if @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
        empty = true
      else
        empty = false
      end
      return empty
    end
    
    def substractVisibleTreasures(t)
      if (!isEmpty)
        if (!@specificVisibleTreasures.empty?)
          if @specificVisibleTreasures.include?(t.getType)
            @specificVisibleTreasures.delete_at(@specificVisibleTreasures.index(t.getType))
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
        end
      end
    end
       
   def adjustToFitTreasureLists(v, h)
=begin
     vTypes = Array.new
      hTypes = Array.new

     if((getNHiddenTreasures)  < ( v.size + 1))
        nVT = getNHiddenTreasures
      else
        nVT = v.size
      end

      if (getNHiddenTreasures < h.size + 1)
        nHT = getNHiddenTreasures 
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
      
      bc = SpecificBadConsequence.new(@text, 0, specVT, specHT)
      return bc
=end   
     visible = Array.new
      copy_Visible = Array.new(@specificVisibleTreasures)
      v.each do |t|
        tipo = t.getType
        fin = false
        i = 0
        while i <  copy_Visible.size && !fin
        if copy_Visible.at(i) == tipo then
          visible << copy_Visible.at(i)
          copy_Visible.delete_at(i)
          fin = true
        end
        i += 1
        end
      end
      hidden = Array.new
      copy_Hidden = Array.new(@specificHiddenTreasures)
      h.each do |t|
        tipo = t.getType
        fin = false
        i = 0
        while i <  copy_Hidden.size && !fin
        if copy_Hidden.at(i) == tipo then
          hidden << copy_Hidden.at(i)
          copy_Hidden.delete_at(i)
          fin = true
        end
        i += 1
        end
      end
      bc = SpecificBadConsequence.new(@text, @levels, visible, hidden)
      bc
      end
    
    
   def to_s
      cadena = super
      cadena
   end
    
end   
   
end

