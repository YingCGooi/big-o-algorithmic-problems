def dnc_problem_helper(list, params)
  # base cases; very different per problem

  # divide
  left = get_left_half(list)
  right = get_right_half(list)

  # conquer
  left_result = dnc_problem_helper(left, pointers, acc)
  right_result = dnc_problem_helper(right, pointers, acc)

  # combine: very different per problem
  return combine(left_result, right_result)
end

def dnc_problem(list)
  dnc_problem_helper(list, pointers, accumulator)
end