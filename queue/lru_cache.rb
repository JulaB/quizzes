#!/usr/bin/env ruby

class LRUCache
  def initialize(capacity = 3)
    @deque = Deque.new(capacity)
    @hash = {}
  end

  def set(key, value)
    @deque.remove(@hash[key]) if @hash[key]
    if @deque.full?
      node = @deque.remove_rear
      @hash.delete(node.key) if node
    end

    @hash[key] = @deque.insert(key, value)
  end

  def get(key)
    if @hash[key]
      @deque.move_to_front(@hash[key])
      @hash[key].data
    end
  end

  def get_all
    @deque.to_h
  end

  private

  class Deque
    class Node
      attr_reader :key, :data
      attr_accessor :prev, :next

      def initialize(key, data)
        @key = key
        @data = data
        @prev = @next = nil
      end
    end

    def initialize(capacity = 3)
      @capacity = capacity
      @size = 0
      @head = @tail = nil
    end

    def full?
      @size == @capacity
    end

    def empty?
      @size == 0
    end

    def insert(key, value)
      return if full?
      node = Node.new(key, value)
      @head.prev = node if @head
      node.next = @head
      @head = node

      @tail = node unless @tail
      @size += 1

      node
    end

    def remove_rear
      remove(@tail)
    end

    def remove(node)
      return unless node
      return if empty?

      @size -= 1
      node.prev.next = node.next if node.prev
      @tail = @tail.prev if node == @tail
      @head = @head.next if node == @head

      node
    end

    def move_to_front(node)
      return if node == @head

      node.prev.next = node.next
      @tail = node.prev if node == @tail

      node.next = @head
      node.prev = nil
      @head = node
    end

    def to_h
      h = {}
      cur = @head
      while cur
        h[cur.key] = cur.data
        cur = cur.next
      end

      h
    end
  end
end
