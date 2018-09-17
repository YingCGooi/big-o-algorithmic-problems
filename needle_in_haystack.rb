# Implement strStr().

# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

# Example 1:

# Input: haystack = "hello", needle = "ll"
# Output: 2
# Example 2:

# Input: haystack = "aaaaa", needle = "bba"
# Output: -1
# Clarification:

# What should we return when needle is an empty string? This is a great question to ask during an interview.
# when needle is an empty string, return 0

# For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

def str_str(haystack, needle)
  return 0 if needle.empty?
  return -1 if haystack.length < needle.length

  pointer = 0
  window_size = needle.size

  while pointer + window_size <= haystack.length
    return pointer if haystack[pointer, window_size] == needle
    pointer += 1
  end

  -1
end

# def str_str(haystack, needle)
#   i = 0
#   j = 0

#   loop do
#     loop do
#       return i if j == needle.length
#       return -1 if i + j == haystack.length
#       break if needle[j] != haystack[i + j]
#       j += 1
#     end
#     i += 1
#   end
# end

p str_str 'hello', 'll' # 2 => match
p str_str 'aaaaa', 'bba' # -1 => no match
p str_str 'aaaaaa', '' # 0 => needle.empty? is true
p str_str 'a', 'bc' # -1 => haystack.length < needle.length
p str_str 'a', 'a'

