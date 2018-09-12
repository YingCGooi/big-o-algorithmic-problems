# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used: 

# I can be placed before V (5) and X (10) to make 4 and 9. 
# X can be placed before L (50) and C (100) to make 40 and 90. 
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

# "XC" => 90
# "XL" => 40
# "XLII" => 42
# "XLV" => XL + V => 40 + 5 => 45
# "CMCD" => CM + CD => 900 + 400 => 1300

# Algorithm
# Scan the string via Regex /IV|IX|XL|XC|CD|CM/
# "MCMXCIV".scan(/IV|IX|XL|XC|CD|CM|./)
# The array will then look like:
["M", "CM", "XC", "IV"]
# Transform the array into corresponding values using the hash tables below
# compute the sum

# Data structures: Hashes
ROMANS = {
  "IV" => 4,
  "IX" => 9,
  "XL" => 40,
  "XC" => 90,
  "CD" => 400,
  "CM" => 900,  
  "I" => 1,
  "X" => 10,
  "C" => 100,
  "M" => 1000,
  "V" => 5,
  "L" => 50,
  "D" => 500,
}

def roman_to_int(s)
  groups = s.scan(/IV|IX|XL|XC|CD|CM|./)
  groups.reduce(0) do |prev, group|
    prev + ROMANS[group]
  end
end

p roman_to_int "III" # 3
p roman_to_int "IX" # 9
p roman_to_int "LVIII" # 58
p roman_to_int "MCMXCIV" # 1994