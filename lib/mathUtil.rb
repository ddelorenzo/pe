class MathUtil
	def self.factorial(value)
		if (value==0) 
			return 1
		end
		(1..value).reduce(:*)
	end
	
	def self.sumDigits(value)
		(value.to_s.split "").map!(&:to_i).reduce(:+)
	end
end