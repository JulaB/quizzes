#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'swap_in_singly_ll'

describe SwapInSinglyLL do
  let(:l) { SwapInSinglyLL.new }
  before { l.insert(6).insert(5).insert(4).insert(3).insert(2).insert(1) }

  it 'swap elements pairwise in even linked list' do
    assert_equal [2, 1, 4, 3, 6, 5], l.swap.to_a
  end

  it 'swap elements pairwise in odd linked list' do
    node = l.search(6)
    l.delete(node)

    assert_equal [2, 1, 4, 3, 5], l.swap.to_a
  end
end
