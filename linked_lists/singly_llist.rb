#!/usr/bin/env ruby

# Singly linked list
class SinglyLList
  attr_reader :head

  class Node
    attr_accessor :data, :next

    def initialize(data, next_node = nil)
      @data = data
      @next = next_node
    end
  end

  def initialize
    @head = nil
  end

  def empty?
    @head.nil?
  end

  def insert(node)
    node = Node.new(node) unless node.is_a?(Node)

    node.next = @head
    @head = node
    self
  end

  def delete(node)
    return if empty? || node.nil?

    if @head == node
      @head = node.next
    else
      prev = @head
      prev = prev.next while prev && prev.next != node
      prev.next = node.next if prev
    end
  end

  def search(data)
    current = @head
    while current
      break if current.data == data
      current = current.next
    end

    current
  end

  def reverse
    prev = nil
    current = @head

    while current
      nxt = current.next
      current.next = prev
      prev = current
      current = nxt
    end

    @head = prev
    self
  end

  def to_a
    res = []
    current = @head

    while current
      res << current.data
      current = current.next
    end

    res
  end

  def reverse_recursion
    @head = self.class.reverse_nodes(@head)
    self
  end

  private

  def self.reverse_nodes(node)
    return unless node
    return node unless node.next

    prev = node
    node = reverse_nodes(node.next)
    prev.next.next = prev
    prev.next = nil
    node
  end
end
