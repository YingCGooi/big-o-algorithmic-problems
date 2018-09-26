# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

def min_path_sum(grid)
  cache = {
    [0, 0] => grid[0][0]
  }

  cols = grid[0].size
  rows = grid.size

  (0...rows).each do |row|
    (0...cols).each do |col|
      cache[[row, col]] = calculate_min(grid, row, col, cache)
    end
  end

  return cache[[rows - 1, cols - 1]]
end

def calculate_min(grid, row, col, cache)
  coord = [row, col]
  curr_value = grid[row][col]
  left_min = cache[[row, col - 1]]
  top_min = cache[[row - 1, col]]

  return grid[0][0] if row == 0 && col == 0
  return left_min + curr_value if row == 0
  return top_min + curr_value if col == 0
  return [left_min, top_min].min + curr_value
end

p min_path_sum [
  [1,3,1],
  [1,5,1],
  [4,2,1]
] # 7


# [a] => min_sum is a
# [a, b] => min_sum(B) is min_sum(A) + b
# [a, b, c] => min_sum is min_sum(B) + c

# [a] => min_sum(D) = min_sum(a) + d
# [D]

# [a][b] => min_sum is [(a + b), (a + d)].min + e
# [d][E] = min_sum(E) = [min_sum(B), min_sum(D)].min + e

# [a][b][c] => min_sum(F) = is [min_sum(C), min_sum(E)].min + f
# [d][e][F]

# [a][b][c] => min_sum(I) = is [min_sum(F), min_sum(H)].min + i
# [d][e][f]
# [g][h][I]