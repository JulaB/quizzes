#!/usr/bin/env ruby
require_relative 'min_heap'

# Connect n ropes into one rope with minimum cost. Cost 2 ropes is equal to sum of their length
class Ropes
  def initialize(sizes)
    @heap = MinHeap.new(sizes)
  end

  def min_cost
    cost = 0
    until @heap.size == 1
      new_rope_size = @heap.delete_min + @heap.delete_min
      @heap.insert(new_rope_size)

      cost += new_rope_size
    end
    cost
  end
end
