class StringR
  # Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string.
  def self.reverse_str(s, k)
    return s if k == 1
    n = s.length
    i = 0
    while i < n
      from = i
      to = from + k - 1
      to = n - 1 if to > n - 1
      i = to + k + 1

      while from < to
        s[from], s[to] = s[to], s[from]
        from += 1
        to -= 1
      end
    end
    s
  end

  # Reverse String
  def self.reverse_string(s)
    return s if s.length < 2

    half = s.length / 2
    half.times { |i| s[i], s[-i - 1] = s[-i - 1], s[i] }
    s
  end

  # 345. Reverse Vowels of a String
  def self.reverse_vowels(s)
    vowels = {'a' => 'a', 'e' => 'e', 'i' => 'i', 'o' => 'o', 'u' => 'u'}
    from = 0
    n = s.length
    to = n - 1
    while from < to
      from += 1 while from < n && !vowels[s[from].downcase]
      to -= 1 while to > -1 && !vowels[s[to].downcase]
      s[from], s[to] = s[to], s[from] if from < to

      from += 1
      to -= 1
    end
    s
  end
end
