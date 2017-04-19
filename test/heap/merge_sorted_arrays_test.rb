require_relative '../test_helper'
require 'heap/merge_sorted_arrays'

describe SArrays do
  it 'returns empty array' do
    assert_equal [], SArrays.new([]).merge
    assert_equal [], SArrays.new([[], [], []]).merge
  end

  it 'returns sorted array for arrays with same size' do
    arrs = [[3, 5, 7, 9],
            [2, 4, 6, 7],
            [0, 1, 8, 10]]
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 7, 8, 9, 10], SArrays.new(arrs).merge
  end

  it 'returns sorted array for arrays with different sizes' do
    arrs = [[10, 13, 15],
            [1, 4, 6, 8],
            [0, 5, 6, 10, 14]]
    assert_equal [0, 1, 4, 5, 6, 6, 8, 10, 10, 13, 14, 15], SArrays.new(arrs).merge
  end
end
