#!/usr/bin/ruby
require_relative '../../lib/mathUtil.rb'

#begin
if(ARGV.length == 0)
	puts "Usage: problem20.rb NUMBER"
elsif
	puts "Sum of Digits is #{MathUtil.sumDigits(MathUtil.factorial(ARGV[0].to_i))}"
end
