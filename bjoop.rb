class Deck
@@suits= []
@@values= []
@deck
end

class Player
@hand
def amount_points; end
@totalpoints
def hit; end
def stay; end
def show_hand; end
end

class Dealer < Player; end

class Card
	@suits
	@values
end


class Game
	def start; end
	def deal; end
	def compare_hands; end
end
