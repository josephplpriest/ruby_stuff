input_txt = File.read('input.txt').chomp

# parse input splitting lines
input_lines = input_txt.lines.map(&:chomp)

# method to parse coordinates
def get_x_y_coords(s)
    return s.split(',').map do |i| i.to_i - 1
    end
end

def update_lights(m, rows, cols, command)    
    rows.each do |x|
        cols.each do |y|
            if command == 'on'
                m[x][y] = true
            elsif command == 'off'
                m[x][y] = false
            elsif command == 'toggle'
                m[x][y] = !m[x][y]
            else
                puts 'Error! Invalid command.'
            end
        end
    end
    return m
end

def pt_2_update_lights(m, rows, cols, command)    
    rows.each do |x|
        cols.each do |y|
            if command == 'on'
                m[x][y] = m[x][y] + 1
            elsif command == 'off'
                m[x][y] = [m[x][y]-1, 0].max
            elsif command == 'toggle'
                m[x][y] = m[x][y] + 2
            else
                puts 'Error! Invalid command.'
            end
        end
    end
    return m
end

# generate a matrix for the lights
matrix = []

for i in 1..1000
    row = 1000.times.map{ 0 }
    matrix.push(row)
end

for line in input_lines.map { |l| l.split }

    start_x, start_y = get_x_y_coords(line[-3])
    end_x, end_y = get_x_y_coords(line[-1])

    rows_range = start_x..end_x
    cols_range = start_y..end_y

# check for toggle, on, or off
    if line.length == 4
        c = 'toggle'
        matrix = pt_2_update_lights(matrix, rows_range, cols_range, c)
    else 
        c = line[1]
        matrix = pt_2_update_lights(matrix, rows_range, cols_range, c)
    end
end

puts matrix.flatten.sum