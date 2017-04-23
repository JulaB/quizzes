#!/usr/bin/env ruby

class BSTree
  class Node
    attr_accessor :left, :right, :parent, :data

    def initialize(data)
      @data = data
      @left = nil
      @right = nil
      @parent = nil
    end
  end

  def initialize
    @root = nil
  end

  def search(key)
    self.class.search_helper(@root, key)
  end

  def min
    self.class.min_helper(@root)
  end

  def max
    self.class.max_helper(@root)
  end

  def successor(node)
    return self.class.min_helper(node.right) if node.right

    cur = node.parent
    while cur && node == cur.right
      node = cur
      cur = cur.parent
    end
    cur
  end

  def predecessor(node)
    return self.class.max_helper(node.left) if node.left
    cur  = node.parent
    while cur && node == cur.left
      node = cur
      cur = cur.parent
    end
    cur
  end

  def insert(data)
    node = Node.new(data)
    p_node = nil
    cur = @root

    while cur
      p_node = cur
      if cur.data > data
        cur = cur.left
      else
        cur = cur.right
      end
    end

    node.parent = p_node
    if p_node
      if p_node.data > data
        p_node.left = node
      else
        p_node.right = node
      end
    else
      @root = node
    end
    self
  end

  def delete(node)
    return unless node
    cur_node = node
    if node.left && node.right
      cur_node = successor(node)
      node.data = cur_node.data
    end

    next_node = if cur_node.left
                  cur_node.left
                else
                  cur_node.right
                end

    if next_node
      next_node.parent = cur_node.parent
    end

    if cur_node.parent
      if cur_node.parent.left == cur_node
        cur_node.parent.left = next_node
      else
        cur_node.parent.right = next_node
      end
    else
      @root = next_node
    end
  end

  def build_from_sorted_a(arr = [])
    return @root unless arr.is_a?(Array)
    @root = self.class.build_from_sorted(arr, 0, arr.length - 1)
    self
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
        top.left.parent = top
      else
        while top && top.data < arr[nxt] && !stack.empty?
          item = stack.pop
          top = stack.last
        end
        if item
          item.right = node
          item.right.parent = item
        end
      end
      nxt += 1
      stack.push(node)
    end
    self
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

  def self.search_helper(node, key)
    return node if !node || node.data == key
    if key < node.data
      search_helper(node.left, key)
    else
      search_helper(node.right, key)
    end
  end

  def self.build_from_sorted(arr, from, to)
    return if from > to

    mid = (to + from) / 2
    node = Node.new(arr[mid])
    node.left = build_from_sorted(arr, from, mid - 1)
    node.left.parent = node if node.left

    node.right = build_from_sorted(arr, mid + 1, to)
    node.right.parent = node if node.right
    node
  end

  def self.min_helper(node)
    res = nil
    while node
      res = node
      node = node.left
    end

    res
  end

  def self.max_helper(node)
    res = nil

    while node
      res = node
      node = node.right
    end

    res
  end
end
