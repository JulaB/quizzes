require_relative '../test_helper'
require 'graph/largest_region'

describe Region do
  let(:mat) do
    [[0, 0, 1, 1, 0],
     [1, 0, 1, 1, 0],
     [0, 1, 0, 0, 0],
     [0, 0, 0, 0, 1]]
  end

  let(:region) { Region.new(mat) }

  it 'returns number of regions' do
    assert_equal 2, region.count
  end

  it 'returns size of larges region' do
    assert_equal 6, region.max_size
  end
end
