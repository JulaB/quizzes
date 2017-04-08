#!/usr/bin/env ruby

require '../queue/l_queue'

class StackFromQueues
  def initialize
    @q1 = LQueue.new
    @q2 = LQueue.new
  end

  def peek
    @q1.front
  end

  def empty?
    @q1.empty? && @q2.empty?
  end

  def push(value)
    @q2.enqueue(value)
    @q2.enqueue(@q1.dequeue.value) until @q1.empty?

    @q1, @q2 = @q2, @q1
    self
  end

  def pop
    item = @q1.dequeue
    item.value if item
  end
end
