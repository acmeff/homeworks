# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require_relative 'bst_node'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      parent = choose_location(value, @root)
      if value <= parent.value
        parent.left = BSTNode.new(value)
        parent.left.parent = parent
      else
        parent.right = BSTNode.new(value)
        parent.right.parent = parent
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?

    if tree_node.value == value
      return tree_node
    elsif value <= tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end

  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  def choose_location(value, tree_node)
    if value <= tree_node.value
      return tree_node if tree_node.left.nil?
      choose_location(value, tree_node.left)
    else
      return tree_node if tree_node.right.nil?
      choose_location(value, tree_node.right)
    end
  end

end
