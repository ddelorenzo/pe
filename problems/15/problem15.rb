#!/usr/bin/ruby

# The lattice problem is more of a statistics problem than something needing a computer program
# If we treat "Down" as 0 and "Right" as 1, it's the same as asking
# "How many different strings of length 40 are there containing exactly 20 0s and exactly 20 1s"

# The formula for this is (40!)/(20!*20!)

# Apparently the word for this is "combinatorics", not "statistics"

def factorial(value)
	return (1..value).reduce(:*)
end

#begin
puts factorial(40)/(factorial(20)*factorial(20))