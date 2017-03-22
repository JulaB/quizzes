#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'stack'

describe Stack do
  describe '#empty?' do
    it 'returns true if stack is new' do
      assert_equal true, Stack.new.empty?
    end

    it 'returns false if stack contains elements' do
      assert_equal false, Stack.new.push(1).empty?
    end
  end

  describe '#size' do
    it 'returns 0 if stack is new' do
      assert_equal 0, Stack.new.size
    end

    it 'returns stack size if stack contains elements' do
      s = Stack.new
      s.push(1).push(2).push(3)
      s.pop

      assert_equal 2, s.size
    end
  end

  describe '#peek' do
    it 'returns nil for empty stack' do
      assert_nil Stack.new.peek
    end

    it 'returns top element int stack' do
      s = Stack.new
      s.push(1).push(2).push(3)
      s.pop

      assert_equal 2, s.peek
    end
  end

  describe '#push' do
    it 'pushes item to stack' do
      s = Stack.new.push(3)
      assert_equal 3, s.peek
    end

    it 'returns itself after push' do
      s = Stack.new
      id = s.object_id
      assert_equal id, s.push(3).object_id
    end
  end

  describe '#pop' do
    it 'returns nil if stack is empty' do
      assert_nil Stack.new.pop
    end

    it 'returns top element' do
      s = Stack.new
      s.push(3).push(2)
      assert_equal 2, s.pop
    end
  end
end
