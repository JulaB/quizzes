#!/usr/bin/env ruby

class Region
  DIRECTIONS = [[0, -1], [0, 1], [-1, 0], [1, 0], [-1, -1], [-1, 1], [1, -1], [1, 1]].freeze

  attr_accessor :mat
  attr_reader :count, :max_size

  def initialize(mat)
    @mat = mat
    @count = 0
    @max_size = 0
    @visited = {}
    calculate
  end

  private

  def calculate
    @mat.each_with_index do |row, x|
      row.each_with_index do |val, y|
        if val == 1 && !visited?(x, y)
          visit(x, y)
          @count += 1
          cnt = 1
          @max_size = [@max_size, dfs(x, y, cnt)].max
        end
      end
    end
  end

  def visit(x, y)
    @visited["#{x}, #{y}"] = true
  end

  def visited?(x, y)
    @visited["#{x}, #{y}"]
  end

  def dfs(x, y, cnt)
    DIRECTIONS.each do |dx, dy|
      x_n = x + dx
      y_n = y + dy

      if inside?(x_n, y_n) && mat[x_n][y_n] == 1 && !visited?(x_n, y_n)
        visit(x_n, y_n)
        cnt = dfs(x_n, y_n, cnt + 1)
      end
    end
    cnt
  end

  def inside?(x, y)
    x.between?(0, mat.size - 1) && y.between?(0, mat.first.size - 1)
  end
end
