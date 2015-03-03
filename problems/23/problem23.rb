#!/usr/bin/ruby
require_relative '../../lib/factorize.rb'
require 'set'
MAX=28123

$ABUNDANT = Array.new
$NO_SUM = Hash.new
(1..MAX).each{ |n|
	$NO_SUM.store(n,nil)
	if(Factorize.sumOfFactors(n) > n) then
		$ABUNDANT.push(n)
	end
}

puts $ABUNDANT.inspect
abundantCount=$ABUNDANT.length

#indexes instead of enumerator to avoid checking e.g. 12+18 and 18+12
(0..abundantCount-1).each{
	|i|
	(i..abundantCount-1).each{
		|j|
		sum=$ABUNDANT[i]+$ABUNDANT[j]
		if(sum>MAX) then break end
		$NO_SUM.delete(sum)
	}
}
		
puts $NO_SUM.keys.inspect
puts "SUM = #{$NO_SUM.keys.inject(0) { |sum, value| sum+=value}}"