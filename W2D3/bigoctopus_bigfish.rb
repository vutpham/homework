class Array

  def quadratic_search
    longest = nil

    self.each do |el|
      if longest == nil || el.length > longest.length
        longest = el
      end
    end
    longest
  end

end

def merge_sort(array, &prc)
  prc ||= Proc.new { |x, y| x <=> y }

  middle = array.length / 2
  left = array.take(middle).merge_sort(&prc)
  right = array.drop(middle).merge_sort(&prc)

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  results = []

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
  results + left + right
end

def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
