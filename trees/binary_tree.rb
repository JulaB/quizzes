#!/usr/bin/env ruby
require '../queue/l_queue'

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

  def insert(item)
    node = Node.new(item)

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
end
