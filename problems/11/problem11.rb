#!/usr/bin/ruby
$GRID=Array.new
$MAX=0
$SIZE=4

def readFile()
	gridFile = File.open("grid.txt", 'r')
	gridFile.lines.each { 
		|line|
		$GRID << line.split.map(&:to_i)
	}
	#puts $GRID.inspect
end

#Horizontal stripes are the inner arrays
def checkHorizontal(size)
	$GRID.each { |row| checkArray(row, size) }
end

#Vertical stripes are the nth value of each inner array
def checkVertical(size, maxWidth)
	(0..maxWidth-1).each { 
		|column|
		ary=Array.new
		$GRID.each { |row| ary.push(row[column]) }
		checkArray(ary, size)
	}
end

#Down diagionals increase row & column by one each
def checkDownDiagional(size, maxHeight, maxWidth)
	(-maxHeight..maxHeight).each {
		|row|
		ary=Array.new
		(0..maxWidth-1).each {
			|column|
			if(row+column>=0&&(row+column)<(maxHeight-1)) then
				ary.push($GRID[row+column][column])
			end
		}
		checkArray(ary, size)
	}
end

#Up diagionals increase row & column; or, have row & column index that sum to the same number
def checkUpDiagional(size, maxHeight, maxWidth)
	(0..maxHeight*2).each {
		|row|
		ary=Array.new
		(0..maxWidth-1).each {
			|column|
			if(row-column>=0&&(row-column)<(maxHeight-1)) then
				ary.push($GRID[row-column][column])
			end
		}
		checkArray(ary, size)
	}
end

def checkArray(array, sliceLength)
	if(array.length<sliceLength) then 
		#puts "No max in array: #{array.inspect}"
		return 
	end
	(0..array.length-(sliceLength)).each { 
		|sliceStart|
		product=1
		(sliceStart..sliceStart+sliceLength-1).each { |i| product*=array[i] }
		if(product > $MAX)
			$MAX = product
			digits=array[sliceStart..sliceStart+sliceLength-1]
			puts("New maxProduct #{$MAX} from #{digits.inspect}")
		end
	}
end

#begin
readFile()
maxHeight=$GRID.size
maxWidth=$GRID[0].size
#puts "Height = #{$HEIGHT}; Width = #{$WIDTH}"
checkHorizontal($SIZE)
checkVertical($SIZE, maxWidth)
checkDownDiagional($SIZE, maxHeight, maxWidth)
checkUpDiagional($SIZE, maxHeight, maxWidth)

#Next time use array.collect to avoid having to build all this garbage