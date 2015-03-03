#!/usr/bin/ruby
$SUM=0

def readFile
	namesFile=File.open "names.txt", 'r' 
	namesFile.each_line{ |line| $NAMES = line.gsub(/\"/,"").split(',')}
	namesFile.close
end

def nameVal(name)
	name.split(//).inject(0){ |sum, c| sum+=(c.ord-"A".ord+1) }
end

readFile
$NAMES.sort!
$NAMES.each_index{ |i| $SUM+=(i+1) * nameVal($NAMES[i]) }
puts "SUM = #{$SUM}"