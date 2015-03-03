#!/usr/bin/ruby
BASE_URL='https://projecteuler.net/problem='

def getProblem(number)
	system "mkdir #{number}"
	Dir.chdir number
	system "wget #{BASE_URL}#{number} -O description.html"
	urlFile = File.open("url.txt", 'w')
	urlFile.write("#{BASE_URL}#{number}")
	urlFile.close
	sourceFile = File.open("problem#{number}.rb", 'w')
	sourceFile.write("#!/usr/bin/ruby")
	sourceFile.chmod(0775)
	sourceFile.close
end

#begin
if(ARGV.length == 0)
	puts "Usage: getProblem.rb PROBLEM_NUMBER"
elsif
	getProblem(ARGV[0])
end