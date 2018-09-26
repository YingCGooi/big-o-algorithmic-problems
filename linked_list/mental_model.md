### Remove Duplicates From Sorted List
Leaving only unique numbers behind

Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.

```ruby
dum -> [1] -> [2] -> [3] -> [3] -> [3] -> [4] -> [4] -> [5] ->
 P      C      N # initialize pointers, C != N => traverse

dum -> [1] -> [2] -> [3] -> [3] -> [3] -> [4] -> [4] -> [5] ->
        P      C      N # C != N => traverse

               L
dum -> [1] -> [2] -> [3] -> [3] -> [3] -> [4] -> [4] -> [5] ->
               P      C      N # C == N => mark L = P        

               L
dum -> [1] -> [2] -> [3] -> [3] -> [3] -> [4] -> [4] -> [5] ->
                      P      C      N # C == N => traverse until

               L
dum -> [1] -> [2] -> [3] -> [3] -> [3] -> [4] -> [4] -> [5] ->
                             P      C      N  # C != N

               L
dum -> [1] -> [2] ----------------------> [4] -> [4] -> [5] ->
                            [3] -> [3] ---^
                             P      C      N  # Point L.next to N      
               L             
dum -> [1] -> [2] ----------------------> [4] -> [4] -> [5] ->
               P (reassign)                C      N  # reassign C to N, N to N.next  

               L             
dum -> [1] -> [2] -> [4] -> [4] -> [5] ->
               P      C      N  # C == N => mark L = P, traverse until           

               L             
dum -> [1] -> [2] -> [4] -> [4] -> [5] ->
                      P      C      N  # C != N        

               L             
dum -> [1] -> [2] ---------------> [5] ->
                     [4] -> [4] ---^
                      P      C      N  # point L.next to N
               L
dum -> [1] -> [2] ---------------> [5] -> # reassign pointers
               P                    C      N

                
dum -> [1] -> [2] -> [5] -> # break loop
                      P     CN                                     

```

### Palindrome - Fast slow runner
```ruby
0 -> 1 -> 2 -> 3 -> 2 -> 1 -> 0 ->
SF

0 -> 1 -> 2 -> 3 -> 2 -> 1 -> 0 ->
     S    F

0 -> 1 -> 2 -> 3 -> 2 -> 1 -> 0 ->
          S         F   
          
0 -> 1 -> 2 -> 3 -> 2 -> 1 -> 0 ->
               S              F 

  0 -> 1 -> 2 -> 3 -> 2 -> 1 -> 0 ->
  P    C    N         S       

  0 <- 1    2 -> 3 -> 2 -> 1 -> 0 ->
  P    C    N                 

  0 <- 1 <- 2    3 -> 2 -> 1 -> 0 ->
       P    C    N             

  0 <- 1 <- 2    3 -> 2 -> 1 -> 0 ->
            P    C    N  
 
  0 <- 1 <- 2    3 -> 2 -> 1 -> 0 ->
   \_________________/S  
   
  2 -> 1 -> 0 -> 2 -> 1 -> 0 ->                                 
  ^              S 

  2 -> 1 -> 0 -> 2 -> 1 -> 0 -> # break loop                        
            ^              S   



0 -> 1 -> 2 -> 2 -> 1 -> 0 ->
SF

0 -> 1 -> 2 -> 2 -> 1 -> 0 ->
     S    F 

0 -> 1 -> 2 -> 2 -> 1 -> 0 ->
          S         F

0 -> 1 -> 2 -> 2 -> 1 -> 0 ->
               S              F          
```

