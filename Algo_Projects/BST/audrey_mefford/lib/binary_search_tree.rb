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
    node = find(value)
    # return nil if node.nil?
    if node.right.nil? && node.left.nil?
      return @root = nil if node == @root
      if node.parent.value >= node.value
        node.parent.left = nil
      else
        node.parent.right = nil
      end
    elsif node.right.nil?
      if node.parent.value >= node.value
        node.parent.left = node.left
      else
        node.parent.right = node.left
      end
    elsif node.left.nil?
      if node.parent.value >= node.value
        node.parent.left = node.right
      else
        node.parent.right = node.right
      end
    else
      new_node = maximum(node.left)
      if new_node.left
        if new_node.parent.value >= new_node.value
          new_node.parent.left = new_node.left
        else
          new_node.parent.right = new_node.left
        end
      end
      if node.parent.value >= node.value
        node.parent.left = new_node
      else
        node.parent.right = new_node
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    curr = tree_node.right
    until curr.right.nil?
      curr = curr.right
    end
    curr
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?

    right_depth = depth(tree_node.right) + 1
    left_dpeth = depth(tree_node.left) + 1

    return [right_depth, left_dpeth].max
  end


  def is_balanced?(tree_node = @root)
    if tree_node.nil?
      return true
    elsif tree_node.right.nil? && tree_node.left.nil?
      return true
    elsif tree_node.right.nil? && depth(tree_node.left) == 1
      return true
    elsif tree_node.left.nil? && depth(tree_node.right) == 1
      return true
    else
      right_depth = depth(tree_node.right)
      left_depth = depth(tree_node.left)

      if (right_depth - left_depth).abs <= 1
        if is_balanced?(tree_node.right) && is_balanced?(tree_node.left)
          return true
        end
      end
      false
    end
  end



  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?

    arr += in_order_traversal(tree_node.left)
    arr << tree_node.value
    arr += in_order_traversal(tree_node.right)

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

  def remove(node)


  end

end
