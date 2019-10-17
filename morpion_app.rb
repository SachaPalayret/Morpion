# morpion_app.rb
# require 'bundler'
# Bundler.require
# require 'pry'

$:.unshift File.expand_path("./../lib", __FILE__)

require 'Board'
# require 'app/Boardcase'
require 'player'
require 'game.rb'
game = Game.new
game.start_game