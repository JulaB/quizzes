#!/usr/bin/env ruby
require_relative 'stack'

# Check for balanced parentheses in an expression
class Parentheses
  PAIRES = { '{' => '}', '(' => ')', '[' => ']' }.freeze
  OPENED = PAIRES.keys.freeze
  CLOSED = PAIRES.values.freeze

  def self.balanced?(str)
    s = Stack.new
    str.each_char do |c|
      s.push(c) if opened?(c)

      if closed?(c)
        return false if s.empty?
        return false unless matched?(s.pop, c)
      end
    end
    s.empty?
  end

  private

  def self.opened?(c)
    OPENED.include?(c)
  end

  def self.closed?(c)
    CLOSED.include?(c)
  end

  def self.matched?(start_p, end_p)
    PAIRES[start_p] == end_p
  end
end
