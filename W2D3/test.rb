class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|x, y| x <=> y}
    return self if self.length <= 1

    middle = self.length / 2
    left = self.take(middle)
    right = self.drop(middle)

    self.class.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private

  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 0
        result << left.shift
      when 1
        result << right.shift
      when -1
        result << left.shift
      end
    end
    result + left + right
  end
end

p [3,2,6,4,9,11,10].merge_sort
