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
end
