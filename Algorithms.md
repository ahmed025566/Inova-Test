class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, next_node = nil)
    @val = val
    @next = next_node
  end
end

def middle_node(head)
  slow = head
  fast = head

  while fast != nil && fast.next != nil
    slow = slow.next
    fast = fast.next.next
  end

  return slow
end


Time Complexity: O(n)
Space Complexity: O(1)
