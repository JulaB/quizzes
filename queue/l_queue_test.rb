#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'l_queue'

describe LQueue do
  let(:q) { LQueue.new }

  describe '#empty?' do
    it 'returns true for new queue' do
      assert_equal true, q.empty?
    end

    it 'returns false for queue with elements' do
      q.enqueue(4)
      assert_equal false, q.empty?
    end
  end

  describe '#enqueue' do
    it 'adds element to empty queue' do
      assert_equal true, q.empty?

      q.enqueue(4)
      assert_equal 4, q.rear
      assert_equal 4, q.front
    end

    it 'adds element to non-empty queue' do
      q.enqueue(4).enqueue(5)

      assert_equal 4, q.front
      assert_equal 5, q.rear
    end
  end

  describe '#dequeue' do
    it 'removes element from non-empty queue' do
      q.enqueue(4).enqueue(5)

      assert_equal 4, q.dequeue.value
      assert_equal 5, q.front
      assert_equal 5, q.rear
    end

    it 'removes element from one-elemented queue' do
      q.enqueue(4)

      assert_equal 4, q.dequeue.value
      assert_nil q.front
      assert_nil q.rear
    end
  end
end
