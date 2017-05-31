#encoding: utf-8

require_relative 'treasure_kind'

module NapakalakiGame

  class Treasure
    
    private
    
    def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end
    
    public

    def getName
      @name
    end

    def getBonus
      @bonus
    end

    def getType
      @type
    end

    def to_s
      "\n\t\tTesoro: #{getName} \n\t\tTipo: #{@type} \n\t\tBonus: #{@bonus}\n"
    end

  end
end