# Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

# For example, given the following triangle

# def minimum_path_sum(triangle)
#   levels = triangle.size
#   index = 0
#   sum = 0

#   (0...levels).each do |level|
#     next sum = triangle[0][0] if level == 0
#     sum = sum + min_adjacent_val(triangle, level, index)
#   end

#   sum
# end

# def min_adjacent_val(triangle, level, index)
#   curr_level = triangle[level]
#   left = curr_level[index]
#   right = curr_level[index + 1]
#   [left, right].min
# end

def minimum_path_sum(triangle)
  cache = {
    [0, 0] => triangle[0][0]
  }

  rows = triangle.size

  (1...rows).each do |row|
    (0...triangle[row].size).each do |col|
      cache[[row, col]] = calculate_min_sum(row, col, triangle, cache)
    end
  end

  find_last_row_min(cache, rows)
end

def calculate_min_sum(row, col, triangle, cache)
  curr_val = triangle[row][col]
  prev_left = cache[[row - 1, col -1]] || Float::INFINITY
  prev_right = cache[[row - 1, col]] || Float::INFINITY
  return [prev_left, prev_right].min + curr_val
end

def find_last_row_min(cache, rows)
  cache.select { |(row, _), _| row == rows - 1 }
       .values
       .min
end

p minimum_path_sum [
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
] # 11

# The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

# Base Case:
# [ 2 ] => always start at the top triangle
# => cache { [0, 0] => 2 }

#  [2]
# [3, 4] => cache[[row, col]] = [cache[[row - 1, col - 1]] || +INF, cache[[row - 1, col] || +INF].min
#  0  1  => { [0,0]=>2, [1,0]=>5, [1,1]=>6 }

# # prev i => curr i
# # 0 => 0 or 1
# # 1 => 1 or 2
# # 2 => 2 or 3
# # 3 => 3 or 4

#   [2]
#  [3,4] 
# [6,5,7] => cache[row, col] = [left_adjacent || +INF, right_adjacent || +INF].min
#  0 1 2  => { [0,0]=>2, [1,0]=>5, [1,1]=>6, [2,0]=>min_sum(1,0), [2,1]=>[min_sum(1,0),min_sum(1,1)].min }

#    [2]
#   [3,4] 
#  [6,5,7]
# [4,1,8,3] => min(last_level_sums)
#  0 1 2 3 => 11