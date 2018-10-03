# Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

# Note:

# The same word in the dictionary may be reused multiple times in the segmentation.
# You may assume the dictionary does not contain duplicate words.

def word_break(s, dict, memo={})
  return true if s == ''
  dict.each do |word|
    next unless word == s[0...word.size]
    return true if word_break(s[word.size..-1], dict)
  end
  false
end

p word_break('leetcode', ['leet', 'code']) # true
p word_break('applepenapple', ["apple", "pen"]) # true
p word_break('applepenapple', ["applep", "apple", "pen"]) # true
p word_break("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", 
["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])