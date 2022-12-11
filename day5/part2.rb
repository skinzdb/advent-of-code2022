file = File.open("data.txt")

lines = file.readlines.map(&:chomp) # Use chomp to remove newline chars

stacks = [
    ['G', 'F', 'V', 'H', 'P', 'S'],
    ['G', 'J', 'F', 'B', 'V', 'D', 'Z', 'M'],
    ['G', 'M', 'L', 'J', 'N'],
    ['N', 'G', 'Z', 'V', 'D', 'W', 'P'],
    ['V', 'R', 'C', 'B'],
    ['V', 'R', 'S', 'M', 'P', 'W', 'L', 'Z'],
    ['T', 'H', 'P'],
    ['Q', 'R', 'S', 'N', 'C', 'H', 'Z', 'V'],
    ['F', 'L', 'G', 'P', 'V', 'Q', 'J']
]

lines.each do |line|
    arr = line.split
    if arr[0] == "move" # Only care about move commands
        block = stacks[arr[3].to_i-1].last(arr[1].to_i) # Get last n of stack

        block.each do |b|
            stacks[arr[3].to_i-1].pop # Remember to pop from old stack
            stacks[arr[5].to_i-1].push(b)
        end
    end
end

for i in 0..8 do
    print(stacks[i].pop)
    $stdout.flush
end
