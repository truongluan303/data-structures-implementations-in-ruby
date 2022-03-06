class Bimap

    def initialize
        @size = 0
        @firstmap = Hash.new
        @secondmap = Hash.new
    end


    def add(value1, value2)
        @firstmap[value1] = value2
        @secondmap[value2] = value1
        @size += 1
    end


    def contains(value)
        @firstmap.key?(value) or @secondmap.key?(value)
    end


    def remove(value)
        if @firstmap.key?(value)
            @firstmap.delete(value)
        elsif @secondmap.key?(value)
            @secondmap.delete(value)
        else
            raise ArgumentError.new "Value not found"
        end
        @size -= 1
    end


    def get(key)
        return @firstmap[key] if @firstmap.key?(key)
        return @secondmap[key] if @secondmap.key?(key)
        nil
    end


    def size
        @size
    end

end