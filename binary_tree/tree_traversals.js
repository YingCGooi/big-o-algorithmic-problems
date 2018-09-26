 //     1
 //    / \
 //   2   3
 //  / \
 // 4   5

// Depth First Traversals:
// (a) Inorder (Left, Root, Right) : 4 2 5 1 3
// (b) Preorder (Root, Left, Right) : 1 2 4 5 3
// (c) Postorder (Left, Right, Root) : 4 5 2 3 1

const TreeNode = {
  new(...params) {
    return Object.create(this).init(...params);
  },

  init(value, leftChild=null, rightChild=null) {
    this.value = value;
    this.leftChild = leftChild;
    this.rightChild = rightChild;

    return this;
  }
};


const root = TreeNode.new(1,
  TreeNode.new(2, 
    TreeNode.new(4), 
    TreeNode.new(5)
  ), 
  TreeNode.new(3)
);

const printVal = (node) => { console.log(node.value) };

// In-order: Left, Root, Right (4, 2, 5, 1, 3)
function walkInOrder(node, func) {
  if (node === null) return;

  walkInOrder(node.leftChild, func);
  func(node);
  walkInOrder(node.rightChild, func);
}


// Pre-order: Root, Left, Right (1, 2, 4, 5, 3)
function walkPreOrder(node, func) {
  if (node === null) return;

  func(node);
  walkPreOrder(node.leftChild, func);
  walkPreOrder(node.rightChild, func);
}


// Post-order: Left, Right, Root (4, 5, 2, 3, 1)
function walkPostOrder(node, func) {
  if (node === null) return;

  walkPostOrder(node.leftChild, func);
  walkPostOrder(node.rightChild, func);
  func(node);
}


walkInOrder(root, printVal); // 4, 2, 5, 1, 3
console.log("=====");
walkPreOrder(root, printVal); // 1, 2, 4, 5, 3
console.log("=====");
walkPostOrder(root, printVal); // 4, 5, 2, 3, 1