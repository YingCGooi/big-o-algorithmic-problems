# You are climbing a stair case. It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Note: Given n will be a positive integer.

# Step 1 => 1 way => 1
# Step 2 => 2 ways => 1 + 1 or 0 + 2
# Step 3 => 3 ways => 1 + 1 + 1, 2 + 1, 1 + 2
#                  => ways in Step 1 + ways in Step 2

def climb_stairs(n)
  first = 1
  second = 2

  return first if n == 1
  return second if n == 2

  current = first + second
  counter = 3

  while counter < n
    counter += 1
    first = second
    second = current
    current = first + second
  end

  return current
end

p climb_stairs(1)
p climb_stairs(2)
p climb_stairs(3)
p climb_stairs(4)
p climb_stairs(5)
