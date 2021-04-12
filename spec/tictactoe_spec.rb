require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
    subject(:game_one) { described_class.new }

    describe '#reduce_options' do
        
        it 'returns the reduced array' do
            game_one.cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]  
            choice = 4            
            result = game_one.reduce_options(choice)
            expect(result).to eq([1, 2, 3, 5, 6, 7, 8, 9])
        end

    end

    describe '#make_hash' do
        it 'returns a hash from two arrays'do
            game_one.cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            game_one.CELLS_INDEX = [1, 5, 9, 13, 17, 21, 25, 29, 33]
            result = game_one.make_hash
            expect(result).to eq({1=>1, 2=>5, 3=>9, 4=>13, 5=>17, 6=>21, 7=>25, 8=>29, 9=>33})
        end
    end

    describe '#verify_picks' do
        it 'returns the intersection of two arrays' do
            game_one.WINNER_COMB = [[2, 5, 8], [1, 4, 7], [3, 6, 9], [3, 5, 7], [1, 5, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9]] 
            game_one.human_picks = [2, 8, 5, 6]
            game_one.comp_picks = [1, 3, 4, 9, 7]                     
            call = game_one.verify_picks
            result = game_one.difference_hum          
            expect(result).to eq([[6], [2, 8, 5, 6], [2, 8, 5], [2, 8, 6], [2, 8, 6], [8, 5, 6], [2, 8], [2, 5, 6]])
        end
    end

end