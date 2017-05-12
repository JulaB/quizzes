require_relative 'binary_tree'

KCounter = Struct.new(:val)

class BinaryTree
  def inorder_traversal
    self.class.inorder_traversal(@root)
  end

  def kth_smallest(k)
    self.class.kth_smallest(@root, KCounter.new(k))
  end

  def preorder_traversal
    return [] if @root.nil?

    stack = []
    stack << @root

    res = []

    while !stack.empty?
      node = stack.pop
      stack << node.right if node.right
      stack << node.left if node.left

      res << node.data
    end
    res
  end

  def postorder_traversal
    return [] if @root.nil?

    res = []
    stack = []
    stack << [@root, false]

    until stack.empty?
      current, visited = stack.pop
      if (!current.left && !current.right) || visited
        res << current.data
      else
        stack << [current, true]
      end

      if current.right && !visited
        stack << [current.right, false]
      end
      if current.left && !visited
        stack << [current.left, false]
      end
    end

    res
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
