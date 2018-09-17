Rotated Sorted Array Search

```ruby
# Case 1
  [4, 5, 6, 7, 0, 1, 2] # target = 0
  [4, x, x, 7, x, x, 2] # target not in between L and M; not in between M and R
   L        M        R  # M > R => right hand side

# Case 2
  [0, 1, 2, 4, 5, 6, 7] # target = 1
  [0, x, x, 4, x, x, 7] # L value < target < M value => left hand side
   L        M        R    

# Case 3
  [4, 5, 6, 7, 0, 1, 2] # target = 5
  [4, x, x, 7, x, x, 2] # target in between L and M
   L        M        R  # => left hand side 

# Case 4
  [7, 0, 1, 2, 4, 5, 6] # target = 0
  [7, x, x, 2, x, x, 6] # target not in between L and M; not in between M and R
   L        M        R  # L val > M val => left hand side

 # Case 5
  [7, 0, 1, 2, 4, 5, 6] # target = 4
  [7, x, x, 2, x, x, 6] # target in between M and R
   L        M        R  # => right hand side

  # Case 5
  [7, 0, 1, 2, 4, 5, 6] # target = 9
  [7, x, x, 2, x, x, 6] # L val > M val
   L        M        R  # => right hand side

   # Case 5
  [7, 0, 1, 2, 4, 5, 6] # Break if L > R
  [7, x, x, 2, x, x, 6] # 
                     MR  L  # 
```
