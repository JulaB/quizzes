#!/usr/bin/env ruby
require_relative 'singly_llist'

# Reverse the nodes of a linked list in k groups
# Left-out nodes should remain if number of nodes is not multiple of k
class ReverseNode < SinglyLList
  def reverse_groups(k)
    return self if k <= 1

    n_head = Node.new(nil)
    n_head.next = @head
    from = n_head
    ind = 1
    cur = n_head.next

    while cur
      if ind == k
        from = self.class.reverse_group(from, cur.next)
        cur = from.next
        ind = 1
      end
      ind += 1
      cur = cur.next if cur
    end

    @head = n_head.next

    self
  end

  private

  def self.reverse_group(from, to)
    first = from.next
    cur = from.next
    prev = to

    while cur && cur != to
      nxt = cur.next
      cur.next = prev
      prev = cur
      cur = nxt
    end

    from.next = prev

    first
  end
end
