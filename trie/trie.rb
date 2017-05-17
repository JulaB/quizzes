#Prefix tree implementation
class Trie
  class TrieNode
    attr_accessor :char, :is_leaf, :children
    def initialize(char, is_leaf = false)
      @char = char
      @is_leaf = is_leaf
      @children = {}
    end
  end

  def initialize
    @root = TrieNode.new(nil)
  end

  def insert(word)
    return self if word =~ /\W/

    cur_node = @root
    word.downcase.chars.each do |char|
      if cur_node.children[char]
        node = cur_node.children[char]
      else
        node = TrieNode.new(char)
        cur_node.children[char] = node
      end
      cur_node = node
    end
    cur_node.is_leaf = true

    self
  end

  def contains?(word)
    node = search_node(word)
    !node.nil? && node.is_leaf
  end

  def starts_with?(prefix)
    !search_node(prefix).nil?
  end

  private

  def search_node(prefix)
    node = @root
    prefix.downcase.chars.each do |char|
      return nil unless node.children[char]
      node = node.children[char]
    end
    node
  end
end
