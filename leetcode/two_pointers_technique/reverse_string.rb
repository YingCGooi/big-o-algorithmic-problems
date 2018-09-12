# Write a function that takes a string as input and returns the string reversed.

# 2 => 1
# 3 => 1
# 4 => 2
# 5 elements => 2 iterations
# 6 elements => 3 iterations
# 7 elements => 3 iterations
# 8 elements => 4 iterations
# number of iterations = elements/2

def reverse(str)
  (0...str.length / 2).each do |i|
    str[i], str[-i - 1] = str[-i -1], str[i]
  end
  str
end

p reverse ";-+_ =" # = _+-;
p reverse "well" # llew
p reverse "hello" # "olleh"
p reverse "A man, a plan, a canal: Panama" # "amanaP :lanac a ,nalp a ,nam A"
p reverse "" # ""
p reverse "x" # "x"
p reverse "1234567890" # "0987654321"