$LOAD_PATH << '.'
require 'queue'
require 'stack'
require 'bimap'
require 'multiset'
require 'linkedlist'
require 'binary_search_tree'
require "test/unit"


class TestDataStructures < Test::Unit::TestCase

    def test_linked_list
        llist = LinkedList.new
        (0..9).each do |i|
            llist.push_back(i)
        end
        (0..9).each do |i|
            llist.push_front(i)
        end

        assert_true(llist.contains(0))
        assert_true(llist.contains(5))
        assert_false(llist.contains(10))

        llist.remove(9)
        llist.remove(0)
        llist.remove(9)

        llist.pop_front
        llist.pop_back

        llist.pop(7)
        llist.pop
        llist.pop_front
        llist.pop_front
        llist.pop(llist.size - 1)
        llist.pop(5)

        res = [5, 4, 3, 2, 1, 2, 3, 4, 5]
        (0..(llist.size - 1)).each do |i|
            assert_equal(llist.get(i), res[i])
        end

        llist.clear
        assert_equal(llist.size, 0)
        assert_raise(StandardError) { llist.pop_front }
        assert_raise(StandardError) { llist.pop_back }
    end


    def test_queue
        q = Queue.new
        (0..10).each do |i|
            q.enqueue(i)
            assert_equal(q.size, i + 1)
            assert_equal(q.peek, 0)
        end
        assert_true(q.contains(5))
        assert_false(q.contains(15))

        num = 0
        until q.is_empty
            assert_equal(q.peek, num)
            assert_equal(q.peek, q.dequeue)
            num += 1
        end
        assert_true(q.is_empty)
        assert_equal(q.size, 0)
        assert_raise(StandardError) { q.peek }
        assert_raise(StandardError) { q.dequeue }

        (0..5).each do |i|
            q.enqueue(i)
        end
        assert_true(q.remove(0))
        assert_false(q.contains(0))
        assert_true(q.remove(3))
        assert_false(q.contains(3))
        assert_true(q.remove(5))
        assert_false(q.contains(5))
        assert_false(q.remove(11))
        q.clear
        assert_raise(StandardError) { q.remove(1) }
    end


    def test_stack
        stack = Stack.new
        (0..10).each do |i|
            stack.push(i)
        end
        assert_true(stack.contains(5))
        assert_false(stack.contains(15))

        size = 11
        until stack.is_empty
            assert_equal(stack.peek, size - 1)
            assert_equal(stack.peek, stack.pop)
            size -= 1
        end
        assert_true(stack.is_empty)
        assert_equal(stack.size, 0)
        assert_raise(StandardError) { stack.peek }
        assert_raise(StandardError) { stack.pop }
    end


    def test_multiset
        multiset = Multiset.new
        multiset.add(1, 5)
        multiset.add(1)
        multiset.add(2, 10)
        multiset.remove(2)
        multiset.remove(2, 5)

        assert_equal(multiset.size, 10)
        assert_equal(multiset.get_occurrences(1), 6)
        assert_equal(multiset.get_occurrences(2), 4)
        assert_equal(multiset.size, 10)
        assert_false(multiset.contains(3))
        assert_true(multiset.contains(2))
        assert_true(multiset.contains(1))

        assert_raise(ArgumentError) { multiset.add(0, -1) }
        assert_raise(ArgumentError) { multiset.remove(0, -1) }
    end


    def test_bimap
        bimap = Bimap.new
        count = 0
        ('a'..'z').each do |c|
            bimap.add(c, c.bytes)
            count += 1
        end
        assert_equal(bimap.size, count)
        ('a'..'z').each do |c|
            assert_true(bimap.contains(c))
            assert_true(bimap.contains(c.bytes))
            assert_equal(bimap.get(c), c.bytes)
            assert_equal(bimap.get(c.bytes), c)
        end
        assert_false(bimap.contains('~'))
        assert_false(bimap.contains(0))
        assert_false(bimap.contains('1'))

        bimap.remove('a')
        bimap.remove('b'.bytes)
        assert_false(bimap.contains('a'))
        assert_false(bimap.contains('a'.bytes))
        assert_false(bimap.contains('b'))
        assert_false(bimap.contains('b'.bytes))
        assert_raise(ArgumentError) { bimap.remove('1') }
    end


    # def test_bst
    #
    # end
end
