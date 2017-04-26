class Converter
  HEX_CHARS = ('a'..'f').to_a.freeze
  HEX_MAP = Hash[HEX_CHARS.zip(10..15)]

  def self.int2hex_b(int)
    return unless int.is_a?(Integer)
    return '0' if int.zero?
    chars = ('0'..'9').to_a + ('a'..'f').to_a
    s = ''
    int = (int.abs ^ 0xffffffff) + 1 if int < 0

    until int.zero?
      s = chars[int & 0b1111] + s
      int >>= 4
    end
    s
  end

  def self.int2hex(int)
    return unless int.is_a?(Integer)
    return '0' if int.zero?

    res = pos_int2hex(int)

    if int < 0
      res = hex_complement(res)
    end
    res
  end

  private


  def self.pos_int2hex(int)
    res = ''
    int = int.abs
    while int > 0
      res = num2hex_char(int % 16) + res
      int /= 16
    end
    res
  end

  def self.hex_complement(res)
    res = '0' * (8 - res.size) + res if res.size < 8

    res.chars.each_with_index do |c, i|
      res[i] = num2hex_char(15 - hex_char2num(c))
    end

    carry = 1
    n = res.size

    res.chars.each_with_index do |c, i|
      num = hex_char2num(res[n - i - 1]) + carry
      res[n - i - 1] = num2hex_char(num % 16)
      carry = num / 16
    end
    res = num2hex_char(carry) if carry > 0
    res
  end

  def self.num2hex_char(num)
    num > 9 ? HEX_CHARS[num - 10] : num.to_s
  end

  def self.hex_char2num(c)
    HEX_MAP[c] ? HEX_MAP[c] : c.to_i
  end
end
