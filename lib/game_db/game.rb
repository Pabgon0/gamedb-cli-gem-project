class GameDb::Game

    attr_accessor :console, :maker, :type, :game_amount
    @@all = []

    def initialize(console=nil, maker=nil, type=nil, game_amount=nil)
        @console = console
        @maker = maker
        @type = type
        @game_amount = game_amount
        @@all << self
    end

    def self.all
        @@all
    end

end