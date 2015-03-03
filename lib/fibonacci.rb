class Fibonacci
	#cache previous results to avoid making deep recursive calls repeatedly
	@@cache=[nil,1,1]
	def self.calculateValue(value)
		if @@cache[value].nil?
			@@cache[value] = calculateValue(value-2) + calculateValue(value-1)
		end
		@@cache[value]
	end
end