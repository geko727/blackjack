J = 10
Q = 10
K = 10


deck = {:hearts => [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[J,0],[Q,0],[K,0]],
:clubs => [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[J,0],[Q,0],[K,0]],
:spades => [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[J,0],[Q,0],[K,0]],
:diamonds => [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[J,0],[Q,0],[K,0]] }

deck[:hearts][0][1] = 2
valor = rand(10)
keys = deck.keys
key = rand(keys.length)
puts valor
puts key

