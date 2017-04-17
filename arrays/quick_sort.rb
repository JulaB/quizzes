#!/usr/bin/env ruby

class Array
  def quick_sort
    self.class.quick_sort_h(self, 0, self.length - 1)
  end

  private

  def self.quick_sort_h(arr, from, to)
    if from < to
      index = partition(arr, from, to)
      quick_sort_h(arr, from, index - 1)
      quick_sort_h(arr, index, to)
    end
    arr
  end

  def self.partition(arr, from, to)
    pivot_ind = rand(from..to)
    pivot = arr[pivot_ind]
    arr[pivot_ind], arr[to] = arr[to], arr[pivot_ind]
    ind = from
    (from...to).each do |i|
      if arr[i] <= pivot
        arr[i], arr[ind] = arr[ind], arr[i]
        ind += 1
      end
    end
    arr[ind], arr[to] = arr[to], arr[ind]
    ind
  end
end


