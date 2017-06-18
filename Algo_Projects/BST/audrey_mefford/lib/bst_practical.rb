require 'binary_search_tree'


#probably faster to do a reverse order traversal
def kth_largest(tree_node, k)
  tree = BinarySearchTree.new
  tree.root = tree_node

  data = tree.in_order_traversal
  tree.find(data[data.length-k])
end
