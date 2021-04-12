require_relative 'game.rb'
require_relative 'player.rb'

game = Game.new
game.display_board
player = gets.chomp
game.human.name = player
game.human.display_players
game.play
game.declare_winner




