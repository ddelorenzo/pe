#!/usr/bin/ruby

$ones=["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
$tens=["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
$teens=["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

def numUnder100(num)
	if(num < 10) then return $ones[num] end
	if(num < 20) then return $teens[num-10] end
	$tens[num/10] + " " + $ones[num%10]
end

def numUnder1000(num)
	text=""
	if(num >= 100)
		text+= numUnder100(num/100)
		text+= " hundred "
		if(num%100 != 0) then text+= "and " end
	end
	text+= numUnder100(num%100)
end

def numToText(num)
	text=""
	if(num >= 10**12)
		text+=numUnder1000(num/10**12)
		text+=" trillion "
		num = num%10**12
	end
	if(num >= 10**9)
		text+=numUnder1000(num/10**9)
		text+=" billion "
		num = num%10**9
	end
	if(num >= 10**6)
		text+=numUnder1000(num/10**6)
		text+=" million "
		num = num%10**6
	end
	if(num >= 10**3)
		text+=numUnder1000(num/10**3)
		text+=" thousand "
		num = num%10**3
	end
	text += numUnder1000(num)
end

#begin
# if(ARGV.length == 0)
	# puts "Usage: problem17.rb NUMBER"
# elsif
	# puts "#{numToText(ARGV[0].to_i)}"
# end
$SUM=0
#the regex removes spaces
(1..1000).each { |n| $SUM+= numToText(n).gsub(/\s+/, "").length }
puts("#{$SUM} total letters")
	