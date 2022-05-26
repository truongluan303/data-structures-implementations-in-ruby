class Heap

    def initialize(is_min)
        @arr = []
        @is_min = is_min
    end

    def insert(value)
        @arr.push(value)

        if @arr.length == 1
            return
        end

        size = @arr.length - 1
        for i in 0..size do
            heapify(i)
        end
    end

    def is_empty
        return @size == 0
    end

    def size
        @arr.length
    end

    private

    def heapify(index)
        target = index
        left_idx = 2 * index + 1
        right_idx = 2 * index + 2

        left_child = @arr[left_idx]
        right_child = @arr[right_idx]

        if @is_min
            if left_child < @arr[target]
                target = left_idx
            end
            if right_child < @arr[target]
                target = right_idx
            end
        else
            if left_child > @arr[target]
                target = left_idx
            end
            if right_child > @arr[target]:
                target = right_idx
            end
        end
        
        temp = @arr[idx]
        @arr[idx] = @arr[target]
        @arr[target] = temp
    end

end