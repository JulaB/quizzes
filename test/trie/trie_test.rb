require_relative '../test_helper'
require 'trie/trie'

describe Trie do
  let(:trie) do
    t = Trie.new
    t.insert('Word').insert('world').insert('ward').insert('space ')
  end

  describe '#contains?' do
    it 'returns true if word is in trie' do
      assert_equal true, trie.contains?('word')
    end

    it 'returns false if word is not in trie' do
      assert_equal false, trie.contains?('space ')
    end

    it 'returns false if cannot find whole word' do
      assert_equal false, trie.contains?('wor')
    end
  end

  describe '#starts_with?' do
    it 'returns true if word starts with prefix' do
      assert_equal true, trie.starts_with?('wor')
    end

    it 'returns false if word with prefix does not exist' do
      assert_equal false, trie.starts_with?('wron')
    end
  end

end
