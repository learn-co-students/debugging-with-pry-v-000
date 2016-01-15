# practice with pry
require 'pry'
def fish(breed, qty=1)
  hour = Time.now.hour
  min = Time.now.min
  sec = Time.now.sec

  puts "We're having #{qty} #{breed} tonight!"
  puts "Unless it's too late to eat, because the time is now #{hour}:#{min}:#{sec}"


end

fish("salmon", 3)





