require_relative 'hand'

class Player
	attr_accessor :name, :bank, :hand

	def initialize (name)
		@name = name
		@bank = 100
		@hand = Hand.new
	end
end