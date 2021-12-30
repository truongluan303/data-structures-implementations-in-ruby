class Multiset

    def initialize()
        @size = 0
        @bag = Hash.new
    end



    def add(value, occurences = 1)
        if occurences < 1
            raise ArgumentError.new "Occurences must be positive"
        end

        if !@bag.key?(value)
            @bag[value] = 0
        end

        @bag[value] += occurences
        @size += occurences
    end



    def remove(value, occurences = 1)
        if occurences < 1
            raise ArgumentError.new "Occurences must be positive"
        end

        if !@bag.key?(value)
            return false
        end

        @bag[value] -= occurences
        @size -= occurences

        if @bag[value] <= 0
            @bag.delete(value)
        end
        return true
    end



    def contains(value)
        return @bag.key?(value)
    end



    def get_occurences(value)
        if !contains(value)
            return 0
        end
        return @bag[value]
    end



    def size
        @size
    end

end