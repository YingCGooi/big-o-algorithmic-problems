### Find Max Number

```ruby
  [1, 2, 9, 5, 6, 7, 8, 7]  acc = 1
   ^ 
     [2, 9, 5, 6, 7, 8, 7]  arr[index] > acc => acc = 2
      ^
        [9, 5, 6, 7, 8, 7]  arr[index] > acc => acc = 9
         ^
           [5, 6, 7, 8, 7]  arr[index] < acc # do not reassign
            ^   
           [5, 6, 7, 8, 7]  return acc
                          ^
```

### Find a number

```ruby
  [1, 2, 9, 5, 6, 7, 8, 7]  target = 6
   ^

  [1, 2, 9, 5, 6, 7, 8, 7]  target = 6
      ^

  [1, 2, 9, 5, 6, 7, 8, 7]  return index
               ^      

  [1, 1] target = 6
   ^
  [1, 1] return -1
         ^
```

### Search For Range (Recursive)
```ruby
# Case 1
  [5, 6, 6, 7, 7, 8, 8, 10] # target = 8
#  L        M            R  # initialize pointers: find left boundary

  [5, 6, 6, 7, 7, 8, 8, 10] # run binary search until the target value is found
#           M  L         R  

  [5, 6, 6, 7, 7, 8, 8, 10] # target is found, midpoint == 8, prev_value < 8, left boundary is found
#              L^ M      R 


# Case 2 - left boundary
  [5, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 10] # target = 8
#  L                    M                     R  # initialize pointers: find left boundary

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # run binary search until the target value is found
#                       M  L                  R

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # midpoint == 8 => target found, compare prev_value == target
#                          L     ^  M         R  # if true, left boundary is on left hand side

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Move right pointer to previous index of midpoint
#                          L     R  M            

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Re-calculate midpoint, midpoint == 8 => target found
#                          L^ M  R               # prev_value == target

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Run binary search again, midpoint == 8 => target found
#                       ^  L                     # prev_value < target => left boundary = midpoint
#                          R
#                          M

# Case 2 - right boundary
  [5, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 10] # target = 8
#  L                    M                     R  # initialize pointers: find right boundary

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # run binary search until the target value is found
#                       M  L                  R

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10]  # midpoint == 8 => target found, compare next_value to target
#                          L        M  ^      R  # right_boundary is on right hand side

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # Run binary search
#                                      L  M   R

  [5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 10] # midpoint == 8 => target found, next_value > target
#                                      L  M  ^R  # right boundary = midpoint
```


### Merge Sort
```ruby
  [5,  6,  1,  2,  8,  4,  3,  2,  1]

  [5,  6,  1,  2,  8]|[4,  3,  2,  1] # split the array into two halves
          L          |       R
  # do it recursively until arr.length <= 1
   5,  6,  1 | 2,  8 | 4,  3 | 2,  1  
       L     |   R   |   L   |   R

   5,  6 | 1 | 2 | 8 | 4 | 3 | 2,  1  
     L   | R | L | R | L | R | L   R

   5 | 6 | 1 | 2 | 8 | 4 | 3 | 2 | 1  
   L | R |  

  # Perform Merge Sort
   1,  5,  6 | 2,  8 | 3,  4 | 1,  2

   1,  2,  5,  6,  8 | 1,  2,  3,  4

```

### Maximum Sum
```ruby
  [99,  -5,  6,  -2,  -3,  1,  5,  -6] # split the array in half


  [99,  -5,  6,  -2]+[-3,  1,  5,  -6]
                   max
             98 <--sum--> 3 = 102

  [99,  -5]+[6,  -2] [-3,  1] [5,  -6]
          max               max
     94 <-sum-> 6 =100   1<-sum->5 = 6

```


### Stairs
```ruby
                        ____
                   ____| N     N = (N - 1) + (N - 2)
              ____| N-1--/ 
         ____| N-2------/
    ____|  2  # There are 2 ways to go to 2 (1 + 1 or 0 + 2)
___|  1   # There's only 1 way to go to 1 (0 + 1)

```

### Unique Paths
```ruby
    +---+---+---+
    | S |   |   |
    +---+---+---+
    |   |   | F |
    +---+---+---+

      0   0   0   => boundary conditions => return 0 if row < 1 || col < 1
    +---+---+---+
  0 | 3 | 2 | 1 |  F = (cols - 1, row) + (row - 1, cols)
    +---+---+---+
  0 | 1 | 1 | F |
    +---+---+---+    

```


