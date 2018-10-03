### Height-Balanced Binary Tree



```ruby
        1
       / \
      2   2
     / \   \
    3   3   1
   / \
  4   4
 /
5


    1     l = 0, r = 0
   / \    
  
          
    2  # Traverse to the left child node
   / \    l = 1
        

5  # Traverse until no child nodes
    l = 4 => return l = 4


    1     l = 4, r = 0
   / \  


     2  # Traverse the right child node
      \
       1 # edge of the right subtree
         r = 2 => return r = 2

  l = 4 and r = 2 => determine if balance
```


### Level Order Traversal
```
  #   3
  #  / \
  # 9  20
  #   /  \
  #  15   7

# Enqueue Root(3)
# Empty buffer
# Dequeue and push into buffer until queue is empty
# buffer [Root(3)]
# transform buffer into array of values, push into result [[3]]
# 
# Iterate through buffer [Root(3)]
# For each node, enqueue left and right child nodes
# queue => [Node(9), Node(20)]
# Empty buffer => []
# Dequeue and push into buffer until queue is empty
# buffer [Node(9), Node(20)]
# transform buffer into array of values, push into result => [[3], [9, 20]]
#
# Iterate through buffer [Node(9), Node(20)]
# For each node, enqueue left and right child if not nil
# queue => []
# queue => [Node(15), Node(17)]
# Empty buffer => []
# Dequeue and push into buffer until queue is empty
# buffer => [Node(15), Node(17)]
# transform buffer into array of values, push into result
# result => [[3], [9,20], [15,7]]

# Iterate through buffer [Node(15), Node(7)]
# For each node, enqueue left and right child if child is not nil
# queue => []
# if queue is empty, return result
```

