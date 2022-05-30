require_relative './node'

class LinkedList
    attr_accessor :head 

    def initialize
        @head = nil
    end

    # LinkedList#prepend(node): adds a node to the beginning of the list (the head)
    def prepend(node)
        # Add element to the beginning of the list if the list is empty
        node.next_node = head
        # Add element to the beginning of the list when there are multiple elements in the list
        self.head = node
    end

    # LinkedList#append(node): adds a node to the end of the list (feel free to reuse/modify the code from the previous lesson)
    def append(node)
        return prepend(node) unless head
        # Traverse the list to find the last node
        last_node = head
        while last_node.next_node 
            last_node = last_node.next_node
        end
        # and add the node to the end 
        last_node.next_node = node
    end

    # LinkedList#delete_head: delete the head node
    def delete_head
        # when there are no elements in the list does not delete any elements
        return unless head
        # when there is one element in the list removes the node at the beginning of the list
        # when there are multiple element in the list removes the node at the beginning of the list
        self.head = self.head.next_node
    end

    # LinkedList#delete_tail: removes the node at the end of the list
    def delete_tail
        # when there are no elements in the list does not delete any elements
        return unless head
        # when there is one element in the list removes the node at the end of the list
        return delete_head if head.next_node.nil?
        # when there are multiple elements in the list removes the node at the end of the list
        curr = head
        prev = nil
        while curr.next_node
            prev = curr
            curr = curr.next_node
        end

        prev.next_node = nil
    end

    # LinkedList#add_after(index, node): adds a node after the given index of the linked list
    def add_after(index, node)
        # with an index in the middle of the list adds a node in the middle of the linked list
        # with an index at the end of the list adds a node to the end of the linked list
        return prepend(node) if index == 0

        curr_index = 0
        curr = head
        while curr_index < index
            curr_index += 1
            curr = curr.next_node
        end
        if curr
            node.next_node = curr.next_node
            curr.next_node = node
        else
            append(node)
        end
    end

    # LinkedList#search(value): finds a node with the given value within the list
    def search(value)
        # finds a node within the list
        node = head
        while node
            return node if node.data == value
            node = node.next_node
        end
        nil
    end
end
