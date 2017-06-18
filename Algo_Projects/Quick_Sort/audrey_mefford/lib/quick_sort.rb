class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array[0]
    left = []
    right = []
    mid = []

    array.each do |el|
      if el < pivot
        left << el
      elsif el > pivot
        right << el
      else
        mid << el
      end
    end

    QuickSort.sort1(left) + mid + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length-1, &prc)
    return array if length <= start

    new_pivot_idx = QuickSort.partition(array, start, length, &prc)

    QuickSort.sort2!(array, start, new_pivot_idx-1, &prc)
    QuickSort.sort2!(array, new_pivot_idx+1, length, &prc)

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{|x,y| x <=> y}
    tracker = start
    length = array.length - 1 if start != 0
    (start+1..length).each do |i|
      if prc.call(array[i], array[start]) == -1
        tracker += 1
        array[i], array[tracker] = array[tracker], array[i]
      end
    end

    array[start], array[tracker] = array[tracker], array[start]

    tracker
  end
end

class Array

  #find the kth smallest element in O(n) time
  def quick_select(k)
    new_idx = 0
    until new_idx == k - 1
      if new_idx < k - 1
        new_idx = QuickSort.partition(self, new_idx + 1, length-new_idx)
      else
        new_idx = QuickSort.partition(self, 0, new_idx - 1)
      end
    end
    self[k-1]
  end

end


p [2,3,5,4,6,1,0].quick_select(2)
