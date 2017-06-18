require_relative 'quick_sort.rb'

class Array

  #find the kth smallest element in O(n) time
  def quick_select(k)
    new_idx = 0
    until new_idx == k - 1
      if new_idx < k
        new_idx = QuickSort.partition(self, new_idx, length)
      else
        new_idx = QuickSort.partition(self, 0, new_idx)
      end
    end
    self[k-1]
  end

end


p [2,3,5,4,6].quick_select(2)
