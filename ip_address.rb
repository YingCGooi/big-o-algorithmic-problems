# Write a function to check whether an input string is a valid IPv4 address or IPv6 address or neither.

# IPv4 addresses are canonically represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255, separated by dots ("."), e.g.,172.16.254.1;

# Besides, leading zeros in the IPv4 is invalid. For example, the address 172.16.254.01 is invalid.

# IPv6 addresses are represented as eight groups of four hexadecimal digits, each group representing 16 bits. The groups are separated by colons (":"). For example, the address 2001:0db8:85a3:0000:0000:8a2e:0370:7334 is a valid one. Also, we could omit some leading zeros among four hexadecimal digits and some low-case characters in the address to upper-case ones, so 2001:db8:85a3:0:0:8A2E:0370:7334 is also a valid IPv6 address(Omit leading zeros and using upper cases).

# However, we don't replace a consecutive group of zero value with a single empty group using two consecutive colons (::) to pursue simplicity. For example, 2001:0db8:85a3::8A2E:0370:7334 is an invalid IPv6 address.

# Besides, extra leading zeros in the IPv6 is also invalid. For example, the address 02001:0db8:85a3:0000:0000:8a2e:0370:7334 is invalid.

# Note: You may assume there is no extra space or special characters in the input string.

# Example 1:
# Input: "172.16.254.1"

# Output: "IPv4"

# Explanation: This is a valid IPv4 address, return "IPv4".

# Example 2:
# Input: "2001:0db8:85a3:0:0:8A2E:0370:7334"

# Output: "IPv6"

# Explanation: This is a valid IPv6 address, return "IPv6".
# Example 3:
# Input: "256.256.256.256"

# Output: "Neither"

# Explanation: This is neither a IPv4 address nor a IPv6 address.

# Requirements
# IPv4
# (0-255).(0-255).(0-255).(0-255)
# 172.16.254.1 is valid
# Leading zeros is invalid
# 172.16.254.01 is invalid

# IPv6
# (0-9A-F){4}: * 7 + (0-9A-F){4}
# 2001:0db8:85a3:0000:0000:8a2e:0370:7334 is valid
# leading zeros can be omitted
# 2001:db8:85a3:0:0:8A2E:0370:7334 is valid
# Minimum value of a single group has to be 0, cannot be omitted
# 2001:0db8:85a3::8A2E:0370:7334 is invalid
# Cannot have extra leading zeros
# 02001:0db8:85a3:0000:0000:8a2e:0370:7334 is invalid

# Algorithm
# Take the input string
# => check if input string contains "."
# => if true, handle it as IPv4 validation
# => if false, handle it as IPv6 validation
# => return the result string

# IPv4 validation
# split the string by "."
# => returns an array of elements
# => if array.length != 4, return INVALID
# => if any elements are empty string, return INVALID
# => reject non-digit characters
# => if any elements' integer value is not between 0-255, return INVALID
# => if any elements has a leading zero, return INVALID
# return "IPv4"

INVALID = "Neither"

def valid_ipv4?(str)
  groups = str.split('.')
  return false if groups.length != 4 || str.count(".") != 3

  groups.each do |group|
    invalidation = 
      group.empty? ||
      group.match(/[^0-9]|0+\d/i) ||
      !group.to_i.between?(0, 255)

    return false if invalidation
  end

  true
end

# IPv6 validation
# split the string by ":"
# => return an array of elements
# => if array.length != 8, return INVALID
# => if any elements contains chars NOT (A-F0-9)/i, return INVALID
# => every element has to have 1 - 4 characters
# we don't have to check for leading zeros
# return "IPv6"

def valid_ipv6?(str)
  groups = str.split(":")

  return false if groups.length != 8 || str.count(":") != 7

  groups.each do |group|
    invalidation =
      group.match(/[^A-F0-9]/i) ||
      !group.length.between?(1, 4)

    return false if invalidation
  end

  true
end

def valid_ip_address(ip)
  return "IPv4" if valid_ipv4?(ip) 
  return "IPv6" if valid_ipv6?(ip)
  "Neither"
end

p valid_ip_address("172.16.254.1") # "IPv4"
p valid_ip_address("2001:0db8:85a3:0:0:8A2E:0370:7334") # "IPv6"
p valid_ip_address("2001:0db8:85a3:0:0:8A2E:0370:7334:") # Neither
p valid_ip_address("256.256.256.256") # Neither
