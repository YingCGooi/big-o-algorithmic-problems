# You are climbing a stair case. It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Note: Given n will be a positive integer.

def climb_stairs(n, cache={})
  return 1 if n == 1
  return 2 if n == 2

  cache[n] ||= climb_stairs(n - 1, cache) + climb_stairs(n - 2, cache)
end

# Example 1:
p climb_stairs 2 # 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps

p climb_stairs 3 # 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

p climb_stairs 4
p climb_stairs 35