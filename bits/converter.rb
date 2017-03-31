#!/usr/bin/env ruby

class Converter
  def self.dec2bin(num, precision = 0)
    int = num.to_i
    fract = num - int
    convert_int(int) + convert_fraction(fract, precision)
  end

  private

  def self.convert_int(num)
    return 0 if num.zero?

    res = []
    until num.zero?
      res << num % 2
      num /= 2
    end

    out = ''
    out << res.pop.to_s until res.empty?

    out.to_i
  end

  def self.convert_fraction(num, precision)
    return 0 if precision.zero?

    out = ''
    until precision.zero?
      num *= 2
      int = num.to_i
      num -= int
      out << int.to_s

      precision -= 1
    end

    out = '0' if out.empty?
    out = '0.' + out
    out.to_f
  end
end
