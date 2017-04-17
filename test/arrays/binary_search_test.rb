require_relative '../test_helper'
require 'arrays/binary_search'

describe Array do
  it 'returns nil for empty array' do
    assert_nil [].binary_search(1)
  end

  it 'returns nil for non-found element' do
    assert_nil [1, 2, 3].binary_search(4)
  end

  it 'returns index for element' do
    assert_equal 4, [1, 2, 3, 4, 5].binary_search(5)
    assert_equal 1, [1, 2, 3, 4, 5].binary_search(2)
  end
end
