#!/usr/bin/env ruby

class HeapSort

  def initialize(arr)
    @store = arr
    @size = @store.size
    build
  end

  def sort
    n = store.size - 1
    n.downto(1) do |ind|
      store[ind], store[0] = store[0], store[ind]
      @size -= 1
      heapify(0)
    end
    @store
  end

  private

  attr_reader :store, :size

  def left(i)
    2 * i + 1
  end

  def right(i)
    2 * i + 2
  end

  def build
    n = store.length / 2 - 1
    n.downto(0) { |i| heapify(i) }
  end

  def heapify(ind)
    l = left(ind)
    r = right(ind)
    max = ind
    max = l if l < size && store[l] > store[ind]
    max = r if r < size && store[r] > store[max]
    unless max == ind
      store[ind], store[max] = store[max], store[ind]
      heapify(max)
    end
  end
end

