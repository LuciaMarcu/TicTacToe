class Game

    WINNER_COMB = [[2, 5, 8], [1, 4, 7], [3, 6, 9], [3, 5, 7], [1, 5, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9]] 
    CELLS_INDEX = [1, 5, 9, 13, 17, 21, 25, 29, 33]     

    attr_accessor :human, :computer, :cells, :CELLS_INDEX, :difference_hum, :difference_comp, :human_picks, :comp_picks, :WINNER_COMB

    def initialize    
        @human = Player.new('X')
        @computer = Player.new('Computer', 'O')              
    end   
    
    def display_board
      puts "The cells are numbered from 1 to 9 as seen below:\n_1_|_2_|_3_\n_4_|_5_|_6_\n_7_|_8_|_9_\nThe computer will choose first. Please tipe your name."
    end  
    
    def play        
        join_hash = make_hash      
        @blank_board =  "_ _|_ _|_ _\n_ _|_ _|_ _\n_ _|_ _|_ _"  
        @human_picks = []
        @comp_picks = []
        until @cells.empty? do
            computer_choice
            reduce_options(@comp_choice)            
            break if @cells.empty?       
            player_choice 
            reduce_options(@human_choice)
            draw_board(@blank_board, join_hash)
        end            
        
        puts "#{@human.name} choices are #{@human_picks}." 
        puts "Computer choices are #{@comp_picks}."
        draw_board(@blank_board, join_hash)        

    end
    
    def player_choice 
        puts "#{@human.name} is your turn to choose a cell."
        @human_choice= gets.chomp.to_i  
        if @comp_picks.include?(@human_choice) 
          puts "Computer choosed this cell before you. Type another cell." 
          @human_choice= gets.chomp.to_i
        else  
          puts "Your choice is #{@human_choice}."            
          @human_picks.push(@human_choice)            
          @human_choice  
        end       
          
    end     

    def computer_choice   
        @comp_choice = @cells.sample
        puts "Computer choice is #{@comp_choice}."
        @comp_picks.push(@comp_choice)        
        @comp_choice        
    end

       
    def draw_board(board, hash)        
        x = hash[@human_choice] 
        o = hash[@comp_choice]    
        board[x] = @human.mark
        board[o] = @computer.mark
        puts board      
        board    
    end

    def reduce_options(choice)
        index = @cells.find_index(choice) 
        @cells.delete_at(index)
        @cells
    end

    def make_hash
      @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]        
      hash = Hash[@cells.zip CELLS_INDEX]       
    end     

    
    def verify_picks
              
        @difference_hum = []
        @difference_comp = []
        
        WINNER_COMB.each{|comb|  
            @difference_hum.push(@human_picks - comb)              
            @difference_comp.push(@comp_picks - comb)          
        }               

    end
      
    def declare_winner
        verify_picks

        if @difference_hum.any?{|comb|comb.length == 1} && @difference_comp.any?{|comb|comb.length == 2}

            puts "Both players are winners."

        elsif @difference_hum.any?{|comb|comb.length == 1}
            
            puts "#{@human.name} is the winner"

        elsif @difference_comp.any?{|comb|comb.length == 2}

            puts "Computer is the winner."
        
        else puts "Nobody is wins."
            
        end
       

      
    end
     
    
end