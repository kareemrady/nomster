class Card
	attr_accessor :suit, :rank
	def initialize(rank, suit)
		@suit = suit
		@rank = rank
	end
	def output_card
		puts "#{@rank} of #{@suit}"
	end
end

class Deck

	def initialize
		suit_cards = [:Diamonds, :Spades, :Clubs, :Hearts]
		face_cards = [:King, :Jack, :Queen]
		rank_cards = [:Ace, 2,3,4,5,6,7,8,9, 10]
		@deck = []

		# @deck = ['A', 2,3,4,5,6,7,8,9, 10].product([:Diamonds, :Spades, :Clubs, :Hearts]) + [:King, :Jack, :Queen].product([:Diamonds, :Spades, :Clubs, :Hearts])
		suit_cards.each do |suit_card| 
			face_cards.each do |face_card| 
				@deck << Card.new(face_card,suit_card)
			end
			rank_cards.each do |rank_card| 
				@deck << Card.new(rank_card, suit_card)
			end

		end
		@deck
	end

	def shuffle
		@deck.shuffle!
	end

	def size
		@deck.size
	end

	def deal
		@deck.shift
	end

end
# create dealer class that accepts a deck of cards , handle dealing cards, shuffle
# create a player class, that accepsts the card and stores them in a player hand 
class Dealer 
	def initialize
		puts "Creating a new Deck of Cards"
		@deck_cards = Deck.new
	end
	def shuffle_cards
		puts "Shuffling Deck...."
		self.deck.shuffle
	end
	def deal_card
		puts "Dealing One Card......"
		self.deck.deal
	end

end

class Player
	def initialize
		@player_hand = []
	end
	def accept_card
		@dealer_hand << self.deal_card
	end
end


dealer = Dealer.new
player = Player.new

dealer.shuffle_cards
#dealer.deal_card

#player.accept_card
