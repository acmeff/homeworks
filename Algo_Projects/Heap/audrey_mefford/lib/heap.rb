class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = Proc.new{|x, y| x <=> y}
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    old_root = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    old_root
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length-1) unless @store.length == 1
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    child1 = 2*parent_index + 1
    child2 = 2*parent_index + 2
    children << child1 if child1 < len
    children << child2 if child2 < len
    children
  end

  def self.parent_index(child_index)
    if child_index == 0
      raise "root has no parent"
    end
    (child_index-1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new{|x, y| x <=> y}
    parent = array[parent_idx]

    child1 = BinaryMinHeap.child_indices(len, parent_idx)[0]
    child2 = BinaryMinHeap.child_indices(len, parent_idx)[1]

    case
    when child1 && child2
      chosen = prc.call(array[child1], array[child2]) == 1 ? array[child2] : array[child1]
    when child1
      chosen = array[child1]
    when child2
      chosen = array[child2]
    else
      chosen = nil
    end
    
    chosen_idx = array.index(chosen)

    return array if chosen.nil? || prc.call(parent, chosen) != 1

    array[parent_idx], array[chosen_idx] = array[chosen_idx], array[parent_idx]

    BinaryMinHeap.heapify_down(array, chosen_idx, &prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new{|x, y| x <=> y}

    return array if child_idx == 0

    child = array[child_idx]
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    parent = array[parent_idx]

    return array if prc.call(child, parent) == 1
    array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]

    BinaryMinHeap.heapify_up(array, parent_idx, &prc)
  end
end
