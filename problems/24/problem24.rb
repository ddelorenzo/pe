#!/usr/bin/ruby

def findPermutation(value)
	factorial = [1]
	(1..10).each { |i| factorial[i]=factorial[i-1]*i }
	digits=[0,1,2,3,4,5,6,7,8,9]
	num=Array.new
	(0..9).each {
		|i|
		choice = value/factorial[9-i]
		value = value%factorial[9-i]
		num[i] = digits.delete_at(choice)
	}
	num.inject(0) { |product, val| product = product*10+val }
end

if(ARGV.length == 0)
	puts "Usage: #{$0} PERMUTATION"
elsif
	puts findPermutation(ARGV[0].to_i-1).inspect
end