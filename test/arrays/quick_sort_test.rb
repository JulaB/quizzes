require_relative '../test_helper'
require 'arrays/quick_sort'

describe Array do
  it 'sorts empty array' do
    assert_equal [], [].quick_sort
  end

  it 'sorts one-elemented array' do
    assert_equal [1], [1].quick_sort
  end

  it 'sorts array' do
    arr = Array.new(1_001) { rand(1_000) }
    assert_equal arr.sort, arr.quick_sort
  end
end
