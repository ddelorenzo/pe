#!/usr/bin/ruby

def cycleLength(divisor)
	dividend=1
	count=0
	dividends=Hash.new
	loop do
		dividend*=10
		count+=1
		break if(dividends.has_key?(dividend))
		dividends.store(dividend,count)
		dividend=dividend%divisor
	end
	if(dividend==0) then 
		cycle=0
	else
		cycle=count - dividends.fetch(dividend)
	end
	#puts "1/#{divisor} has cycle of length #{cycle}"
	cycle
end

$MAX=0
(1..1000).each { 
	|n| 
	if(cycleLength(n)) > $MAX 
		$MAX=n
	end
}

puts "MAX cycle length at n=#{$MAX}"

def decimalFraction(divisor, precision=100)
	dividend=1
	output="0."
	precision.times { 
		dividend *= 10
		output << (dividend/divisor).to_s
		dividend = dividend%divisor
	}
	puts "1/#{divisor} = #{output}"
end