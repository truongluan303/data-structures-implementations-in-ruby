class Queue

    def initialize()
        @size = 0
        @head = nil
        @tail = nil
    end



    def enqueue(value)
        new_node = Node.new(value)

        if @size == 0
            @head = new_node
            @tail = new_node 
        
        else
            @tail.link = new_node
            @tail = new_node
        end

        @size += 1
    end



    def dequeue()
        if is_empty()
            raise StandardError.new "Attempted to dequeue an empty queue"
        end
        result = @head.value
        @head = @head.link
        @size -= 1
        return result
    end



    def peek()
        if is_empty()
            raise StandardError.new "Attempted to peek an empty queue"
        end
        return @head.value
    end



    def contains(value)
        current = @head

        while current
            if current.value == value
                return true
            end
            current = current.link
        end

        return false
    end



    def is_empty()
        return @size == 0
    end



    def size
        @size
    end



    private

    class Node
        def initialize(value)
            @value = value
            @link = nil
        end

        def value=(value)
            @value = value
        end

        def link=(link)
            @link = link
        end

        def value
            @value
        end

        def link
            @link
        end
    end

end