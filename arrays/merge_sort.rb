#!/usr/bin/env ruby

class Array
  def merge_sort
    self.class.merge_sort_helper(self, 0, self.length)
  end

  private

  def self.merge_sort_helper(arr, from, to)
    return arr[from, 1] if from >= to

    mid = (from + to) / 2
    left = merge_sort_helper(arr, from, mid)
    right = merge_sort_helper(arr, mid + 1, to)
    merge_arr(left, right)
  end

  def self.merge_arr(left, right)
    res = []
    ind_l = ind_r = 0
    while ind_l < left.length || ind_r < right.length
      if left[ind_l] && (!right[ind_r] || left[ind_l] < right[ind_r])
        res << left[ind_l]
        ind_l += 1
      elsif right[ind_r]
        res << right[ind_r]
        ind_r += 1
      end
    end
    res
  end
end

