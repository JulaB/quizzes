#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'reverse_nodes'

describe ReverseNode do
  let(:l) { ReverseNode.new }

  it 'cannot change empty list' do
    assert_equal [], l.reverse_groups(3).to_a
  end

  it 'cannot change list with one element' do
    l.insert(1)
    assert_equal [1], l.reverse_groups(3).to_a
  end

  it 'cannot change list for one-elemented group' do
    l.insert(2).insert(1)
    assert_equal [1, 2], l.reverse_groups(1).to_a
  end

  it 'reverses nodes in 2 groups' do
    l.insert(7).insert(6).insert(5).insert(4).insert(3).insert(2).insert(1)
    assert_equal [2, 1, 4, 3, 6, 5, 7], l.reverse_groups(2).to_a
  end

  it 'reverses nodes in 3 groups' do
    l.insert(6).insert(5).insert(4).insert(3).insert(2).insert(1)
    assert_equal [3, 2, 1, 6, 5, 4], l.reverse_groups(3).to_a
  end
end
