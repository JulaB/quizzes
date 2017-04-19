#!/usr/bin/env ruby

class MinHeap
  attr_reader :size
  def initialize(arr = [])
    @store = []
    @size = 0
    build(arr)
  end

  def empty?
    @size.zero?
  end

  def insert(el)
    @store[@size] = el
    @size += 1
    heapify_up(@size - 1)
    self
  end

  def min
    @store.first unless empty?
  end

  def delete_min
    return if empty?
    min_el = min
    @size -= 1
    @store[0] = @store[@size]
    heapify_down(0)
    min_el
  end

  def decrease_key(i, val)
    return if i >= @size
    @store[i] -= val
    heapify_up(i)
  end

  def increase_key(i, val)
    return if i >= @size
    @store[i] += val
    heapify_down(i)
  end

  def to_a
    empty? ? [] : @store[0...@size]
  end

  private

  def left(i)
    2 * i + 1
  end

  def right(i)
    2 * i + 2
  end

  def parent(i)
    (i - 1) / 2
  end

  def heapify_up(i)
    return if i.zero? || i >= @size
    p = parent(i)
    if @store[p] > @store[i]
      @store[p], @store[i] = @store[i], @store[p]
      heapify_up(p)
    end
  end

  def heapify_down(i)
    l = left(i)
    r = right(i)

    min = i
    min = l if l < @size && @store[l] < @store[min]
    min = r if r < @size && @store[r] < @store[min]

    unless min == i
      @store[i], @store[min] = @store[min], @store[i]
      heapify_down(min)
    end
  end

  def build(arr)
    return unless arr.is_a?(Array)
    @store = arr
    @size = arr.size
    n = @size / 2 - 1
    n.downto(0) { |i| heapify_down(i) }
  end
end
