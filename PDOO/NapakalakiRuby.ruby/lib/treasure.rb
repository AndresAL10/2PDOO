#encoding: utf-8

require_relative "treasure_kind"

module Napakalaki Game

  class Treasure

    def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end

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
      "\nTesoro: #{@name} \n\tTipo: #{@type} \n\tBonus: #{@bonus}\n"
    end

  end
end