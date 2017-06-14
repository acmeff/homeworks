class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    map.with_index do |e, i|
      e = e.ord if e.is_a?(String)
      e = e.to_s.ord if e.is_a?(Symbol)
      e = e.hash if e.is_a?(Array)
      e.to_s(2).to_i ^ i.to_s(2).to_i
    end.reduce(5, :+)
  end
end

class String
  def hash
    arr_hash = split('').hash
    arr_hash.to_s(2).to_i ^ arr_hash.to_s(2).reverse.to_i

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr_hash = to_a.sort.flatten.hash
    arr_hash.to_s(2).to_i ^ arr_hash.to_s(2).reverse.to_i + length
  end
end
