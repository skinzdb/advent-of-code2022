eval = {
    "A": 1,
    "B": 2,
    "C": 3,
    "X": 1,
    "Y": 2,
    "Z": 3
}

result = [[ 0, -1,  1], # rows = player 1's choice (A, B, C), cols = player 2's choice (X, Y, Z)
          [ 1,  0, -1],
          [-1,  1,  0]]

def score(a, b):
    if result[b-1][a-1] == 1:
        return b + 6
    elif result[b-1][a-1] == 0:
        return b + 3
    else:
        return b

with open("data.txt", "r") as f:
    data = f.read()

total = 0

games = data.split("\n")
for game in games:
    choices = game.split(" ")
    total += score(eval[choices[0]], eval[choices[1]])

print(total)