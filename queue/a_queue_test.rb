#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'a_queue'

describe AQueue do
  let(:q) { AQueue.new(4) }
  it 'raises error for wrong queue capacity' do
    err = assert_raises(ArgumentError) { AQueue.new(0) }
    assert_match(/capacity/, err.message)
  end

  describe '#size' do
    it 'returns zero if queue is empty' do
      assert_equal 0, q.size
    end

    it 'changes size on enqueue/dequeue' do
      q.enqueue(1).enqueue(3)
      assert_equal 2, q.size

      q.dequeue
      assert_equal 1, q.size
    end
  end

  describe '#empty?' do
    it 'returns true if queue is empty' do
      assert_equal true, q.empty?
    end

    it 'returns false if queue contains elements' do
      q.enqueue(3)
      assert_equal false, q.empty?
    end
  end

  it 'returns true when queue is full' do
    assert_equal false, q.full?

    0.upto(3) { |i| q.enqueue(i) }
    assert_equal true, q.full?
  end

  it 'returns front element' do
    0.upto(3) { |i| q.enqueue(i) }
    q.dequeue
    assert_equal 1, q.front
  end

  it 'returns rear element' do
    0.upto(3) { |i| q.enqueue(i) }
    q.dequeue
    q.enqueue(100)

    assert_equal 100, q.rear
  end
end
