$LOAD_PATH << '.'
require 'queue'


class BinarySearchTree

    def initialize
        @root = nil
        @size = 0
        @height = 0
    end


    def add(value)
        new_node = Node.new(value)
        current_level = 0
        if !@root
            @root = new_node
        else
            current = @root

            while true
                if value < current.value
                    unless current.left
                        current.left = new_node
                        break
                    end
                    current = current.left
                elsif value > current.value
                    unless current.right
                        current.right = new_node
                        break
                    end
                    current = current.right
                else
                    return false
                end
                current_level += 1
            end
        end
        @size += 1
        @height = current_level if current_level > @height
        true
    end


    def contains(value)
        if get_node(value)
            return true
        end
        false
    end


    def remove(value)
        found = false       # if the node to be removed exists
        parent = nil        # parent of the node to be removed
        is_left = nil       # if the node to be removed is a left child
        current = @root     # the node to be removed

        # loop to find the node to be removed
        while current
            if value < current.value
                parent = current
                is_left = true
                current = current.left
            elsif value > current.value
                parent = current
                is_left = false
                current = current.right
            else
                found = true
                break
            end
        end
        # return false if the node to removed does not exist
        if !found
            return false
        end
        # if the node to be removed is a leaf node, simply delete it
        if current.is_leaf
            if is_left
                parent.left = nil
            else
                parent.right = nil
            end
            return true
        end
        #TODO: still have edge cases not handled
        # replace the node to be removed with its predecessor
        current.value = remove_predecessor(current)
        true
    end


    def level_order_traversal
        result = []
        q = Queue.new
        q.enqueue(@root)

        until q.is_empty
            size = q.size
            level = []
            (0..(size - 1)).each { |i|
                current = q.dequeue
                if current
                    level.push(current.value)
                    q.enqueue(current.left)
                    q.enqueue(current.right)
                else
                    level.push(nil)
                end
            }
            all_null = true
            level.each do |val|
                if val
                    all_null = false
                end
            end
            unless all_null
                result.push(level)
            end
        end
        result
    end


    def preorder_traversal
        result = []
        preorder_helper(@root, result)
        result
    end

    
    def inorder_traversal
        result = []
        inorder_helper(@root, result)
        result
    end


    def postorder_traversal
        result = []
        postorder_helper(@root, result)
        result
    end


    def size
        @size
    end


    def height
        @height
    end

    
    # private fields
    private

    def preorder_helper(root, result)
        if root
            result.push(root.value)
            preorder_helper(root.left, result)
            preorder_helper(root.right, result)
        end
    end


    def inorder_helper(root, result)
        if root
            inorder_helper(root.left, result)
            result.push(root.value)
            inorder_helper(root.right, result)
        end
    end


    def postorder_helper(root, result)
        if root
            postorder_helper(root.left, result)
            postorder_helper(root.right, result)
            result.push(root.value)
        end
    end

    
    def get_node(value)
        current = @root
        while current
            if value < current.value
                current = current.left
            elsif value > current.value
                current = current.right
            else
                return current
            end
        end
        nil
    end


    def remove_predecessor(root)
        parent = root.left
        current = parent.right
        if !current
            root.left = nil
            return parent.value
        end
        while current.right
            parent = current
            current = current.right
        end
        parent.right = nil
        return current.value
    end


    class Node
        def initialize(value)
            @value = value
            @left = nil
            @right = nil
        end

        def value
            @value
        end

        def left
            @left
        end

        def right
            @right
        end

        def value=(value)
            @value = value
        end

        def left=(left)
            @left = left
        end

        def right=(right)
            @right = right
        end

        def is_leaf
            if !@left and !@right
                return true
            end
            false
        end
    end
end


bst = BinarySearchTree.new

vals = [5, 3, 7, 2, 4, 0, 9, 8]
vals.each { |x| (bst.add(x)) }

bst.remove(3)
print bst.level_order_traversal