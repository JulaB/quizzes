require_relative '../test_helper'
require 'arrays/merge_sort'

describe Array do
  it 'sorts empty array' do
    assert_equal [], [].merge_sort
  end

  it 'sorts one-elemented array' do
    assert_equal [1], [1].merge_sort
  end

  it 'sorts array' do
    arr = Array.new(1_001) { rand(1_000) }
    assert_equal arr.sort, arr.merge_sort
  end
end
