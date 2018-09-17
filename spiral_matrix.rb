# Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

# Requirements:
# Return a single array.
# Elements are ordered as:
# arr[0][0], arr[0][1], ... , 
# arr[0][columns - 1],
# arr[1][columns - 1],
# arr[2][columns - 1],
# ...
# arr[rows - 1][columns - 1], arr[rows - 1][columns - 2], ...,
# arr[rows - 1][0],
# arr[rows - 2][0],
# arr[rows - 3][0],
# ...
# arr[1][0], arr[1][1], ... , 
# arr[1][columns - 2],
# arr[2][columns - 2],
# arr[3][columns - 2],
# ... 
# arr[rows - 2][columns - 2], arr[rows - 2][columns - 3], ...,
# arr[rows - 1][1],
# arr[rows - 2][1],
# arr[rows - 3][1],
# ...

# Algorithm
# initialize pointer at x = 0, y = 0
# initialize direction to right
# initialize x and y limits on both sides
# initialize result array as []
# while result array length < input array length
#   move pointer to the next position based on current direction
#   when pointer arrives at any x or y limit
#     change direction based on order (right => down => left => up)
#     decrement the current limit by 1
# return result array

class Direction
  DIRECTIONS = [:right, :down, :left, :up]  

  def initialize
    @max_index = 3
    @index = 0
  end

  def current
    DIRECTIONS[@index]
  end

  def next!
    @index == @max_index ? @index = 0 : @index += 1
  end
end

class Pointer
  attr_reader :x, :y, :limits, :matrix

  def initialize(x, y, matrix)
    @x = x
    @y = y
    @matrix = matrix
    @direction = Direction.new
    @limits = {
      right: matrix[0].length - 1,
      down: matrix.length - 1,
      left: 0,
      up: 1,
    }
  end

  def current_direction
    @direction.current
  end

  def value
    @matrix[y][x]
  end

  def next!
    if at_edge?
      decrement_current_limit
      @direction.next!      
    end

    case current_direction
    when :right then @x += 1
    when :down then @y += 1
    when :left then @x -= 1
    when :up then @y -= 1
    end
  end

  def current_axis
    return :x if [:right, :left].include?(current_direction)
    :y
  end

  def at_edge?
    return @limits[current_direction] == x if current_axis == :x
    @limits[current_direction] == y if current_axis == :y
  end

  def decrement_current_limit
    case current_direction
    when :right then @limits[current_direction] -= 1
    when :down  then @limits[current_direction] -= 1
    when :up    then @limits[current_direction] += 1
    when :left  then @limits[current_direction] += 1
    end
  end
end

def spiral_order(matrix)
  return [] if matrix.empty?
  pointer = Pointer.new(0, 0, matrix)

  matrix_element_count = matrix[0].length * matrix.length
  result = []

  while result.length < matrix_element_count
    result << pointer.value
    pointer.next!
  end

  result
end

p spiral_order(
  [
    [1, 2, 3, 4, 5],
    [16, 17, 18, 19, 6],
    [15, 24, 25, 20, 7],
    [14, 23, 22, 21, 8],
    [13, 12, 11, 10, 9],
  ]
)
# [1, 2, ..., 24, 25]

p spiral_order(
  [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9,10,11,12]
  ]
)
# [1,2,3,4,8,12,11,10,9,5,6,7]

p spiral_order([])