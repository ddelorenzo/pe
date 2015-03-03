#!/usr/bin/ruby
def readFile()
	numberFile = File.open("number.txt", 'r')
	digits=Array.new
	i=0
	while digit=numberFile.read(1)
		digits[i]=digit.to_i
		i+=1
	end
	return digits
end

def findMax(array, sliceLength)
	maxProduct=0
	digits=Array.new
	(0..array.length-(sliceLength)).each { 
		|sliceStart|
		product=1
		(sliceStart..sliceStart+sliceLength-1).each { |i| product*=array[i] }
		if(product > maxProduct)
			maxProduct = product
			digits=array[sliceStart..sliceStart+sliceLength-1]
			puts("New maxProduct #{maxProduct} from #{digits.inspect}")
		end
	}
end

#begin
if(ARGV.length == 0)
	puts "Usage: problem8.rb SLICE_LENGTH"
elsif
	findMax(readFile(), ARGV[0].to_i)
end

