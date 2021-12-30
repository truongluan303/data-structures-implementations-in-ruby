$LOAD_PATH << '.'
require 'queue'
require 'stack'
require 'multiset'
require 'linkedlist'
require 'binary_search_tree'



def linked_list_test()
    passed = true
    llist = LinkedList.new

    (0..9).each do |i|
        llist.push_back(i)
    end

    (0..9).each do |i|
        llist.push_front(i)
    end

    if !llist.contains(0) or llist.contains(10) or !llist.contains(5)
        passed = false
    end

    llist.remove(9)
    llist.remove(0)
    llist.remove(9)

    llist.pop_front()
    llist.pop_back()

    llist.pop(7)
    llist.pop()
    llist.pop_front()
    llist.pop_front()
    llist.pop(llist.size - 1)
    llist.pop(5)


    res = [5, 4, 3, 2, 1, 2, 3, 4, 5]

    (0..(llist.size - 1)).each do |i|
        if llist.get(i) != res[i]
            passed = false
        end
    end


    # print result

    if passed
        puts 'P A S S'
    else
        puts 'F A I L'
    end
end




def queue_test()
    passed = true
    q = Queue.new

    (0..10).each do |i|
        q.enqueue(i)
    end

    if !q.contains(5) or q.contains(15)
        passed = false
    end

    num = 0
    while !q.is_empty()
        if q.peek() != num or q.peek() != q.dequeue()
            passed = false
            break
        end
        num += 1
    end

    if passed
        puts "P A S S"
    else
        puts "F A I L"
    end
end



def stack_test()
    passed = true
    stack = Stack.new

    (0..10).each do |i|
        stack.push(i)
    end
    
    if !stack.contains(5) or stack.contains(15)
        passed = false
    end
    
    size = 11
    while !stack.is_empty()
        if stack.peek() != (size - 1) or stack.peek() != stack.pop()
            passed = false
            break
        end
        size -= 1
    end

    if passed
        puts "P A S S"
    else
        puts "F A I L"
    end
end



def multiset_test()
    passed = true
    multiset = Multiset.new

    multiset.add(1, 5)
    multiset.add(1)
    multiset.add(2, 10)
    multiset.remove(2)
    multiset.remove(2, 5)

    if multiset.get_occurences(1) != 6 or multiset.get_occurences(2) != 4
        passed = false
    end
    if multiset.size != 10
        passed = false
    end
    if multiset.contains(3) or !multiset.contains(1) or !multiset.contains(2)
        passed = false
    end

    if passed
        puts "P A S S"
    else
        puts "F A I L"
    end
end



def binary_search_tree_test()
    
end




if __FILE__ == $0

    puts "\nTests Started...\n"

    puts "\nLINKED LIST TEST:\n"
    linked_list_test()

    puts "\nQUEUE TEST:\n"
    queue_test()

    puts "\nSTACK TEST:\n"
    stack_test()

    puts "\nMULTISET TEST:\n"
    multiset_test()

    puts "\nBINARY SEARCH TREE TEST:\n"
end