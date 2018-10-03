# Given a string, your task is to count how many palindromic substrings in this string.

# The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

# 'aabaa'
# 'a'
# 'aa'
# 'aab'
# ...
# Time: O(N^2) => generating substring
# Time: O(N * number of substring)

# 'aabaa'
# 5 (size of string) (1 character palindrome)
# 2 (2 char palindrome)
# 1 (3 char palindrome)
# 0 (4 char palindrome)
# 1 (5 char palindrome == size of string)
# Time: O(N^2 * number_of_chars)

def count_substrings(string)
  count = 0
  memo = {}

  (1..string.size).each do |n|
    string.chars.each_cons(n) do |char_set|

      if char_set.size == 1
        count += 1
        next
      end

      if char_set.size == 2
        if char_set[0] == char_set[1]
          memo[char_set] ||= true
          count += 1
        end
        next
      end

      if char_set.size == 3
        if char_set[0] == char_set[-1]
          memo[char_set] ||= true
          count += 1 
        end
        next
      end

      if memo[char_set[1...-1]] && char_set[0] == char_set[-1]
        memo[char_set] ||= true
        count += 1
        next
      end
    end
  end

  return count
end

# Input: "abc"
# Output: 3
# Explanation: Three palindromic strings: "a", "b", "c".
# Input: "aaa"
# Output: 6
# Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".

# p count_substrings('abc') # 3
# p count_substrings('aaa') # 6
p count_substrings('caabaacdd')
# 'ddcddabacdd'

# if a previously checked substring is a palindrome
# for a greater size substring that includes that palindrome, we only need to check the characters before and after the palindrome
# ["a", "b", "a"] => true
# ["c", ["a", "b", "a"]] => ["c", "a"] => false
# ["c", ["a", "b", "a"], "c"] => ["c", "a", "c"] => true

# ["c", "a", "a", "b"] => 4
# ['a', 'a'] => match the hash table
# is_palindrome?(['c', 'b']) => O(1)

# [a, a, b, a, a] => 5
# [a, b, a] => match against the hash table
# => true? is_palindrome?(['a', 'a']) => O(1)