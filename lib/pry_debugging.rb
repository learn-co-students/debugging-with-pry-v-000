require 'pry'
def plus_two(num)
	val = num + 2
	
	binding.pry
	val
end

plus_two(3)