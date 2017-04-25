require_relative 'binary_tree'

class Converter
  # Given a Binary Tree, convert it to a Doubly Linked List (In-Place).
  def self.bt2dll(root)
    bt2dll_h(root, nil)
  end

  # Given a Binary Tree, convert it to a Singly Linked List (In-Place).
  def self.bt2sll(root)
    bt2sll_h(root, nil)
  end

  private

  def self.bt2dll_h(node, head)
    head = bt2dll_h(node.right, head) if node && node.right

    node.right = head if node
    head.left = node if head
    head = node

    bt2dll_h(node.left, head) if node && node.left

    head
  end

  def self.bt2sll_h(node, prev)
    prev = bt2sll_h(node.right, prev) if node && node.right
    prev = bt2sll_h(node.left, prev) if node && node.left

    if node
      node.left = nil
      node.right = prev
    end

    node
  end
end
