require 'pry'

def plus_two(num)
    num + 2
    num
    binding.pry
end

plus_two(num)
