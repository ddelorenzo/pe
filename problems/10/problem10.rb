#!/usr/bin/ruby
require_relative '../../lib/primes.rb'

def doProblem(maxValue)
	primeChecker = Primes.new(maxValue)
	sum=0
	(0..maxValue).each {
		|i|
		if(primeChecker.isPrime(i))
			sum+=i
		end
	}
	return sum
end

if(ARGV.length == 0)
	puts "Usage: problem10.rb MAX_VALUE"
elsif
	maxValue = ARGV[0].to_i
	puts "Sum of primes below #{maxValue} is #{doProblem(maxValue)}"
end