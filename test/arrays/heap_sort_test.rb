require_relative '../test_helper'
require 'arrays/heap_sort'

describe HeapSort do
  it 'sorts empty array' do
    assert_equal [], HeapSort.new([]).sort
  end

  it 'sorts one-elemented array' do
    assert_equal [1], HeapSort.new([1]).sort
  end

  it 'sorts array' do
    arr = Array.new(1_001) { rand(1_000) }
    assert_equal arr.sort, HeapSort.new(arr).sort
  end
end
