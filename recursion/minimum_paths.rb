# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

def min_path_sum(grid)
  min_sum(grid, row = grid.size - 1, col = grid[0].size - 1, {})
end

def min_sum(grid, row, col, cache)
  return grid[0][0] if row == 0 && col == 0
  curr_value = grid[row][col]

  prev_row_min_sum = curr_value + min_sum(grid, row - 1, col, cache) if row != 0
  prev_col_min_sum = curr_value + min_sum(grid, row, col - 1, cache) if col != 0
  return prev_row_min_sum if col == 0
  return prev_col_min_sum if row == 0

  cache[[row, col]] ||= [ prev_row_min_sum, prev_col_min_sum ].min
  return cache[[row, col]]
end

grid = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
p min_path_sum(grid) # 7
# Explanation: Because the path 1→3→1→1→1 minimizes the sum.
p "calls #{$count}"

grid = [
  [1,2],
  [1,1]
]
p min_path_sum(grid) # 3
p "calls #{$count}"

grid = [
  [1,2,5],
  [3,2,1]
]
p min_path_sum(grid) # 6

grid = [[1]]
p min_path_sum(grid)

grid = [[1, 2]]
p min_path_sum(grid) # 3

grid = [
  [1],
  [2]
]
p min_path_sum(grid)