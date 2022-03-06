class Multiset

    def initialize
        @size = 0
        @bag = Hash.new
    end



    def add(value, occurrences = 1)
        if occurrences < 1
            raise ArgumentError.new "occurrences must be positive"
        end
        unless @bag.key?(value)
            @bag[value] = 0
        end
        @bag[value] += occurrences
        @size += occurrences
    end



    def remove(value, occurrences = 1)
        if occurrences < 1
            raise ArgumentError.new "occurrences must be positive"
        end
        unless @bag.key?(value)
            return false
        end
        @bag[value] -= occurrences
        @size -= occurrences
        if @bag[value] <= 0
            @bag.delete(value)
        end
        true
    end



    def contains(value)
        @bag.key?(value)
    end



    def get_occurrences(value)
        unless contains(value)
            return 0
        end
        @bag[value]
    end



    def size
        @size
    end

end