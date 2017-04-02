#!/usr/bin/env ruby

class BSTree
  class Node
    attr_accessor :left, :right, :data

    def initialize(data)
      @data = data
      @left = nil
      @right = nil
    end
  end

  def initialize
    @root = nil
  end

  def build_from_sorted_a(arr = [])
    return @root unless arr.is_a?(Array)
    @root = self.class.build_from_sorted(arr, 0, arr.length - 1)
  end

  def build_from_preorder_a(arr = [])
    return if arr.empty?

    node = Node.new(arr[0])
    @root = node
    stack = []
    stack.push(node)
    len = arr.size
    nxt = 1

    while nxt < len
      node = Node.new(arr[nxt])
      top = stack.last
      if top && top.data > arr[nxt]
        top.left = node
      else
        while top && top.data < arr[nxt] && !stack.empty?
          item = stack.pop
          top = stack.last
        end
        item.right = node if item
      end
      nxt += 1
      stack.push(node)
    end

  end

  def empty?
    @root.nil?
  end

  def to_inorder_a
    stack = []
    arr = []
    cur = @root
    while cur || !stack.empty?
      if cur
        stack.push(cur)
        cur = cur.left
      else
        node = stack.pop
        arr << node.data
        cur = node.right
      end
    end

    arr
  end

  private

  def self.build_from_sorted(arr, from, to)
    return if from > to

    mid = (to + from) / 2
    node = Node.new(arr[mid])
    node.left = build_from_sorted(arr, from, mid - 1)
    node.right = build_from_sorted(arr, mid + 1, to)
    node
  end
end
