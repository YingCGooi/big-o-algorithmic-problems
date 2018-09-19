# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# How many possible unique paths are there?

def unique_paths(max_col, max_row)
  unique_paths_helper(max_col, max_row, 1, 1, {})
end

def unique_paths_helper(max_col, max_row, col=1, row=1, cache)
  return 1 if col == max_col || row == max_row

  cache[[row, col]] ||= 
    unique_paths_helper(max_col, max_row, col + 1, row, cache) +
    unique_paths_helper(max_col, max_row, col, row + 1, cache)

  return cache[[row, col]]
end

p unique_paths(3, 2) # 3
p unique_paths(7, 3) # 28