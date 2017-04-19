require_relative '../test_helper'
require 'heap/min_heap'

describe MinHeap do
  it 'inserts new element to heap' do
    h = MinHeap.new
    h.insert(6).insert(5).insert(4)
    assert_equal 4, h.min
    assert_equal 3, h.size
  end

  it 'deletes min element from heap' do
    h = MinHeap.new
    h.insert(6).insert(5).insert(4)
    assert_equal 4, h.delete_min
    assert_equal 5, h.min
    assert_equal 2, h.size
    assert_equal [5, 6], h.to_a
  end

  it 'deletes min element in one-elemented heap' do
    h = MinHeap.new
    h.insert(6)
    assert_equal 6, h.delete_min
    assert_equal 0, h.size
    assert_nil h.min
  end

  it 'builds heap from array' do
    h = MinHeap.new([4, 5, 2, 1, 7, 8, 3, 5, 9, 0])
    assert_equal [0, 1, 2, 4, 5, 8, 3, 5, 9, 7], h.to_a
  end

  it 'decreases key' do
    h = MinHeap.new
    h.insert(6).insert(5).insert(4)

    h.decrease_key(1, 4)
    assert_equal 2, h.min
  end

  it 'increases key' do
    h = MinHeap.new
    h.insert(6).insert(5).insert(4)

    h.increase_key(0, 4)
    assert_equal 5, h.min
  end
end
