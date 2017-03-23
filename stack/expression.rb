#!/usr/bin/env ruby
require_relative 'stack'

# Evaluate the value of an arithmetic expression
class Expression
  PRECEDENCE = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3 }.freeze

  def initialize(expr)
    @expr = expr.tr(' ', '')
    @o_stack = Stack.new
    @p_notation = []
    valid?
  end

  def evaluate
    build_postfix_notation
    @o_stack = Stack.new

    @p_notation.each do |item|
      if operator?(item)
        opr2, opr1 = @o_stack.pop, @o_stack.pop
        @o_stack.push(calculate(opr1, opr2, item))
      else
        @o_stack.push(item)
      end
    end

    raise ArgumentError, 'Invalid expression' if @o_stack.empty? || @o_stack.size > 1

    @o_stack.peek
  end

  def build_postfix_notation
    number = ''

    expr.each_char do |c|
      if ('0'..'9').cover?(c)
        number << c
      elsif operator?(c)
        number = output_num(number)
        handle_operator(c)
      elsif c == '('
        number = output_num(number)
        @o_stack.push(c)
      elsif c == ')'
        number = output_num(number)
        handle_parentheses
      end
    end

    finish_notation(number)
  end

  private

  def valid?
    raise ArgumentError, 'Expression cannot be empty' if expr.empty?

    if expr =~ /[^0-9+-\\*\/\^()]/
      raise ArgumentError, 'Only numbers, parentheses and operations: +,-,*,/,^ are allowed'
    end
    true
  end

  def operator?(c)
    PRECEDENCE.keys.include?(c)
  end

  def output_num(n)
    @p_notation << n.to_i unless n.empty?
    ''
  end

  def handle_operator(c)
    while !@o_stack.empty? && @o_stack.peek != '(' && PRECEDENCE[c] <= PRECEDENCE[@o_stack.peek]
      @p_notation << @o_stack.pop
    end

    @o_stack.push(c)
  end

  def handle_parentheses
    @p_notation << @o_stack.pop until @o_stack.empty? || @o_stack.peek == '('

    raise ArgumentError, 'Incorrect parentheses' if @o_stack.empty?

    @o_stack.pop
  end

  def finish_notation(number)
    output_num(number)

    until @o_stack.empty?
      raise ArgumentError, 'Incorrect parentheses' if @o_stack.peek == '('
      @p_notation << @o_stack.pop
    end

    @p_notation
  end

  def calculate(opr1, opr2, operator)
    raise ArgumentError, 'Invalid expression' unless opr1 && opr2

    case operator
    when '+'
      opr1 + opr2
    when '-'
      opr1 - opr2
    when '*'
      opr1 * opr2
    when '/'
      opr1 / opr2
    when '^'
      opr1 ** opr2
    end
  end

  attr_reader :expr
end
