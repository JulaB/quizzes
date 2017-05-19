require_relative 'trie'
require 'set'

# 212. Word Search II
# Given a 2D board and a list of words from the dictionary, find all words in the board.
# Each word must be constructed from letters of sequentially adjacent cell,
# where "adjacent" cells are those horizontally or vertically neighboring.
# The same letter cell may not be used more than once in a word.

PrefixPoint = Struct.new(:point, :prefix)

class WordSearch
  DIRECTIONS = [[-1, 0], [1, 0], [0, 1], [0, -1]].freeze

  def initialize(board, words)
    @board = board
    @words = Array(words)

    @rows_cnt = board.size
    @cols_cnt = board.first ? board.first.size : 0

    build_trie
  end

  def search
    res = []
    return res if words.size.zero? || board.size.zero?

    ind = 0

    until search_complete?(res, ind)
      found_words  = search_from(ind)
      res << (found_words) unless found_words.size.zero?

      ind += 1
    end

    res.flatten
  end

  private

  attr_reader :cols_cnt, :rows_cnt, :words, :board, :trie

  def build_trie
    @trie = Trie.new
    @words.each { |word| @trie.insert(word) }
  end

  def search_complete?(res, ind)
    res.size == words.size || ind >= rows_cnt * cols_cnt
  end

  def search_from(ind)
    i = ind / cols_cnt
    j = ind % cols_cnt
    @visited = Set.new

    queue = []

    queue << PrefixPoint.new([i, j], board[i][j])
    @visited << [i, j]
    res = []

    until queue.empty?
      data = queue.shift

      if trie.contains?(data.prefix)
        res << data.prefix
      end

      next_char(data.point) do |next_i, next_j|
        next_prefix = data.prefix + board[next_i][next_j]
        if !visited?(next_i, next_j) && trie.starts_with?(next_prefix)
          @visited << [next_i, next_j]
          queue << PrefixPoint.new([next_i, next_j], next_prefix)
        end
      end
    end

    res
  end

  def next_char(point)
    i, j = point
    DIRECTIONS.each do |di, dj|
      n_i = di + i
      n_j = dj + j
      yield(n_i, n_j) if n_i.between?(0, rows_cnt - 1) && n_j.between?(0, cols_cnt - 1)
    end
  end

  def visited?(*point)
    @visited.include?(point)
  end
end
