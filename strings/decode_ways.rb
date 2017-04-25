# LeetCode 91. Given an encoded message containing digits, determine the total number of ways to decode it.

class Message
  def self.num_decodings(s)
    return 0 unless s.is_a?(String)
    s = s.tr('^0-9', '')

    return 0 if s.length.zero?

    num_decodings_helper(s, 0)
  end

  def self.num_decodings_dp(s)
    return 0 unless s.is_a?(String)
    s = s.tr('^0-9', '')

    return 0 if s.length.zero?
    return 0 if s[0] == '0'

    n = s.length - 1
    f = [1]
    1.upto(n) do |ind|
      return 0 if s[ind] == '0' && s[ind - 1] != '1' && s[ind - 1] != '2'
      if s[ind] == '0'
        f[ind] = f[ind - 2]
      else
        num = 0
        if s[ind - 1, 2].between?('11', '26')
          num = f[ind - 2] || 1
        end

        f[ind] = f[ind - 1] + num
      end
    end
    f[n]
  end

  private

  def self.num_decodings_helper(s, from)
    to = s.length - 1
    return 0 if s[from] == '0'
    return 1 if from >= to
    cnt = num_decodings_helper(s, from + 1)
    if from < to
      cnt += num_decodings_helper(s, from + 2) if s[from, 2].between?('10', '26')
    end
    cnt
  end
end
