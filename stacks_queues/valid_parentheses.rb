require_relative 'stack'
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Note that an empty string is also considered valid.

PAIRS = {
  ')' => '(',
  ']' => '[',
  '}' => '{'
}

def is_valid(str)
  stack = Stack.new

  str.chars.each_with_index do |char, index|
    if stack.peek == PAIRS[char] && !stack.empty?
      stack.pop
    else
      stack.push(char)
    end
  end

  stack.size == 0
end

p is_valid "()" # true
p is_valid "()[]{}" # true
p is_valid "(]" # false
p is_valid "([)]" # false
p is_valid "{[]}" # true

# (
# ( next = ) => pop from stack
# check if stack is empty