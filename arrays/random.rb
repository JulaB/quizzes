class RandomGen
  # Given an array of integers with possible duplicates, randomly output the index of a given target number.
  def self.pick(arr, target)
    ind = nil
    cnt = 0

    arr.each_with_index do |el, i|
      if el == target
        cnt += 1
        ind = i if rand(cnt) == 0
      end
    end

    ind
  end
end
