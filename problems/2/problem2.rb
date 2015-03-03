$SUM=0
$larger=1
$smaller=1

until $larger > 4000000
	nextNum=$larger+$smaller
	$smaller=$larger
	$larger=nextNum
	if($larger%2==0)
		$SUM+=$larger
		puts "#{$larger} is an even fibonacci number"
	end #if
end #until

puts "Sum = #{$SUM}"