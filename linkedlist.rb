class LinkedList

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end


    def push_front(value)
        new_node = Node.new(value)
        if @size == 0
            @head = new_node
            @tail = new_node
        else
            new_node.link = @head
            @head = new_node
        end
        @size += 1
    end


    def push_back(value)
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


    def get(idx = -1)
        if idx == -1
            idx = @size - 1
        end
        current = @head
        (0..(idx - 1)).each do
            current = current.link
        end
        current.value
    end


    def pop_front
        if @size == 0
            raise StandardError.new "Attempted to pop an empty list"
        end
        result = @head.value
        @head = @head.link
        @size -= 1
        result
    end


    def pop_back
        if @size == 0
            raise StandardError.new "Attempted to pop an empty list"
        end
        result = @tail.value
        current = @head
        (0..(@size - 2)).each do
            current = current.link
        end
        current.link = nil
        @tail = current
        @size -= 1
        result
    end


    def pop(idx = -1)
        if idx == -1
            return pop_back
        elsif idx == 0
            return pop_front
        elsif idx < 0 or idx >= @size
            raise StandardError.new "Index out of range"
        end
        current = @head
        (0..(idx - 2)).each do
            current = current.link
        end
        result = current.link
        current.link = current.link.link
        @size -= 1
        result
    end


    def remove(value)
        if @head.value == value
            pop_front
            return false
        end
        prev = @head
        current = @head.link
        while current
            if current.value == value
                prev.link = current.link
                @size -= 1
                return true
            end
            prev = current
            current = current.link
        end
        false
    end


    def contains(value)
        current = @head
        while current
            if current.value == value
                return true
            end
            current = current.link
        end
        false
    end


    def clear
        @head = nil
        @tail = nil
        @size = 0
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