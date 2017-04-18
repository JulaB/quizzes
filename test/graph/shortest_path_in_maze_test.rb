require_relative '../test_helper'
require 'graph/shortest_path_in_maze'

describe Maze do
  let(:mat) do
    [[1, 0, 1, 1, 1, 1, 0, 1, 1, 1],
     [1, 0, 1, 0, 1, 1, 1, 0, 1, 1],
     [1, 1, 1, 0, 1, 1, 0, 1, 0, 1],
     [0, 0, 0, 0, 1, 0, 0, 0, 0, 1],
     [1, 1, 1, 0, 1, 1, 1, 0, 1, 0],
     [1, 0, 1, 1, 1, 1, 0, 1, 0, 0],
     [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
     [1, 0, 1, 1, 1, 1, 0, 1, 1, 1],
     [1, 1, 0, 0, 0, 0, 1, 0, 0, 1]]
  end
  let(:maze) { Maze.new(mat) }

  it 'returns nil if wrong point given' do
    assert_nil maze.shortest_path(Point.new(0, 1), Point.new(0, 4))
    assert_nil maze.shortest_path(Point.new(0, 0), Point.new(0, 6))
    assert_nil maze.shortest_path(Point.new(10, 10), Point.new(0, 4))
    assert_nil maze.shortest_path(Point.new(0, 0), Point.new(10, 16))
  end

  it 'returns nil if path not found' do
    assert_nil maze.shortest_path(Point.new(0, 0), Point.new(8, 9))
  end

  it 'finds path between two points' do
    assert_equal 11, maze.shortest_path(Point.new(0, 0), Point.new(3, 4))
  end

  it 'finds shortest path' do
    assert_equal 9, maze.shortest_path(Point.new(0, 0), Point.new(0, 5))
  end
end
