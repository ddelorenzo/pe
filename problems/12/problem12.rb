#!/usr/bin/ruby
require_relative '../../lib/factorize.rb'

#I want to get the total number of distinct factors by choosing combinations of prime factors
#For each prime factor I can have 0..(max) of that particular prime factor where max is the power
#in the prime factorization, i.e. 100=>2^2*5^2 has factors containing 0,1,or 2 2s and 0,1, or 2 5s, 
#for 3*3=9 total factors
def getFactors(value)
	Factorize.findPrimeFactorsMap(value).each_value.inject(1) { |product, n| product *= (n+1) }
end

value=1
step=1
numFactors=0
$MAX=0
until(numFactors>500)
	step+=1
	value+=step
	numFactors=getFactors(value)
	if(numFactors > $MAX)
		puts "New Max: #{value} has #{numFactors} factors"
		$MAX=numFactors
	end
end