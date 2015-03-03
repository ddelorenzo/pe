#!/usr/bin/ruby

class Collatz
	@@cache=[nil,1]
	def semiCache(value)
		#puts "calculating length for #{value}"
		if @@cache[value].nil?
			pathLength = semiCache(value%2==0 ? value/2 : 3*value+1) + 1
			if(value < 1000000)
				@@cache[value] = pathLength
			end
		else
			pathLength = @@cache[value]
		end
		pathLength
	end
	
	def getCacheSize
		@@cache.size
	end
	
	def bruteForce(value)
		pathLength = 1
		until value==1
			value = (value%2==0 ? value/2 : 3*value+1)
			pathLength +=1
		end
		pathLength
	end
end

$MAX_LENGTH=0
collatz = Collatz.new

(1..1000000).each { 
	|i|
	length = collatz.semiCache(i)
	if(length > $MAX_LENGTH)
		$MAX_LENGTH = length
		puts "new max length of #{$MAX_LENGTH} from starting value #{i}"
	end
}
puts "#{collatz.getCacheSize} values in cache"
