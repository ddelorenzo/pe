#!/usr/bin/ruby

pow5 = (0..9).collect{ |i| i**5 }

$SUM=0
(2..(pow5[9]*6)).each{
	|n|
	digitCalc = n.to_s.chars.map(&:to_i).inject(0){ |sum, digit| sum + pow5[digit] }
	if(digitCalc == n)
		$SUM+=n
		puts "#{n} = sum of its digits pow5"
	end
}
puts "SUM = #{$SUM}"