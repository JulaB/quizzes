#!/usr/bin/env ruby
require_relative 'min_heap'

class PriorityQueue
  extend Forwardable
  def_delegators :@heap, :size, :empty?
  def_delegator :@heap, :decrease_key, :decrease_priority
  def_delegator :@heap, :increase_key, :increase_priority

  def initialize
    @heap = MinHeap.new
  end

  def insert(data, priority)
    @heap.insert(Node.new(data, priority))
    self
  end

  def peek
    min = @heap.min
    min.data if min
  end

  def delete
    min = @heap.delete_min
    min.data if min
  end

  private

  class Node
    include Comparable
    attr_reader :data
    attr_accessor :priority

    def initialize(data, priority)
      @data = data
      @priority = priority
    end

    def <=>(other)
      priority <=> other.priority
    end

    def +(val)
      self.tap { |obj| obj.priority += val }
    end

    def -(val)
      self.tap { |obj| obj.priority -= val }
    end
  end
end
