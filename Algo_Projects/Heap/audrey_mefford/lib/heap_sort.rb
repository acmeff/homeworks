require_relative "heap"

class Array
  def heap_sort!
    marker = 1
    until marker == length
      parent_idx = BinaryMinHeap.parent_index(marker)
      child_idx = marker
      until child_idx == 0 || self[parent_idx] > self[child_idx]
        self[parent_idx], self[child_idx] = self[child_idx], self[parent_idx]
        child_idx = parent_idx
        parent_idx = BinaryMinHeap.parent_index(child_idx) unless child_idx == 0
      end
      marker += 1
    end

    marker = length - 1
    until marker == 0
      self[0], self[marker] = self[marker], self[0]
      marker -= 1
      prc = Proc.new{|x, y| y <=> x}
      self[0..marker] = BinaryMinHeap.heapify_down(self[0..marker], 0, &prc)
    end
  end
end
