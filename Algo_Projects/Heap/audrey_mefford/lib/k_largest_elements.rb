require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new

  array[0...k].each { |el| heap.push(el)}

  array[k..-1].each do |el|
    if el > heap.peek
      heap.extract
      heap.push(el)
    end
  end
  heap.store
end
