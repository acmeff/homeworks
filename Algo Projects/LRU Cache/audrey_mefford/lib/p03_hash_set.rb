require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    if @count == num_buckets
      resize!
    end
    self[num] << num
    @count += 1
  end

  def include?(key)
    num = key.hash
    self[num].include?(num)
  end

  def remove(key)
    num = key.hash
    self[num].delete(num)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        new_store[el % (num_buckets*2)] << el
      end
    end
    @store = new_store
  end
end
