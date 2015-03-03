require_relative 'primeFactor.rb'

class LeastCommonMultiple
	def initialize(value1, value2)
		@value1=value1
		@value2=value2
	end

	def lcm()
		factor1Map = PrimeFactor.new(@value1).factorizeToMap
		factor2Map = PrimeFactor.new(@value2).factorizeToMap
		#coalesce maps
		lcmMap = factor1Map.merge(factor2Map) {|key, left, right| [left, right].max}
		product=1
		lcmMap.each_pair {|key,value| product*=(key**value)}
		return product
	end
end