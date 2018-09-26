# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

# How many possible unique paths are there?

def unique_paths(cols, rows)
  cache = {}

  (0...rows).each do |row| # iterate from 0 to rows - 1
    (0...cols).each do |col| # iterate from 0 to cols - 1
      coord = [row, col] # for each coord, calculate the unique paths
      next cache[coord] = 1 if (row == 0 || col == 0)
      cache[coord] = cache[[row - 1, col]] + cache[[row, col - 1]]
    end
  end

  last_coord = [rows - 1, cols - 1]
  return cache[last_coord]
end

p unique_paths(3, 3)
p unique_paths(3, 2)
# Time O(C * R)
# Space O(C * R)

# [S] [ ] [ ]
# [ ] [ ] [ ]
# [ ] [ ] [F]
#  # define x as the number of unique steps to arrive at coordinate x

# [S] [x] [ ]  # x = 1 => there is only one way to arrive at x
# [ ] [ ] [ ]  # row == 0
# [ ] [ ] [F]
#  # define x as the number of unique steps to arrive at coordinate x

# [0] [1] [1]  # unique_paths(x) = 
# [1] [x] [ ]  # unique_paths(col, row - 1) + unique_paths(col - 1)
# [1] [ ] [ ]  # x = 2
#  # define x as the number of unique steps to arrive at coordinate x

# [0] [1] [1]  # if coord of x == max_cols
# [1] [2] [x]  # start at next row
# [1] [ ] [ ]  # 

# [0] [1] [1]  # if coord of x == max_cols
# [1] [2] [3]  # start at next row
# [x] [ ] [ ]  # 

# [0] [1] [1]  # if coord of x == max_rows
# [1] [2] [3]  # only move to the right
# [1] [x] [ ]  # 

# [0] [1] [1]  # if coord of x == max_rows
# [1] [2] [3]  # && coord of x == max_cols
# [1] [3] [x]  # stop iteration


