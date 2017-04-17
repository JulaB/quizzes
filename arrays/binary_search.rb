#!/usr/bin/env ruby

class Array
  def binary_search(key)
    from = 0
    to = self.length - 1

    while from <= to
      mid = (from + to) / 2
      return mid if self[mid] == key
      if self[mid] > key
        to = mid - 1
      else
        from = mid + 1
      end
    end
    nil
  end
end
