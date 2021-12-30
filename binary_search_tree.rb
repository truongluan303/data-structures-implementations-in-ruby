$LOAD_PATH << '.'
require 'queue'


class BinarySearchTree

    def initialize()
        @root = nil
        @size = 0
    end



    def add(value)
        new_node = Node.new(value)
        
        if !@root
            @root = new_node
        
        else
            current = @root

            while true
                if value <= current.value
                    if !current.left
                        current.left = new_node
                        break
                    end
                    current = current.left
                else
                    if !current.right
                        current.right = new_node
                        break
                    end
                    current = current.right
                end
            end
        end

        @size += 1
    end



    def contains(value)
        current = @root
        while current
            if value < current.value
                current = current.left
            elsif value > current.value
                current = current.right
            else
                return true
            end
        end
        return false
    end



    def remove(value)

    end



    def level_order_traversal()
        result = []
        q = Queue.new
        q.enqueue(@root)

        while !q.is_empty()
            size = q.size
            level = []

            for i in (0..(size - 1))
                current = q.dequeue()
                if current
                    level.push(current.value)
                    q.enqueue(current.left)
                    q.enqueue(current.right)
                else
                    level.push(nil)
                end
            end

            allnull = true
            level.each do |val|
                if val
                    allnull = false
                end
            end
            if !allnull
                result.push(level)
            end
        end
        return result
    end



    def preorder_traversal()
        result = []
        preorder_helper(@root, result)
        return result
    end


    
    def inorder_traversal()
        result = []
        inorder_helper(@root, result)
        return result
    end



    def postorder_traversal()
        result = []
        postorder_helper(@root, result)
        return result
    end



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
    end
end




bst = BinarySearchTree.new

bst.add(5)
bst.add(3)
bst.add(7)
bst.add(2)
bst.add(4)
bst.add(0)
bst.add(9)


print "\nPreorder:\t"
print bst.preorder_traversal()

print "\nInorder:\t"
print bst.inorder_traversal()

print "\nPostorder:\t"
print bst.postorder_traversal()

print "\nLevel order:\t"
print bst.level_order_traversal()