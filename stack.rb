class Stack

    def initialize
        @arr = []
    end

    def push(value)
        @arr.push(value)
    end

    def pop
        if is_empty
            raise StandardError.new "Attempted to pop an empty stack"
        end
        @arr.pop
    end

    def peek
        if is_empty
            raise StandardError.new "Attempted to peek an empty stack"
        end
        @arr[-1]
    end

    def contains(value)
        @arr.include? value
    end

    def size
        @arr.length
    end

    def is_empty
        @arr.length == 0
    end

end
