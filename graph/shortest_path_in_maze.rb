#!/usr/bin/env ruby
Node = Struct.new(:point, :dist)
Point = Struct.new(:x, :y)

class Maze
  DIRECTIONS = [[0, -1], [0, 1], [-1, 0], [1, 0]].freeze

  attr_accessor :grid, :visited

  def initialize(grid)
    @grid = grid
    @width = grid.first.size
    @height = grid.size
    @height_range = (0...@height)
    @width_range = (0...@width)
    @visited = Array.new(@height) { Array.new(@width, false) }
  end

  def shortest_path(from, to)
    queue = []

    return unless path_exists?(from)
    return unless path_exists?(to)

    queue << Node.new(from, 0)
    point_visited(from)

    until queue.empty?
      node = queue.shift
      point = node.point
      return node.dist if point == to

      DIRECTIONS.each do |dx, dy|
        n_point = Point.new(point.x + dx, point.y + dy)
        if point_valid?(n_point) && path_exists?(n_point) && !visited?(n_point)
          queue << Node.new(n_point, node.dist + 1)
          point_visited(n_point)
        end
      end
    end
  end

  private

  def point_visited(point)
    visited[point.x][point.y] = true
  end

  def point_valid?(point)
    @height_range.cover?(point.x) && @width_range.cover?(point.y)
  end

  def visited?(point)
    visited[point.x][point.y] == true
  end

  def path_exists?(point)
    grid[point.x] && grid[point.x][point.y] && grid[point.x][point.y] == 1
  end
end
