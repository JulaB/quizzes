require_relative '../test_helper'
require 'heap/priority_queue'

describe PriorityQueue do

  it 'checks new PQ' do
    pq = PriorityQueue.new
    assert_equal 0, pq.size
    assert_equal true, pq.empty?
    assert_nil pq.peek
    assert_nil pq.delete
  end

  it 'inserts data to PQ' do
    pq = PriorityQueue.new
    pq.insert('task1', 5).insert('task2', 1)
    assert_equal 'task2', pq.peek
    assert_equal false, pq.empty?
    assert_equal 2, pq.size
  end

  it 'deletes data from PQ' do
    pq = PriorityQueue.new
    pq.insert('task1', 5).insert('task2', 1)
    assert_equal 'task2', pq.delete
    assert_equal 1, pq.size
    assert_equal 'task1', pq.delete
    assert_equal 0, pq.size
    assert_equal true, pq.empty?
  end

  it 'decreases priority' do
    pq = PriorityQueue.new
    pq.insert('task1', 5).insert('task2', 1).insert('task3', 3)
    pq.decrease_priority(1, 5)
    assert_equal 'task1', pq.peek
    assert_equal 3, pq.size
  end

  it 'increases priority' do
    pq = PriorityQueue.new
    pq.insert('task1', 5).insert('task2', 1).insert('task3', 3)
    pq.increase_priority(0, 5)
    assert_equal 'task3', pq.peek
  end
end
