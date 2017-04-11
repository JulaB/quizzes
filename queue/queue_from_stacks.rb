#!/usr/bin/env ruby
require_relative '../stack/stack'

# Implement queue using two stacks
class QueueFromStacks
  def initialize
    @s1 = Stack.new
    @s2 = Stack.new
  end

  def empty?
    @s1.empty? && @s2.empty?
  end

  def enqueue(value)
    @s1.push(value)
    self
  end

  def dequeue
    move_to_s2
    @s2.pop
  end

  def front
    move_to_s2
    @s2.peek
  end

  private

  def move_to_s2
    return unless @s2.empty?
    @s2.push(@s1.pop) until @s1.empty?
  end
end