### Minimum Paths
```ruby
      0   0   0
    +---+---+---+
  0 | 1 | 3 | 1 |
    +---+---+---+
  0 | 1 | 5 | 1 |
    +---+---+---+
  0 | 4 | 2 | 1 |
    +---+---+---+

    +---+---+---+
    | x | x | x | 
    +---+---+---+
    | x | x | x | => min_path_sum(grid, row - 1, col)
    +---+---+---+                 |
    | 4 | 2 |(1)|                 |
    +---+---+---+                 v
                            return min of the two
    +---+---+---+                 ^
    | x | x | 1 |                 |
    +---+---+---+                 |
    | x | x | 1 |                 |
    +---+---+---+                 |
    | x | x |(1)| => min_path_sum(grid, row, col - 1)
    +---+---+---+        

    +---+---+---+
    | x | 3 | 1 | 
    +---+---+---+ => col = 0 # Only decrement row
    | x | 5 | 1 | => min_path_sum(grid, row - 1, col)
    +---+---+---+
    |(4)| 2 | 1 |                 |
    +---+---+---+                 |
                                  v
    +---+---+---+
    | x | 3 | 1 | 
    +---+---+---+ => col = 0 # Only decrement row
    |(1)| 5 | 1 | => min_path_sum(grid, row - 1, col)
    +---+---+---+
    | 4 | 2 | 1 |
    +---+---+---+ 

    +---+---+---+
    |(1)| 3 | 1 | => return 1
    +---+---+---+
    | 1 | 5 | 1 |
    +---+---+---+
    | 4 | 2 | 1 |
    +---+---+---+    
```

### Jump Game
```ruby
[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 0(alrdy last i)
                       I   # 5 >= jumps => reset jumps to 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 1
                    I      # 0 < jumps => jumps += 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 2
                 I         # 1 < jumps => jumps += 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 3
              I            # 3 >= jumps => reset jumps to 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 1
           I               # 0 < jumps => jumps += 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 2
        I                  # 1 < jumps => jumps += 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 3
     I                     # 2 < jumps => jumps += 1

[ 4, 2, 1, 0, 3, 1, 0, 5 ] # jumps = 4; 4 >= jumps => true
  I                        # if index == 0 && true => return true
                           # otherwise false
```


### Jump Game (Dynamic Programming Approach)
```ruby
[ 4, 2, 1, 0, 3, 1, 0, 5 ] 
                       I  # if I == last index, memoize index as true

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7 => true } 
                    I  # Move I to the left, if 0, memoize as false     

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7 => true, 6 => false } 
                 I  # Move I to the left
                    # if > 0, iterate cache[I + val] from 1 to val  
                    cache[I + 1] => cache[6] => false # end of loop
                    # memoize as false

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7=>true, 6=>false, 5=>false } 
              I  # Move I to the left
                 # val > 0, iterate cache[I + val] from 1 to val
                 cache[I + 1] => cache[5] => false
                 cache[I + 2] => cache[6] => false
                 cache[I + 3] => cache[7] => true # break, memo as true

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7=>true, 6=>false, 5=>false, 4=>true } 
           I  # Move I to the left
              # val == 0, memo as false

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7=>T, 6=>F, 5=>F, 4=>T, 3=>F } 
        I  # Move I to the left
           cache[I + 1] => cache[3] => false # end of loop; memo as false

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7=>T, 6=>F, 5=>F, 4=>T, 3=>F, 2=>F } 
     I  # Move I to the left
        cache[I + 1] => cache[2] => false
        cache[I + 2] => cache[3] => false # end of loop; memo as false

[ 4, 2, 1, 0, 3, 1, 0, 5 ] { 7=>T, 6=>F, 5=>F, 4=>T, 3=>F, 2=>F, 1=>F } 
  I  # Move I to the left
     cache[I + 1] => cache[1] => false
     cache[I + 2] => cache[2] => false
     cache[I + 3] => cache[3] => false
     cache[I + 4] => cache[4] => true # break loop; memo as true

{ 7=>T, 6=>F, 5=>F, 4=>T, 3=>F, 2=>F, 1=>F, 0=>T }
return cache[0] => true


```


### Coin Change
```ruby

Given coins of different denomination - [1, 2, 5]
sort => [1, 2, 5] and
reverse => [5, 2, 1] O(n*log(n))


                    { 5: 0, 2: 0, 1: 0 }, amt = 11
                    /                 \
                   /                   \
    { 5: 1, 2: 0, 1: 0 }, amt = 6    {5:0,2:1,1:0}, amt=9
          /            \
         /              \
  5:2,2:0,1:0, amt=1    {5:1, 2:1, 1:0}, amt=4
      |                     |
      |                     |
  5:2,2:0,1:1, amt=0     {5:1, 2:2, 1:0}, amt=2
=> num of coins (level) = 3     |
                                |
                         {5:1, 2:3, 1:0}, amt=0    
                        => num of coins (level) = 4
```     
