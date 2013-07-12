module Deal
	attr_accessor :total
	def add(new_card)
		h << new_card
	end

	def totalam(player)
		b = 0
		c = 0
		@total = 0
		while b <= player.length-1
				if player[b][1] == 'A'
					c += 1
					@total =  @total + 11
				elsif player[b][1].to_i == 0 # J, Q, K
     				 @total += 10
				else
					@total =  @total + player[b][1]
				end
				b = b + 1
 		end
 		#Validate 'A'
 			if @total > 21
	 			d = 0
	 		  	while d < c
	 		  		@total -= 10
	 		  		d += 1
	 		  	end
	   		end	
 		@total
 	end

 	def show_total
 		puts "Total amount of points: #{@total}"
 	end

 	def stand_hit
 		puts "#{name}, you may decide to stand (draw no more cards) or hit (draw more cards)? stand or hit"
 		op = gets.chomp
		puts ''
		while op != 'stand' && op != 'hit'
			puts "Please enter a valide option --stand or --hit"
			op =gets.chomp
		end
		if op == 'stand'
			#compare_hands(totalam(player.h), totalam(dealer.h))
			compare_hands(player.totalam(player.h), dealer.totalam(dealer.h))
		end
 	end

 	def compare_hands(total_player, total_dealer)
 		attr_accessor :total_player, :total_dealer
 		def initialize
 			@total_player = total_player
 			@total_dealer = total_dealer
 		end
 		puts "compare"
 		if total_dealer > 21 
 			puts "You win!!!, Croupier's cards exceed 21"
		elsif total_dealer <= 21 && total_dealer > total_player
			puts "Croupier wins"
		elsif total_dealer <= 21 && total_dealer < total_player
	        puts "You win!!!, your cards are closer to 21 than the croupier's cards"
		elsif total_dealer <= 21 && total_dealer == total_player
	        puts "You and croupier have the same number of points"
	    end
 	
 	end
end


class Deck
	SUITS = ['Hearts','Clubs','Diamonds','Spades']
 	VALUES = ['A',1,2,3,4,5,6,7,8,9,10,'J','Q','K']
	attr_accessor :d
	
	def initialize; end
	def create
		@d = []
		@d = SUITS.product(VALUES)
		shuff
	end
	def shuff
		d.shuffle!
	end
	def card
		d.pop
	end
end

class Player
 include Deal
	attr_accessor :name, :h
	def initialize(name)
		@name = name
		@h = []
	end

	def to_s
		puts "Hi #{@name}" 
	end

	def show
		puts "These are your cards: #{h}"
	end	


	def amount_points; end
	@totalpoints
	def hit; end
	def stay; end
	def show_hand; end
end

class Dealer < Player
	def show
		puts "Dealer's cards: #{h}"
	end	
end

class Card
end


class Game
	def start; end

	def deal; end
end


deck = Deck.new
deck.create
player = Player.new("Carlos")
dealer = Dealer.new("Dealer")
player.add(deck.card)
player.add(deck.card)
player.to_s
player.show
player.totalam(player.h)
player.show_total
dealer.add(deck.card)
dealer.add(deck.card)
dealer.show
dealer.totalam(dealer.h)
dealer.show_total
player.stand_hit
