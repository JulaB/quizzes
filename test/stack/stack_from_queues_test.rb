#!/usr/bin/env ruby
require_relative '../test_helper'
require 'stack/stack_from_queues'

describe StackFromQueues do
  let(:s) { StackFromQueues.new }

  describe '#empty?' do
    it 'returns true for new stack' do
      assert_equal true, s.empty?
    end

    it 'returns false for stack with elements' do
      s.push(1)
      assert_equal false, s.empty?
    end
  end

  describe '#push' do
    it 'adds element to stack' do
      assert_equal true, s.empty?
      s.push(1)
      assert_equal false, s.empty?
    end

    it 'returns itself after push' do
      assert_equal s.object_id, s.push(1).object_id
    end
  end

  describe '#peek' do
    it 'returns nil for empty stack' do
      assert_nil s.peek
    end

    it 'returns top element in stack' do
      s.push(1).push(2).push(3)
      s.pop

      assert_equal 2, s.peek
    end
  end

  describe '#pop' do
    it 'returns nil for empty stack' do
      assert_nil s.pop
    end

    it 'returns top element in stack' do
      s.push(3).push(2)
      assert_equal 2, s.pop
    end
  end
end
