J = 10
Q = 10
K = 10
h = "hearts"
c = "clubs"
s = "spades"
d = "diamonds"

deck = [[h,1,0], [h,2,0], [h,3,0], [h,4,0], [h,5,0], [h,6,0], [h,7,0], [h,8,0], [h,9,0], [h,10,0], [h,J,0], [h,Q,0], [h,K,0],  
[c,1,0], [c,2,0], [c,3,0], [c,4,0], [c,5,0], [c,6,0], [c,7,0], [c,8,0], [c,9,0], [c,10,0], [c,J,0], [c,Q,0], [c,K,0],
[s,1,0], [s,2,0], [s,3,0], [s,4,0], [s,5,0], [s,6,0], [s,7,0], [s,8,0], [s,9,0], [s,10,0], [s,J,0], [s,Q,0], [s,K,0],
[d,1,0], [d,2,0], [d,3,0], [d,4,0], [d,5,0], [d,6,0], [d,7,0], [d,8,0], [d,9,0], [d,10,0], [d,J,0], [d,Q,0], [d,K,0]]



card = deck[rand(deck.length)]
print card
