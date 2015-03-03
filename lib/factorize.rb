# Class for prime factorization.  
# This is fairly naive
class Factorize
	#helper
	def self.smallestFactor(value)
		sqrtvalue = Math.sqrt(value)
		i=2 #smallest meaningful factor
		while(i<=sqrtvalue) do
			if(value%i==0)
				return i
			end
			i+=1
		end
		value
	end

	def self.findPrimeFactors(value)
		factors = Array.new
		while(value > 1)
			factors.push(smallestFactor(value))
			value/=factors.last
		end
		factors
	end
	
	def self.findPrimeFactorsArray(value)
		findPrimeFactors(value)
	end
	
	def self.findPrimeFactorsMap(value)
		findPrimeFactors(value).each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
	end
	
	#Find all factors of an integer.  Using all subcombinations of subfactors so there's a lot
	#of wasted work here in a worst case like 65536
	def self.findAllFactors(value)
		primeArray = findPrimeFactorsArray(value);
		#puts "primeArray = #{primeArray.inspect}"
		fullArray = [1]
		(1..primeArray.length).each { 
			|i|			
			primeArray.combination(i).to_a.each { | combination | 
				val = combination.each.inject(1) { 
					| product, n|	 
					product *= (n) 
				}
				fullArray.push(val)
			}			
		}
		fullArray = fullArray.uniq.sort
		fullArray.delete_at(-1) #value
		fullArray
	end
	
	def self.sumOfFactors(value)
		findAllFactors(value).inject(0) { |sum, n| sum+=n }
	end
	
	#The number of distinct factors of a given value, including 1 and the value itself
	def self.countDistinctFactors(value)
		factorizeToMap(value).each_value.inject(1) { |product, n| product *= (n+1) }
	end
end