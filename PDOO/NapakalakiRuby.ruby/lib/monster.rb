#encoding: utf-8

require_relative "prize"
require_relative "bad_consequence"

module NapakalakiGame

  class Monster

    attr_reader :name, :combatLevel, :prize, :badConsequence

    def initialize( nombre, nivel, buenrollo, malrollo)
      @name = nombre
      @combatLevel = nivel
      @prize = buenrollo
      @badConsequence = malrollo 
    end

    def to_s
      mensaje = "\nNombre: #{@name} \nNivel de combate: #{@combatLevel}"
      mensaje += "\nPremio: #{@prize} \nMal rollo: #{@badConsequence}"
    end

  end
end
