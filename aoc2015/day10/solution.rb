input_txt = File.read('input.txt').chomp

# create a 'stack'

# push first number onto the stack

# check if item is the same as item at end of stack

# if so, push another

# else, push stack height to new number, then item from stack, then reinitialize stack with next num
n = input_txt.chars

def one_pass(num)

    stack = []

    new_num = []

    for i in num 
        if stack.length == 0
            stack << i
        elsif i == stack[-1]
            stack << i
        else
            new_num << stack.length.to_s
            new_num << stack.pop()
            stack = []
            stack << i
        end
    end
    if stack.length > 0
        new_num << stack.length.to_s
        new_num << stack.pop()
    end    

    return new_num
end

for i in 1..50
    n = one_pass(n)
end

p n.length