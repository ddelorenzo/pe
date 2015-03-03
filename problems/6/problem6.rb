#!/usr/bin/ruby

$sumOfSquares = 0
$sum = 0
for i in 1..100
	$sumOfSquares += i*i
	$sum += i
end
$dif = ($sum * $sum) - $sumOfSquares
puts "sumOfSquares = #{$sumOfSquares}"
puts "square of sums = #{$sum*$sum}"
puts "difference = #{$dif}"