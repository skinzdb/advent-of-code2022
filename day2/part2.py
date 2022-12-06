eval = {
    "A": 1,
    "B": 2,
    "C": 3,
    "X": 0, # lose
    "Y": 1, # draw
    "Z": 2  # win
}

result = [[3, 1, 2],   # rows = need to lose/draw/win, cols = value of choice
          [1, 2, 3],
          [2, 3, 1]]

def score(a, b):
    if b == 0:
        return result[a-1][b]
    elif b == 1:
        return result[a-1][b] + 3
    else:
        return result[a-1][b] + 6

with open("data.txt", "r") as f:
    data = f.read()

total = 0

games = data.split("\n")
for game in games:
    choices = game.split(" ")
    total += score(eval[choices[0]], eval[choices[1]])

print(total)