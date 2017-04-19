#!/usr/bin/env ruby
require_relative '../queue/l_queue'

class BinaryTree
  class Node
    attr_accessor :left, :right, :data

    def initialize(data, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
    end
  end

  def initialize(items = nil)
    @root = nil
    @queue = LQueue.new

    create_from_array(items)
  end

  def insert(node)
    node = Node.new(node) unless node.is_a?(BinaryTree::Node)

    @root ||= node
    unless @queue.empty?
      top = @queue.front

      unless top.left
        top.left = node
      else
        top.right = node unless top.right
      end

      @queue.dequeue if top.left && top.right
    end
    @queue.enqueue(node)

    self
  end

  def empty?
    @root.nil?
  end

  def to_preorder_a
    self.class.preorder(@root, [])
  end

  def to_inorder_a
    self.class.inorder(@root, [])
  end

  def to_postorder_a
    self.class.postorder(@root, [])
  end

  def to_level_a
    arr = []
    current = @root
    queue = LQueue.new

    while current
      arr << current.data
      queue.enqueue(current.left) if current.left
      queue.enqueue(current.right) if current.right

      data = queue.dequeue
      current = data ? data.value : nil
    end
    arr
  end

  def to_vertical_a
    return [] if empty?

    queue = LQueue.new
    h = {}
    min_l = 0
    max_l = 0

    queue.enqueue([0, @root])

    until queue.empty?
      level, node = queue.dequeue.value

      min_l = [min_l, level].min
      max_l = [max_l, level].max

      h[level] ||= []
      h[level] << node.data

      queue.enqueue([(level - 1), node.left]) if node.left
      queue.enqueue([(level + 1), node.right]) if node.right
    end

    self.class.merge_results(h, min_l, max_l)
  end

  def complete?
    return true if empty?

    queue = LQueue.new
    queue.enqueue(@root)
    last_level = false

    until queue.empty?
      node = queue.dequeue.value

      return false if node.right && !node.left
      return false if last_level && (node.left || node.right)

      last_level = true if !node.left && !node.right
      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right
    end
    true
  end

  private

  def create_from_array(items)
    return unless items && items.is_a?(Array)

    items.each { |item| insert(item) }
  end

  def self.preorder(node, arr)
    return arr unless node

    arr << node.data
    preorder(node.left, arr)
    preorder(node.right, arr)
    arr
  end

  def self.inorder(node, arr)
    return arr unless node
    inorder(node.left, arr)
    arr << node.data
    inorder(node.right, arr)
    arr
  end

  def self.postorder(node, arr)
    return arr unless node
    postorder(node.left, arr)
    postorder(node.right, arr)
    arr << node.data
    arr
  end

  def self.merge_results(h, min_l, max_l)
    arr = []
    min_l.upto(max_l) { |i| arr += h[i] if h[i] }

    arr
  end
end
