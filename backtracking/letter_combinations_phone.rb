# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

# A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

LETTERS_MAP = {
  '2' => %w[a b c],
  '3' => %w[d e f],
  '4' => %w[g h i],
  '5' => %w[j k l],
  '6' => %w[m n o],
  '7' => %w[p q r s],
  '8' => %w[t u v],
  '9' => %w[w x y z]
}

# def letter_combinations(digits)
#   return [] if digits.empty?
#   return LETTERS_MAP[digits] if digits.size == 1

#   digits.chars.reduce(['']) do |prev_combinations, digit|
#     combinations = prev_combinations.product(LETTERS_MAP[digit])
#     combinations.map(&:join)
#   end
# end

# Backtracking
#           a           b           c         [a, b, c]  2
#        d  e  f      d e f      d  e  f      [d, e, f]  3
#    ghi ghi ghi  ghi ghi ghi  ghi ghi ghi    [g, h, i]  4

def letter_combinations(digits)
  return [] if digits.empty
  return LETTERS_MAP[digits] if digits.size == 1
  letter_combinations_helper(result = [], temp = '', digits, 0)
end

def letter_combinations_helper(result, temp, digits, index)
  # puts "result: #{result}, temp: #{temp}, index: #{index}"
  result << temp if temp.size == digits.size
  return if index >= digits.size

  digit = digits[index]

  LETTERS_MAP[digit].each do |char|
    temp += char
    letter_combinations_helper(result, temp, digits, index + 1)
    temp = temp[0...-1]
  end

  return result
end


p letter_combinations("23")
# ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
p letter_combinations("234")
# ["adg", "adh", "adi", "aeg", "aeh", "aei", "afg", "afh", "afi", "bdg", "bdh", "bdi", "beg", "beh", "bei", "bfg", "bfh", "bfi", "cdg", "cdh", "cdi", "ceg", "ceh", "cei", "cfg", "cfh", "cfi"]