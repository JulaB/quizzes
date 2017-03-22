#!/usr/bin/env ruby
# Stack implementation using array
class Stack
  def initialize
    @store = []
    @top = -1
  end

  def empty?
    @top == -1
  end

  def size
    @top + 1 # stack index starts from 0
  end

  def push(item)
    @top += 1
    @store[@top] = item
    self
  end

  def pop
    return nil if empty?
    popped = @store.delete_at(@top)
    @top -= 1
    popped
  end

  def peek
    empty? ? nil : @store[@top]
  end
end
