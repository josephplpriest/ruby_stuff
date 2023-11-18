input_txt = File.read('input.txt').chomp

point = Struct.new(:x, :y)
santa_position = point.new
santa_position.x = 0
santa_position.y = 0

robo_position = point.new
robo_position.x = 0
robo_position.y = 0

santa_map = {santa_position.values => 1}
robo_santa_map = {robo_position.values => 1}

def move_direction(character)
  x_change = 0
  y_change = 0
  case character
    when '>'
      x_change = x_change + 1
    when '<'
      x_change = x_change - 1
    when '^'
      y_change = y_change + 1
    when 'v'
      y_change = y_change - 1
    else
      nil
  end
  return [x_change, y_change]
end

def update_map(character, position, visited_map)
  x_move, y_move = move_direction(char)
  position.x = position.x + x_move
  position.y = position.y + y_move
  if visited_map[position.values]
    visited_map[position.values] = visited_map[position.values] + 1
  else
    visited_map[position.values] = 1 
  end
  return [position, visited_map]
end  

string_array = input_txt.chars

string_array.each_with_index do |char, i|
  if i % 2 == 0
    # santa move
    santa_position, santa_map = update_map(char, santa_position, santa_map)
  else  
    # robo move
    robo_position, robo_map = update_map(char, robo_position, robo_map)
  end
end

p santa_map.length
p robo_map.length

