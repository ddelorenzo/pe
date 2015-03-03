#!/usr/bin/ruby
require_relative '../../lib/fibonacci.rb'

if(ARGV.length == 0)
	puts "Usage: problem25.rb LENGTH"
elsif
	length = ARGV[0].to_i
	testValue=1
	until(Fibonacci.calculateValue(testValue).to_s.length == length)
		testValue+=1
	end
	puts "First fibonacci value with length #{length} = #{testValue}"
end