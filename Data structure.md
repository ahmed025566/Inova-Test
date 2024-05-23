Pseudo Code for Queue DS Using Arrays


class Queue:
    def initialize(size):
        self.size = size
        self.array = [None] * size
        self.front = -1
        self.rear = -1
    end

    def isFull():
        return (self.rear + 1) % self.size == self.front
    end

    def isEmpty():
        return self.front == -1
    end

    def enqueue(item):
        if isFull():
            raise OverflowError("Queue is full")
        if isEmpty():
            self.front = 0
        self.rear = (self.rear + 1) % self.size
        self.array[self.rear] = item
    end

    def dequeue():
        if isEmpty():
            raise UnderflowError("Queue is empty")
        item = self.array[self.front]
        if self.front == self.rear:
            self.front = -1
            self.rear = -1
        else:
            self.front = (self.front + 1) % self.size
        return item
    end
end

Changes for Max Priority Queue : 

Max Priority Queue Implementation

To implement a Max Priority Queue, we need to ensure that the element with the highest priority is always at the front for dequeueing. This can be efficiently handled using a binary max heap structure. Here’s a pseudo code to modify the basic queue implementation to a max priority queue using a heap:


class MaxPriorityQueue:
    def initialize(size):
        self.size = size
        self.heap = [None] * size
        self.currentSize = 0
    end

    def isFull():
        return self.currentSize == self.size
    end

    def isEmpty():
        return self.currentSize == 0
    emd

    def enqueue(item, priority):
        if isFull():
            raise OverflowError("Queue is full")
        self.currentSize += 1
        self.heap[self.currentSize - 1] = (priority, item)
        self._heapifyUp(self.currentSize - 1)
    end

    def dequeue():
        if isEmpty():
            raise UnderflowError("Queue is empty")
        item = self.heap[0]
        self.heap[0] = self.heap[self.currentSize - 1]
        self.currentSize -= 1
        self._heapifyDown(0)
        return item[1]
    end

    def _heapifyUp(index):
        parent = (index - 1) // 2
        if index > 0 and self.heap[index][0] > self.heap[parent][0]:
            self.heap[index], self.heap[parent] = self.heap[parent], self.heap[index]
            self._heapifyUp(parent)
    end

    def _heapifyDown(index):
        leftChild = 2 * index + 1
        rightChild = 2 * index + 2
        largest = index
        if leftChild < self.currentSize and self.heap[leftChild][0] > self.heap[largest][0]:
            largest = leftChild
        if rightChild < self.currentSize and self.heap[rightChild][0] > self.heap[largest][0]:
            largest = rightChild
        if largest != index:
            self.heap[index], self.heap[largest] = self.heap[largest], self.heap[index]
            self._heapifyDown(largest)
    end
end


Time Complexity for Max Priority Queue:

Enqueue Operation: O(log n)
Dequeue Operation: O(log n)

Explanation of Changes:

Data Structure: Replace the simple array with a binary max heap to maintain the order of elements based on their priority.

Enqueue Operation:
Add the new element at the end of the heap.
Perform _heapifyUp to maintain the max-heap property.

Dequeue Operation:
Remove the root (which has the maximum priority).
Replace the root with the last element in the heap.
Perform _heapifyDown to maintain the max-heap property.