input_txt = File.read('input.txt').chomp

letters = input_txt.chars

# part 1

# use a map, transform each parenthesis to it's int value, then sum

nums = letters.map do |c|
  if c == '('
    1
  else
    -1
  end
end

puts nums.sum

# part 2

position = 0
counter = 0

while position >= 0
  n = nums[counter]
  
  position = position + n
  counter = counter + 1

  puts counter, position
end
