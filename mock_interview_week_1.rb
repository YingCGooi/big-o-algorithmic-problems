# Given an input string, reverse the string word by word.

# A word is defined as a sequence of non-space characters.
# Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
# You need to reduce multiple spaces between two words to a single space in the reversed string.
# Follow up: For C programmers, try to solve it in-place in O(1) space.

# Example:
def reverse_words(str)
  return "" if str.empty?
  str_arr = str.split(/\s+/)

  # words = str_arr.select do |str|
  #   !str.empty?
  # end

  str_arr.reverse!.join(' ')
end

p reverse_words "^%&* *() " # => "*() ^%&*"
p reverse_words "^%&* *()     " # => "*() ^%&*"
p reverse_words "^%&*      *()     " # => "*() ^%&*"
p reverse_words "    ^%&*      *()     " # => "*() ^%&*"
p reverse_words "the sky is blue" # => "blue is sky the"
p reverse_words "" # => ""
p reverse_words "the" # => "the"

# Approach:
# Split the string into an array of words
# => regex
# array, reverse the array of words
# join
# O(N)
# space: O(N)

# "    ^%&*      *()     "
#  ^   ^

# "^%&*^%&*      *()     "
#  ^       ^

# "^%&*^%&*      *()     "
#     ^    ^

# "^%&* %&*      *()     "
#      ^         ^   

# "^%&* *()      *()     "
#          ^            ^ 

# "^%&* *()"
#          ^            ^

# "^%&* *()"
#  ^      ^

"the sky is blue"
 # ^

  [1, 2, 3, 4, 5, 7, 9, 0, 0, 0]
         ^  ^           ^
  [3, 5, 6]
   ^

  [1, 2, 3, 4, 5, 7, 9, 3, 5, 6]
      ^                 ^   

                                                                                  