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

