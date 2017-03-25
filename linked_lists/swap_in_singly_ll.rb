#!/usr/bin/env ruby
require_relative 'singly_llist'

# Swap elements pairwise in singly linked list
class SwapInSinglyLL < SinglyLList

  def swap
    current = @head

    while current && current.next
      temp = current.next.data
      current.next.data = current.data
      current.data = temp

      current = current.next.next
    end

    self
  end
end
