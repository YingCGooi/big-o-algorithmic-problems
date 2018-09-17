# Write a function that takes in a string as an argument and determine if it is a palindrome.

def is_palindrome?(str)
  return true if str.length <= 1
  return false if str[0] != str[-1]

  return is_palindrome?(str[1...-1])
end

def is_palindrome?(str, first=0, last=str.length - 1)
  return true if str[first] == str[last]
  return false if str[first] != str[last]

  return is_palindrome?(str, first + 1, last - 1)
end

p is_palindrome?('hello') # false
p is_palindrome?('rotor') # true
p is_palindrome?('a') # true