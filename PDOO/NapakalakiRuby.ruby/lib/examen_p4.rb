# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'NapakalakiGame'
module Test4
  class ExamenP4
    def initialize
      @player = NapakalakiGame::Player.new("Miguel")
      @treasures = Array.new
    end
    
    def tesoritos
      t = NapakalakiGame::Treasure.new("pollas",3, NapakalakiGame::TreasureKind::BOTHHANDS)
    end
    
    def poner
      @player.metodo(t)
      @player.makeTreasureVisible(t)
      
      puts @player
    end
  end
end
