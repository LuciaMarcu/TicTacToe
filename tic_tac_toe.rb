
    class Player

        attr_accessor :name, :mark
    
        def initialize(name, mark)
            @name = name
            @mark = mark
        end    
    
        def display_player        
            puts "It was created the player #{name} with the mark #{mark}"    
        end        
        
        
    end
    
    
    class Game
    
        attr_accessor :name, :player_one, :player_two, :pl_one_choice, :pl_two_choice, :str, :str_index, :join_hash, :arr
    
        def initialize (name, player_one, player_two)
            @name = name
            @player_one = player_one
            @player_two = player_two
            @player_ch_array = Array.new
            @computer_ch_array = Array.new
            @str =  "_ _|_ _|_ _\n_ _|_ _|_ _\n_ _|_ _|_ _" 
            @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]         
            @str_index = [1, 5, 9, 13, 17, 21, 25, 29, 33]
            @join_hash = Hash[@arr.zip @str_index]
        
        end
        
        @pl_one_choice
        @pl_two_choice
        @player_ch_array
        @computer_ch_array
        @str    
        @arr
        @str_index
        @join_hash
        
    
        def player_choice(player)
            puts "#{@player_one.name} is your turn to choose a cell."
            @pl_one_choice= gets.chomp.to_i
            puts "Your choice is #{@pl_one_choice}"
            index = @arr.find_index(@pl_one_choice)        
            @arr.delete_at(index)
            @player_ch_array.push(@pl_one_choice)     
            return @pl_one_choice
            
        end  
    
        def computer_choice  
            puts "Computer will choose a cell."  
            if @arr.length >= 1
              index = rand(@arr.length-1)
              @pl_two_choice = @arr[index]        
              @arr.delete_at(index)
              puts "Computer has choosen the cell number #{@pl_two_choice}"
              @computer_ch_array.push(@pl_two_choice)
              
            end 
    
            return @pl_two_choice
            
        end
        
        
        def draw_board(string, hash)        
            x = hash[@pl_one_choice] 
            o = hash[@pl_two_choice]    
            string[x] = @player_one.mark
            string[o] = @player_two.mark
            puts string
          
            return string
        
        end
    
        
    
        def play       
            
            4.times do
                computer_choice            
                player_choice(@player_one)            
                draw_board(@str, @join_hash)
            end
                computer_choice  
                draw_board(@str, @join_hash)
            
            puts "#{@player_one.name} choices are #{@player_ch_array}." 
            puts "Computer choices are #{@computer_ch_array}."        
    
        end
    
        
        def winner

            winner_comb = [[2, 5, 8], [1, 4, 7], [3, 6, 9], [3, 5, 7], [1, 5, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9]]        
            p_array = Array.new
            c_array = Array.new
    
            winner_comb.each{|comb|  
                p_array.push(@player_ch_array - comb)  
                c_array.push(@computer_ch_array - comb)          
            }
    
            if p_array.any?{|comb|comb.length == 1} == true && c_array.any?{|comb|comb.length == 2} == true
    
                puts "Both players are winners."
    
            elsif p_array.any?{|comb|comb.length == 1} == true
                
                puts "#{@player_one.name} is the winner"
    
            elsif c_array.any?{|comb|comb.length == 2} == true
    
                puts "Computer is the winner."
            
            else puts "Nobody wins."
                
            end
           
    
          
        end
         
        
    end
    
    
    puts "Tipe your name"
    human = gets.chomp
    human = Player.new(human, 'x')
    human.display_player  
    computer = Player.new('Computer', 'O')
    computer.display_player
    puts "The cells are numbered from 1 to 9 as seen below:\n_1_|_2_|_3_\n_4_|_5_|_6_\n_7_|_8_|_9_"
    game_one = Game.new("Game 1", human, computer)
    game_one.play
    game_one.winner
    
    
    
    
    