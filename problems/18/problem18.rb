
#Tree solution (too slow, checks every path)
class Node
	def initialize(i, j)
		@value=$TRIANGLE[i][j]
		if($TRIANGLE[i+1])
			@left=Node.new(i+1,j)
			@right=Node.new(i+1,j+1)
		end
	end
	
	def getValue
		@value
	end
	
	def sum
		if (@left.nil? || @right.nil?) then return @value end
		$SUMCOUNT+=1
		@value + [@left.sum, @right.sum].max
	end
end

#!/usr/bin/ruby
$TRIANGLE=Array.new
$SUMCOUNT=0

def readFile()
	File.open("triangle.txt", 'r').each_line { |line| $TRIANGLE << line.split.map(&:to_i) }
end
readFile

row=$TRIANGLE.size-1

until row==0
	row-=1
	$TRIANGLE[row].map!.with_index{ |x, i| x + [$TRIANGLE[row+1][i], $TRIANGLE[row+1][i+1]].max }
end
puts "MAX SUM = #{$TRIANGLE[0][0]}"
#puts "#{$TRIANGLE.inspect}"