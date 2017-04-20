require_relative '../test_helper'
require 'queue/lru_cache'

describe LRUCache do
  it 'sets data to cache' do
    c = LRUCache.new
    c.set(:k1, 1)
    assert_equal({k1: 1}, c.get_all)
  end

  it 'updates data priority' do
    c = LRUCache.new
    c.set(:k1, 1)
    c.set(:k2, 2)
    assert_equal({k2: 2, k1: 1}, c.get_all)

    c.set(:k1, 3)
    assert_equal({k1: 3, k2: 2}, c.get_all)
  end

  it 'removes unused data in cache' do
    c = LRUCache.new
    c.set(:k1, 1)
    c.set(:k2, 2)
    c.set(:k3, 3)
    assert_equal({k3: 3, k2: 2, k1: 1}, c.get_all)
    c.set(:k4, 4)
    c.set(:k5, 5)
    assert_equal({k5: 5, k4: 4, k3: 3}, c.get_all)
    assert_nil c.get(:k1)
  end

  it 'gets data from cache' do
    c = LRUCache.new
    c.set(:k1, 1)
    assert_equal 1, c.get(:k1)
  end

  it 'returns nil if data is not in cashe' do
    c = LRUCache.new
    assert_nil c.get(:k1)
  end
end
