require_relative 'binary_tree'

class CTree
  # Given a complete binary tree, count the number of nodes.
  def self.count_nodes(root)
    return 0 unless root
    left_h = 0
    right_h = 0

    cur = root
    while cur
      left_h += 1
      cur = cur.left
    end

    cur = root
    while cur
      right_h += 1
      cur = cur.right
    end

    res = 1

    if left_h == right_h
      return 2 ** left_h - 1
    else
      res += count_nodes(root.left) if root.left
      res += count_nodes(root.right) if root.right
    end
    res
  end
end
