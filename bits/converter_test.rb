#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'converter'

describe Converter do
  describe '.dec2bin' do
    it 'returns 0 binary for 0 decimal' do
      assert_equal 0, Converter.dec2bin(0)
    end

    it 'converts integer to binary' do
      assert_equal 1010, Converter.dec2bin(10)
    end

    it 'converts decimal fraction with 0 precision' do
      assert_equal 1010, Converter.dec2bin(10.10)
    end

    it 'converts decimal fraction without integral part' do
      assert_equal 0.011, Converter.dec2bin(0.47, 3)
    end

    it 'converts decimal fraction' do
      assert_equal 110.11111, Converter.dec2bin(6.986, 5)
    end
  end
end
