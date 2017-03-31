class Map
  def initialize
    @map = []
  end

  def assign(k, v)
    @map.each { |pair| pair [1] = v if pair[0] == k }
    @map << [k, v] unless @map.any? { |pair| pair[0] == k}
  end

  def lookup(k)
    @map.each { |pair| return pair[1] if pair[0] == k }
  end

  def remove(k)
    @map.each { |pair| @map.delete(pair) if pair[0] == k}
  end

  def show
    @map
  end
end
