require_relative 'binary_tree'

KCounter = Struct.new(:val)

class BinaryTree
  def inorder_traversal
    self.class.inorder_traversal(@root)
  end

  def kth_smallest(k)
    self.class.kth_smallest(@root, KCounter.new(k))
  end

  private

  def self.kth_smallest(root, k)
    return if root.nil?

    smallest = kth_smallest(root.left, k) if root.left

    k.val -= 1
    return root.data if k.val.zero? && !smallest

    smallest = kth_smallest(root.right, k) if root.right && !smallest
    smallest
  end

  def self.inorder_traversal(root)
    return [] if root.nil?

    stack = []
    current = root
    res = []

    while current || !stack.empty?
      while current
        stack << current
        current = current.left
      end
      unless stack.empty?
        popped = stack.pop
        res << popped.data
        current = popped.right
      end
    end
    res
  end
end
