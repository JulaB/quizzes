#!/usr/bin/env ruby

# Circular queue using array
class AQueue
  attr_reader :size

  def initialize(max_size)
    raise ArgumentError, 'Invalid queue capacity' unless max_size > 0

    @store = Array.new(max_size)

    @max_size = max_size
    @size = 0
    @head = 0
    @tail = @max_size - 1
  end

  def empty?
    size.zero?
  end

  def full?
    @size == @max_size
  end

  def enqueue(item)
    return self if full?

    @tail = (@tail + 1) % @max_size
    @store[@tail] = item
    @size += 1
    self
  end

  def dequeue
    return if empty?

    item = @store[@head]
    @store[@head] = nil

    @size -= 1
    @head = (@head + 1) % @max_size
    item
  end

  def front
    empty? ? nil : @store[@head]
  end

  def rear
    empty? ? nil : @store[@tail]
  end
end
