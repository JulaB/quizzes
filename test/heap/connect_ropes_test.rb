require_relative '../test_helper'
require 'heap/connect_ropes'

describe Ropes do
  it 'returns minimum cost for connecting rope' do
    assert_equal 29, Ropes.new([4, 3, 2, 6]).min_cost
  end
end
