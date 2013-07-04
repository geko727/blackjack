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
 			else
 				@total =  @total + player[b][1]
 			end
 			b = b + 1

 	end
 	return @total
 end

def mostrar player, casa
	 total player
	 puts "Jugador: #{player} Total = #{@total}"
	 puts '-------------------------------------------------'
	 puts "Casa: #{casa[0]}, *"
end
 
# Primeras dos cartas
repartir deck, player
repartir deck, casa
repartir deck, player
repartir deck, casa

# Mostrar mano
puts 'Inicia el juego'
puts '---------------'
mostrar player, casa
puts "Tu total es de: #{@total}, sacas otra carta o te quedas?"
op = gets.chomp
