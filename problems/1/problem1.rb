$i=0
$SUM=0
$MAX=1000

while $i < $MAX do
	if($i%3==0||$i%5==0)
		#puts "#{$i} is a multiple of 3 and/or 5"
		$SUM+=$i
	end #if
	$i=$i+=1
end #while

puts $SUM