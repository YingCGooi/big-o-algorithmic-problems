### Merge Two Sorted Arrays

```ruby
  [1, 2, 5, 7, 9, 9, 0, 0, 0] # initialize pointers
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
