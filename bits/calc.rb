#!/usr/bin/env ruby

class Calc
  def self.equal?(a, b)
    (a ^ b).zero?
  end

  def self.sum(a, b)
    until b.zero?
      carry = (a & b) << 1
      a = a ^ b

      b = carry
    end
    a
  end

  def self.product(a, b)
    res = 0

    until a.zero?
      res += b if a & 1 == 1
      a >>= 1
      b <<= 1
    end
    res
  end
end
