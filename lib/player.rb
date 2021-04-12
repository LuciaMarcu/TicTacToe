class Player

  attr_accessor :name, :mark

    def initialize(name = nil, mark)
        @name = name
        @mark = mark
    end    

    def display_players        
        puts "It was created the player #{name} with the mark #{mark} and player Computer with mark 0."    
    end        
    
    
end
