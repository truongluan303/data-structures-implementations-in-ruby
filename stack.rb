class Stack

    def initialize()
        @arr = []
    end


    
    def push(value)
        @arr.push(value)
    end



    def pop()
        if is_empty()
            raise StandardError.new "Attempted to pop an empty stack"
        end
        return @arr.pop()
    end



    def peek()
        return @arr[-1]
    end



    def contains(value)
        return @arr.include? value
    end



    def size()
        return @arr.length
    end



    def is_empty()
        return @arr.length == 0
    end

end