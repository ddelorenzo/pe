require_relative '../../lib/leastCommonMultiple.rb'

$LCM=1
for i in 1..20
	$LCM = LeastCommonMultiple.new($LCM,i).lcm
end
p $LCM

p (2**4) * (3**2) * 5 * 7 * 11 * 13 * 17 * 19