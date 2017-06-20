# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'topological_sort'
require_relative 'graph'

def install_order(arr)
  ids = arr.map { |t| t[0] }
  max = ids.max
  vertices = []

  (1..max).each do |id|
    vertices << Vertex.new(id)
  end

  arr.each do |tuple|
    Edge.new(vertices[tuple[1]-1], vertices[tuple[0]-1])
  end

  order = topological_sort(vertices)
  order.map {|v| v.value}
end
