class Bits
  def self.count_bits(num)
    res = [0]
    cur_pow = 0

    1.upto(num) do |i|
      if i & (i - 1) == 0
        cur_pow = i
        res << 1
      else
        res << res[cur_pow] + res[i - cur_pow]
      end
    end
    res
  end

  def self.find_complement(num)
    n = num
    mask = 1
    i = 1
    until n == 1
      n >>= 1
      mask |= 1 << i
      i += 1
    end

    num ^ mask
  end
end
