require_relative 'singly_llist'

class SinglyLList
  # Remove kth Node From End of List
  def remove_nth_from_end(n)
    return if @head.nil?

    fast = @head
    slow = @head

    n.times do
      return if fast.nil?
      fast = fast.next
    end

    if fast
      while fast.next
        slow = slow.next
        fast = fast.next
      end

      slow.next = slow.next.next
    else
      @head = @head.next
    end
  end

  # 328. Odd Even Linked List
  # Given a singly linked list, group all odd nodes together followed by the even nodes.
  def odd_even_list
    return @head if @head.nil?

    odd = @head
    even = odd.next

    while even && even.next
      head2 = odd.next
      odd.next = even.next
      even.next = even.next.next
      odd.next.next = head2

      odd = odd.next
      even = even.next
    end
    @head
  end
end
