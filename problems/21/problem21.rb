#!/usr/bin/ruby
require_relative '../../lib/factorize.rb'

# if(ARGV.length == 0)
	# puts "Usage: problem3.rb NUMBER_TO_FACTORIZE"
# elsif
	# puts Factorize.sumOfFactors(ARGV[0].to_i).inspect
# end

# puts [1,2,3,4].inspect
# puts [1,1,2,3,4].uniq!.inspect
# puts [1,2,3,4].uniq!.inspect
# puts [1,1,2,3,4].uniq.inspect
# puts [1,2,3,4].uniq.inspect

# ary =  [1,3,4,2,5,1,33,2].uniq.sort
# ary.delete_at(-1)
#puts ary.inspect
$SUM=0
(2..10000).each { |n|
	sumOfFactors = Factorize.sumOfFactors(n)
	sumOfSumOfFactors = Factorize.sumOfFactors(sumOfFactors)
	if(n==sumOfSumOfFactors&&n!=sumOfFactors)
		$SUM+=n
	end
}
puts "SUM = #{$SUM}"
	