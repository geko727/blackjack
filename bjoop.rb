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

 	def tot
 		@total
 	end

 	def show_total
 		puts "Total amount of points: #{@total}"
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

class Game
	attr_accessor :deck, :player, :dealer

	def initialize
		@deck = Deck.new
		@player = Player.new("Carlos")
		@dealer = Dealer.new("Dealer")
	end
	def start
		deck.create
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
		compare_hands(dealer.tot, player.tot)
	end

	def dealdealer
		if dealer.tot < 17
			dealer.add(deck.card)
			dealer.totalam(dealer.h)
			dealdealer
		end
		dealer.tot
	end

	def again
		player.add(deck.card)
		player.show
		player.totalam(player.h)
		player.show_total
		dealer.show
		dealer.totalam(dealer.h)
		dealer.show_total
		if player.tot > 21
			puts "You lose, your cards exceed 21"
		#elsif player.tot == 21
		#	puts "You win!!!, your total amount of points is 21"
		else
		compare_hands(dealer.tot, player.tot)
		end
	end

	def compare_hands(total_dealer, total_player)
		def initialize
			@total_dealer = total_dealer
			@total_player = total_player
		end
 		puts "#{player.name} you may decide to stand (draw no more cards) or hit (draw more cards)? stand or hit"
 		op = gets.chomp
		puts ''
		while op != 'stand' && op != 'hit'
			puts "Please enter a valide option --stand or --hit"
			op =gets.chomp
		end
		if op == 'stand'
			dealdealer
			player.show
			player.show_total
			dealer.show
			dealer.show_total 
			total_dealer = dealer.tot
	 		if total_dealer > 21 
	 			puts "You win!!!, Dealer's cards exceed 21"
			elsif total_dealer <= 21 && total_dealer > total_player
				puts "You lose, Dealer cards are closer to 21 than yours"
			elsif total_dealer <= 21 && total_dealer < total_player
		        puts "You win!!!, your cards are closer to 21 than the Dealer's cards"
			elsif total_dealer <= 21 && total_dealer == total_player
		        puts "You and croupier have the same number of points"
		    end
		end
		if op == 'hit'
			again
		end
	end

	def play_again
end


game = Game.new
game.start
game.play_again