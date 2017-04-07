class LRUCache
  attr_reader :arr, :n
  def initialize(n)
    @arr = Array.new
    @n = n
  end

  def count
    @arr.count { |el| el }
  end

  def add(el)
    if include?(el)
      @arr.push(@arr.delete(el))
    elsif count == @n
      remove
      @arr.push(el)
    else
      @arr.push(el)
    end

  end

  def show
    @arr.dup
  end

  private

  def include?(el)
    @arr.include?(el)
  end

  def remove
    @arr.shift
  end

end
