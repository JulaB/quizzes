#!/usr/bin/env ruby

# Implement queue using linked list
class LQueue
  def initialize
    @head = @tail = nil
  end

  def empty?
    @head.nil?
  end

  def enqueue(value)
    node = Node.new(value)
    if empty?
      @head = @tail = node
    else
      @tail.next = node
      @tail = node
    end
    self
  end

  def dequeue
    return if empty?
    item = @head
    @head = @head.next
    @tail = nil unless @head

    item
  end

  def front
    return if empty?
    @head.value
  end

  def rear
    return if empty?
    @tail.value
  end

  private

  class Node
    attr_accessor :value, :next

    def initialize(value, next_node = nil)
      @value = value
      @next = next_node
    end
  end
end
