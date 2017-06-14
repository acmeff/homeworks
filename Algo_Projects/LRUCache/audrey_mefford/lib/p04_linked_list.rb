# require 'Enumerable'

class Node
  attr_accessor :key, :val, :next, :prev


  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    old_next = @next
    @next.prev = @prev
    @prev.next = old_next
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |curr| return curr.val if key == curr.key }
  end

  def include?(key)
    each { |curr| return true if key == curr.key }
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    old_last = @tail.prev
    new_node.prev = old_last
    old_last.next = new_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    each { |curr| curr.val = val if key == curr.key }
  end

  def remove(key)
    each { |curr| curr.remove if key == curr.key }
  end

  def each(&prc)
    curr = @head.next
    until curr == @tail
      prc.call(curr)
      curr = curr.next
    end
    nil
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
