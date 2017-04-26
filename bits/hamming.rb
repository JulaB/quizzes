class Bits
  # The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
  def self.hamming_distance(x, y)
    cnt = 0
    res = x ^ y # find positions there bits are different

    # calculate number of 1s
    until res.zero?
      res &= (res - 1)
      cnt += 1
    end

    cnt
  end

  def self.hamming_weight(n)
    cnt = 0
    until n.zero?
      n &= (n - 1)
      cnt += 1
    end
    cnt
  end

  def self.total_hamming_distance(nums)
    total = 0
    0.upto(31) do |i|
      ones = 0
      zeros = 0
      nums.each do |n|
        if (1 << i) & n == 0
          zeros += 1
        else
          ones += 1
        end
      end

      total += ones * zeros
    end
    total
  end
end





