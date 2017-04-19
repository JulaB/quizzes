#!/usr/bin/env ruby
require_relative 'min_heap'

class SArrays
  def initialize(arrs)
    @arrs = Array(arrs)
  end

  def merge
    heap = create_heap
    res = []
    until heap.empty?
      min = heap.delete_min
      res << min if min
    end
    res
  end

  class ArrContainer
    attr_reader :arr
    include Comparable

    def initialize(arr)
      @arr = Array(arr)
      @ind = 0
    end

    def first
      arr[@ind] unless arr.empty?
    end

    def next
      @ind += 1
      first
    end

    def empty?
      @ind >= arr.size
    end

    def <=>(other)
      return 1 unless first
      return -1 unless other.first
      first <=> other.first
    end
  end

  private

  class MHeap < MinHeap
    def min
      @store.first.first unless @store.empty?
    end

    def delete_min
      min_el = min
      top = @store.first
      top.next
      if top.empty?
        @size -= 1
        if @store[@size].empty?
          @size = 0
        else
          @store[0] = @store[@size]
        end
      end
      heapify_down(0)
      min_el
    end
  end

  def create_heap
    MHeap.new(transform_arrs)
  end

  def transform_arrs
    @arrs.map { |item| ArrContainer.new(item) }
  end
end
