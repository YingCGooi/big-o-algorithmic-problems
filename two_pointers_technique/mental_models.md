### Merge Two Sorted Arrays

```ruby
  [1, 2, 5, 7, 9, 9, 0, 0, 0] # initialize pointers, W = a1.length + a2.length - 1
                  R1       W  # compare R1 and R2
     [4, 5, 8]                # R1 > R2
            R2

                  ┌--------┐
  [1, 2, 5, 7, 9, 9, 0, 0, 9]
                  R1       W  #  Write R1's value
     [4, 5, 8]
            R2 

  [1, 2, 5, 7, 9, 9, 0, 0, 9]
               R1       W     #  Move R1 and W to the left
     [4, 5, 8]
            R2  
               ┌--------┐
  [1, 2, 5, 7, 9, 9, 0, 9, 9]
               R1       W     # R1 > R2 => Write R1's value
     [4, 5, 8]
            R2


  [1, 2, 5, 7, 9, 9, 0, 9, 9]
            R1       W     # Move R1 and W left
     [4, 5, 8]
            R2


  [1, 2, 5, 7, 9, 9, 8, 9, 9]
            R1       W     # R1 < R2 => Write R2's value
     [4, 5, 8]       |
            R2 ------┘   

  [1, 2, 5, 7, 9, 9, 8, 9, 9]
            R1    W        #  Move R2 and W to the left
     [4, 5, 8]
         R2
            +-----v
  [1, 2, 5, 7, 9, 7, 8, 9, 9]
            R1    W        # R1 > R2 => Write R1's value
     [4, 5, 8]
         R2     

  [1, 2, 5, 7, 9, 7, 8, 9, 9]
         R1    W        # Move R1 and W to the left
     [4, 5, 8]
         R2

  [1, 2, 5, 7, 5, 7, 8, 9, 9]
         R1    W        # R1 >= R2, write R1's value
     [4, 5, 8]
         R2 

  [1, 2, 5, 7, 5, 7, 8, 9, 9]
      R1    W        # Move R1 and W to the left
     [4, 5, 8]
         R2 

  [1, 2, 5, 5, 5, 7, 8, 9, 9]
      R1    W        # R2 > R1 => Write R2's value
     [4, 5, 8]
         R2

  [1, 2, 5, 5, 5, 7, 8, 9, 9]
      R1 W        # Move R2 and W to the left
     [4, 5, 8]
      R2  

  [1, 2, 4, 5, 5, 7, 8, 9, 9]
      R1 W        # Write R2's value.
     [4, 5, 8]
      R2  

      W
  [1, 2, 4, 5, 5, 7, 8, 9, 9]
      R1         # If R2 < 0, break loop
     [4, 5, 8]
  R2                                                   

```

There's an edge case where R1 is less than 0, while R2 is still pointing to some value. In this case, we assume that R1's value is -INFINITY and always write R2's value:

```ruby
  [4, 0, 0, 0] # Initialize pointers
   R1       W 
  [1, 2, 3]
         R2

  [4, 0, 0, 4] # R1 >= R2, write R1's value
   R1       W 
  [1, 2, 3]
         R2         

  [4, 0, 0, 4] # Move R1 and W one index to the left
R1       W     # R1 < 0
  [1, 2, 3]
         R2

  [4, 0, 0, 4] # If R1 < 0, always write R2's value
R1       W 
  [1, 2, 3]
         R2      

  [4, 0, 3, 4] # Move W and R2 to the left and repeat
R1    W 
  [1, 2, 3]
      R2                          
```
