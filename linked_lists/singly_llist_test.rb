#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'

require_relative 'singly_llist'

describe SinglyLList do
  let(:l) { SinglyLList.new }

  before { l.insert(2).insert(3).insert(1) }

  it 'returns array representation of list' do
    assert_equal [1, 3, 2], l.to_a
  end

  describe '#empty?' do
    it 'is empty if list is new' do
      assert_equal true, SinglyLList.new.empty?
    end

    it 'is not empty for list with elements' do
      assert_equal false, l.empty?
    end
  end

  describe '#search' do
    it 'returns node with searched data' do
      node = l.search(3)
      assert_instance_of SinglyLList::Node, node
      assert_equal 3, node.data
    end

    it 'returns nil if cannot find data' do
      assert_nil l.search(4)
    end
  end


  describe '#delete' do
    it 'removes last node' do
      node = l.search(2)
      l.delete(node)

      assert_equal [1, 3], l.to_a
    end

    it 'removes first node' do
      node = l.search(1)
      l.delete(node)

      assert_equal [3, 2], l.to_a
    end

    it 'removes node in the middle' do
      node = l.search(3)
      l.delete(node)

      assert_equal [1, 2], l.to_a
    end
  end

  describe '#reverse' do
    it 'reverses singly linked list' do
      assert_equal [2, 3, 1], l.reverse.to_a
    end

    it 'deals with empty list' do
      assert_equal [], SinglyLList.new.reverse.to_a
    end

    it 'deals with one-elemented list' do
      l = SinglyLList.new.insert(3)
      assert_equal [3], l.reverse.to_a
    end
  end

  describe '#reverse_recursion' do
    it 'reverses singly linked list' do
      assert_equal [2, 3, 1], l.reverse_recursion.to_a
    end

    it 'deals with empty list' do
      assert_equal [], SinglyLList.new.reverse_recursion.to_a
    end

    it 'deals with one-elemented list' do
      l = SinglyLList.new.insert(3)
      assert_equal [3], l.reverse_recursion.to_a
    end
  end
end
