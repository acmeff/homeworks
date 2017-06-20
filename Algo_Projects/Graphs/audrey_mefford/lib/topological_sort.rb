require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

#Kahn
def topological_sort(vertices)
  queue = []
  list = []

  vertices.each do |v|
    if v.in_edges.empty?
      queue << v
    end
  end


  while queue.length > 0
    curr = queue.shift
    list << curr

    (curr.out_edges.length-1).downto(0) do |i|
      if curr.out_edges[i].to_vertex.in_edges.length == 1
        queue << curr.out_edges[i].to_vertex
      end
      curr.out_edges[i].destroy!
    end
  end

  vertices.length == list.length ? list : []
end


#Tarjan
# def topological_sort(vertices)
#
#
# end
