class Array
  def my_each(&prc)
    length = self.count
    i = 0
    until i == length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    selected = []

    self.my_each do |ele|
      selected << ele if prc.call(ele)
    end

    selected
  end


  def my_reject(&prc)
    selected = []
    self.my_each do |ele|
      selected << ele unless prc.call(ele)
    end
    selected
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false unless prc.call(ele)
    end
    true
  end

  def my_flatten
    result = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        result += ele.my_flatten
      else
        result << ele
      end
    end
    result
  end

  def my_zip(*args)
    result = []

    i = 0
    while i < self.length
      segment = [self[i]]
      args.my_each do |array|
        segment << array[i]
        # if segment == self.length
        #   result << segment
        #   segment = [self[i + 1]]
        # end
      end
      result << segment
      i += 1
    end
    result
  end

  def my_rotate(num = 1)
    dup_array = self.dup
    if num > 0
      num.times do
        temp = dup_array.shift
        dup_array.push(temp)
      end
    elsif (num < 0)
      num.abs.times do
        temp = dup_array.pop
        dup_array.unshift(temp)
      end
    end
    dup_array
  end

  def my_join(separator = '')
    result = ''
    self.my_each do |char|
      result << char + separator
    end
    separator == '' ? result : result[0..-2]
  end

  def my_reverse
    result = []
    self.my_each do |ele|
      result.unshift(ele)
    end
    result
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      sorted = true

      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

def factors(num)
  result = []

  (1..num).each do |factor|
    result << factor if num % factor == 0
  end

  result
end

class String
  def substrings
    subs = []

    (1..self.length).each do |i|
      self.chars.each_cons(i) do |substring|
        subs << substring.join
      end
    end
    subs
  end

  def subwords(dictionary)
    results = []

    self.substrings.each do |substr|
      results << substr if dictionary.include?(substr)
    end

    results
  end
end

# =begin
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# # => 1
#     # 2
#     # 3
#     # 1
#     # 2
#     # 3
#
# # p return_value  # => [1, 2, 3]
#=end
