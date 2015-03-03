require_relative '../../lib/factorize.rb'
#begin
if(ARGV.length == 0)
	puts "Usage: problem3.rb NUMBER_TO_FACTORIZE"
elsif
	puts Factorize.findPrimeFactorsMap(ARGV[0].to_i).inspect
end