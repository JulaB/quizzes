require_relative 'binary_tree'

class BinaryTree
  def inorder_traversal
    self.class.inorder_traversal(@root)
  end

  private

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

