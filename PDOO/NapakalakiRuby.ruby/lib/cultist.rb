#encoding: utf-8

module NapakalakiGame
  
  class Cultist
  
    def initialize(name, gainedLevels)
      @name = name
      @gainedLevels = gainedLevels
    end
    
    def getGainedLevels
      return @gainedLevels
    end
    
  end
end
