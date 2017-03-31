require 'byebug'

def range(start, last)
  return [] if start > last
  [start] + range(start + 1, last)
end

def r_sum(arr)
  return arr.first if arr.length <= 1
  arr.pop + r_sum(arr)
end

def i_sum(arr)
  sum = 0
  arr.each { |el| sum += el }
  sum
end

def exp1(b, n)
  return 1 if n == 0
  return nil if n < 0

  b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  return nil if n < 0

  if n % 2 == 0
    exp2(b, n / 2) * exp2(b, n / 2)
  else
    b * (exp2(b, (n - 1) / 2) * exp2(b, (n - 1) / 2))
  end
end

def deep_dup(arr_of_arr)
  new_arr = []
  arr_of_arr.each do |item|
    if item.is_a? Array
      new_arr << deep_dup(item)
    else
      new_arr << item
    end
  end

  new_arr
end


def r_fibonacci(n)
  return [] if n == 0
  return [1] if n == 1
  return [1, 1] if n == 2

  r_fibonacci(n - 1) << (r_fibonacci(n - 1)[-1] + r_fibonacci(n - 1)[-2])
end

p r_fibonacci(5)


def i_fibonacci(n)
  fib = [1, 1]

  if n < 3
    return fib[0...n]
  else
    until fib.count == n
      fib << fib[-1] + fib[-2]
    end

    fib
  end
end

def subsets(arr)
  all_subsets = []
  return [[]] if arr.empty?

  all_but_last = subsets(arr[0...-1])
  all_subsets += all_but_last

  all_but_last.each do |element|
    all_subsets << (element + [arr[-1]])
  end

  all_subsets
end

#p subsets([1,2,3])

def permutations(arr)
  return [arr] if arr.length == 1

  results = []

  arr.each do |el|
    permutations_not_including_el = permutations(arr - [el])
    permutations_not_including_el.each do |permutation|
      results << ([el] + permutation)
    end
  end

  results
end

def bsearch(array, target)
  return nil if array.empty?

  middle_index = array.length / 2

  if target == array[middle_index]
    middle_index
  elsif target < array[middle_index]
    bsearch(array[0...middle_index], target)
  else
    right_searched = bsearch(array[(middle_index + 1)..-1], target)
    right_searched.nil? ? nil : (middle_index + 1) + right_searched
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1

  middle_index = arr.length / 2
  left_array = merge_sort(arr[0...middle_index])
  right_array = merge_sort(arr[middle_index..-1])
  merge(left_array, right_array)
end

def merge(arr1, arr2)
  sorted = []

  left_pointer, right_pointer = 0, 0
  #debugger

  while left_pointer < arr1.count && right_pointer < arr2.count
    left_value = arr1[left_pointer]
    right_value = arr2[right_pointer]

    #debugger
    if left_value <= right_value
      sorted << left_value
      left_pointer += 1
    else
      sorted << right_value
      right_pointer += 1
    end
  end

  while left_pointer < arr1.count
    sorted << arr1[left_pointer]
    left_pointer += 1
  end

  while right_pointer < arr2.count
    sorted << arr2[right_pointer]
    right_pointer += 1
  end

  sorted
end

# p merge_sort([5,3,9,1,0])

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return [0] if amount == 0
  result = []
  #
  # coins.each do |coin|
  #   if amount % coin == 0
  #     (amount / coins.first).times do
  #       result << coins.first
  #     end
  #     return result
  #   end
  # end


  #debugger
  (amount / coins.first).times do
    result << coins.first
  end

  remaining_amount = amount % coins.first

  result += greedy_make_change(remaining_amount, coins[1..-1]) unless remaining_amount == 0
  result
end

def make_better_change(amount, coins )

  return [0] if amount == 0
  change_combinations = []
  coins.each do |coin|
    debugger
    change_combinations << make_better_change(amount - coin, coins) if coin < amount
  end

  change_combinations.max_by{ |combination| combination.count }
end


p make_better_change(14, [10,7,1])
