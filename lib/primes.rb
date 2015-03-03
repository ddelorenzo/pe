#Uses Eratosthenes seive to calculate primes
class Primes
	#array of booleans storing whether or not a given index is prime
	@@isPrime = Array.new
	#special cases
	@@isPrime[0] = false
	@@isPrime[1] = false
	@@maxCalculated = 1
	@@primesCount = 0
	@@primesCache = Array.new
	
	#Allow initialization to a given max if we know how big of a sieve we need in advance
	def initialize(value)
		expand(value)
	end
	
	#Expand the array to @param newMax
	def expand(newMax)
		@@isPrime.fill(true, (@@maxCalculated+1)..newMax)
		calculatePrime(newMax)
		cachePrimes(@@maxCalculated, newMax)
		@@maxCalculated=newMax
	end
	
	#Return whether a given value is prime or not.  If that value is beyond the end of the array
	#expand as necessary
	def isPrime(value)
		if(value > @@maxCalculated)
			expand(value+1)
		end
		return @@isPrime[value]
	end
	
	#Return the ith prime number.  If we don't have that many prime values calculated yet expand
	#the array by powers of 2 until it is large enough to contain N primes
	def getNthPrime(value)
		while(@@primesCount < value)
			expand(@@maxCalculated*2)
		end
		return @@primesCache[value-1]
	end
	
	#The seive.  For each known prime smaller than the square root of the max prime array size, #every multiple of that number is not prime.
	#Tried to speed this up by making use of the cache but the naive first attempt didn't help.
	#About 12 seconds to calculate 1000000 primes.  Will leave as is unless I need a faster version
	#later
	def calculatePrime(newMax)
		sqrtMax = Math.sqrt(newMax)
		(2..sqrtMax).each{
			|i|
			if(@@isPrime[i])
				j=2
				while(i*j<=newMax)
					@@isPrime[i*j]=false
					j+=1
				end
			end
		}
	end
	
	#Cache the calculated primes between two values to help keep track of the count and value
	#of calculated primes
	def cachePrimes(oldMax, newMax)
		(oldMax+1..newMax).each { |i| 
			if(@@isPrime[i]) 
				@@primesCount+=1
				@@primesCache.push(i)
			end 
		}
		#puts "primes = " + @@primesCache.inspect
		#puts "#{@@primesCount} primes less than or equal to #{newMax}"
	end
end