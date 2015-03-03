#!/usr/bin/ruby
def readFile()
	nums=Array.new
	File.open("numbers.txt", 'r').each { |line| nums.push(line.to_i) }
	nums
end

puts "sum = #{readFile.each.reduce(:+)}"