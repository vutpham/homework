# reverse a string; do not use ruby's reverse

def reverse(str)
  result = ""

  str.chars.each do |char|
    result = char + result
  end

  result
end

def reverse_rec(str)
  return str if str.length <= 1

  reverse_rec(str[1..-1]) + str[0]
end


# method "FizzBuzz" iterate 1 - 100; if num div by 3 output "Fizz"; if num div by 5 output "Buzz"
# if divisible by 3 and 5 output "FizzBuzz"; else output number

def fizzbuzz(n)
  1.upto(n) do |num|
    if num % 3 == 0 && num % 5 == 0
      puts "FizzBuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

p reverse_rec('hello')
