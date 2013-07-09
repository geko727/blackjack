h = "hearts"
c = "clubs"
s = "spades"
d = "diamonds"
J = 10
Q = 10
K = 10

deck = [[h, 'A'], [h,2], [h,3], [h,4], [h,5], [h,6], [h,7], [h,8], [h,9], [h,10], [h, J], [h,Q], [h,K],  
[c, 'A'], [c,2], [c,3], [c,4], [c,5], [c,6], [c,7], [c,8], [c,9], [c,10], [c, J], [c,Q], [c,K],
[s, 'A'], [s,2], [s,3], [s,4], [s,5], [s,6], [s,7], [s,8], [s,9], [s,10], [s, J], [s,Q], [s,K],
[d, 'A'], [d,2], [d,3], [d,4], [d,5], [d,6], [d,7], [d,8], [d,9], [d,10], [d, J], [d,Q], [d,K]]

player =[]
casa = []

def repartir deck, player
	a = rand(deck.length)
 	card = deck[a]
 	deck.delete_at(a)
 	player << card
 	return player
end

def total player
 	b = 0
 	@total = 0
 	while b <= player.length-1
 			if player[b][1] == 'A'
 				@total =  @total + 11
 				if @total > 21
 					@total =  @total - 10
 				end
 			else
 				@total =  @total + player[b][1]
 			end
 			b = b + 1

 	end
 	return @total
end

def mostrar player, casa
	 total player
	 puts "#{$name}: #{player} Total = #{@total}"
	 puts '-------------------------------------------------'
	 puts "Croupier: #{casa[0]}, *"
end
 
def tcasa casa, deck
	total casa 
    if @total < 17
    	repartir deck, casa
    	tcasa casa, deck
    end
    @total
end

def juego casa, deck, player, op, totplay
	if op == 'stand'
		tcasa casa, deck
		puts "Croupier: #{casa}, Total amount of points: #{@total}"
		totcas = @total
		if totcas > 21 
			puts "You win!!!, Croupier's cards exceed 21"
		elsif totcas <= 21 && totcas > totplay
			puts "Croupier wins"
		elsif totcas <= 21 && totcas < totplay
	        puts "You win!!!, your cards are closer to 21 than the croupier's cards"
		elsif totcas <= 21 && totcas == totplay
	        puts "You and croupier have the same number of points"
	    end
	elsif op == 'hit'
		repartir deck, player
		mostrar player, casa
		if @total > 21
			puts "Total amount of points: #{@total}, You lose, your cards exceed 21"
		elsif @total == 21
			puts "You win!!!, your total amount of points is 21"
		else
			puts "Total amount of points: #{@total}, you may decide to stand (draw no more cards) or hit (draw more cards)? stand or hit"
			op = gets.chomp
			totplay = @total
			juego casa, deck, player, op, totplay
	    end
	end	
end
def inicio deck, player, casa
# Mostrar mano
puts 'Start game'
puts '---------------'
puts 'Welcome to Blackjack game, whats your name?'
$name = gets.chomp
puts ''
puts "Hi #{$name}, how many decks would you like to play?"
d = gets.chomp
while d == ""
	puts "Please enter a valide number"
	d =gets.chomp
end
deck = deck*d.to_i
# Primeras dos cartas
repartir deck, player
repartir deck, casa
repartir deck, player
repartir deck, casa
puts''
puts "This is your hand #{$name}"
puts ''
mostrar player, casa
puts '-------------------------------------------------'
if @total == 21
			puts "You win!!!, your total amount of points is 21"
else
puts "Total amount of points: #{@total}, you may decide to stand (draw no more cards) or hit (draw more cards)? stand or hit"
totplay = @total
op = gets.chomp
puts ''
while op != 'stand' && op != 'hit'
	puts "Please enter a valide option --stand or --hit"
	op =gets.chomp
end
juego casa, deck, player, op, totplay
end
puts ''
puts '-------------------------------------------------'
puts "#{$name} would you like to play again? yes/no"
option = gets.chomp
while option != 'yes' && option != 'no'
	puts "Please enter a valide option --yes or --no"
	option =gets.chomp
end
if option == 'yes'
	inicio deck, player, casa
elsif option == 'no'
	exit
end
end

inicio deck, player, casa