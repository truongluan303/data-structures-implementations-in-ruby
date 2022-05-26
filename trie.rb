class Trie

    def initialize
        @root = Node.new()
    end

    def insert(string)
        current = @root
        len = string.length

        string.each_char { |ch|
            if !current.key?(ch)
                current[ch] = Node.new()
            end
            current = current.children[ch]
        }
    end

    private

    class Node
        def initialize
            is_terminal = false
            children = {}
        end
    end

end