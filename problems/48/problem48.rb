#!/usr/bin/ruby

# discard everything but the 10 least significant digits each time to keep it moving along
def mul10pow(mul, pow)
	(1..pow).inject(1) { |prod| (prod*mul)%10000000000}
end

# sum up the values
puts "#{((1..1000).inject(0) { |sum, n| sum + mul10pow(n, n) })%10000000000}"