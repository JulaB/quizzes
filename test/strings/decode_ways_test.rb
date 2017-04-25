require_relative '../test_helper'
require 'strings/decode_ways'

describe Message do
  it 'returns 0 for non-string' do
    assert_equal 0, Message.num_decodings(1)
    assert_equal 0, Message.num_decodings_dp(1)
  end

  it 'returns 0 for empty string' do
    assert_equal 0, Message.num_decodings('')
    assert_equal 0, Message.num_decodings_dp('')
  end

  it 'returns 0 for string started with 0' do
    assert_equal 0, Message.num_decodings('01')
    assert_equal 0, Message.num_decodings_dp('01')
  end

  it 'returns 0 for string that impossible to decode' do
    assert_equal 0, Message.num_decodings('601')
    assert_equal 0, Message.num_decodings_dp('601')
  end

  it 'returns correct result' do
    assert_equal 1, Message.num_decodings('110')
    assert_equal 1, Message.num_decodings_dp('110')
  end

  it 'returns correct result' do
    assert_equal 589824, Message.num_decodings('4757562545844617494555774581341211511296816786586787755257741178599337186486723247528324612117156948')
    assert_equal 589824, Message.num_decodings_dp('4757562545844617494555774581341211511296816786586787755257741178599337186486723247528324612117156948')
  end
end
