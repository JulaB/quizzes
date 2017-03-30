#!/usr/bin/env ruby
require_relative 'binary_tree'

class BinaryTreeInv < BinaryTree
  def invert
    current = @root
    queue = LQueue.new

    while current do
      temp = current.left
      current.left = current.right
      current.right = temp

      queue.enqueue(current.left) if current.left
      queue.enqueue(current.right) if current.right

      data = queue.dequeue
      current = data ? data.value : nil
    end

    self
  end
end
