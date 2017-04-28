#!/usr/bin/env ruby
require_relative 'singly_llist'

# Check if singly linked list is palindrome
class SinglyLListP < SinglyLList
  def palindrome?
    reversed = SinglyLList.new

    current = @head

    while current
      reversed.insert(current.data) # reversing list while inserting to the top
      current = current.next
    end

    equal?(reversed)
  end

  def equal?(other)
    l1 = @head
    l2 = other.head
    while l1 && l2
      return false if l1.data != l2.data

      l1 = l1.next
      l2 = l2.next
    end
    true
  end

  def palindrome_inplace?
    return true if @head.nil?

    fast = @head
    slow = @head
    slow_prev = nil

    while fast && fast.next
      fast = fast.next.next
      slow_prev = slow
      slow = slow.next
    end

    slow = slow_prev if fast.nil?

    slow.next = reverse(slow.next)

    is_palindr = true

    l2 = slow.next
    l1 = @head

    while l2 && is_palindr
      is_palindr = (l1.val == l2.val)

      l1 = l1.next
      l2 = l2.next
    end

    slow.next = reverse(slow.next)

    return is_palindr
  end

  def reverse(current)
    prev = nil
    while current
      nxt = current.next
      current.next = prev
      prev = current
      current = nxt
    end
    prev
  end
end
