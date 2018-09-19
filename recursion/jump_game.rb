RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}
# Given an array of non-negative integers, you are initially positioned at the first index of the array.

# Each element in the array represents your maximum jump length at that position.

# Determine if you are able to reach the last index.

def can_jump(arr)
  return false if arr.empty?
  jump_helper(arr, index = arr.size - 1, jumps = 0)
end

def jump_helper(arr, index, jumps)
  can_jump = arr[index] >= jumps

  return can_jump if index == 0

  if can_jump
    jumps = 1  
  else
    jumps += 1
  end
  jump_helper(arr, index - 1, jumps)
end
# Time O(N)
# Space O(1)

#===== Dynamic Programming Approach =====

def can_jump(arr)
  return false if arr.empty?
  return true  if arr.length == 1

  last_index = arr.length - 1
  cache = { last_index => true }
  jump_helper(arr, last_index - 1, cache)
end

def jump_helper(arr, index, cache)
  curr_value = arr[index]

  if curr_value > 0
    (1..curr_value).each do |jumps|
      break cache[index] = true if cache[index + jumps]
    end
  end

  cache[index] ||= false
  return cache[0] if index == 0

  jump_helper(arr, index - 1, cache) # TCO
end

# Time: O(N²)
# Space: O(N)

p can_jump [2, 3, 1, 1, 4] # true
p can_jump [3, 2, 1, 0, 4] # false
p can_jump [3] # true
p can_jump [] # false
p can_jump [0] # true