require_relative '../test_helper'
require 'trie/word_search2'

describe WordSearch do
  let(:board) do
    [%w(o a a n b),
     %w(e t a e a),
     %w(i h k r n),
     %w(i f l v k)]
  end
  let(:words) { %w(eat oath pea rain bank oat oathieo eat) }

  it 'returns empty array if board is empty' do
    assert_equal [], WordSearch.new([], words).search
  end

  it 'returns empty array if words is empty' do
    assert_equal [], WordSearch.new(board, []).search
  end

  it 'returns empty array if words are not found' do
    assert_equal [], WordSearch.new(board, %w(rain pea)).search
  end

  it 'returns array of founded words' do
    assert_equal %w(eat oath oat bank).sort, WordSearch.new(board, words).search.sort
  end
end
