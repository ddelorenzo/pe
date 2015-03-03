#!/usr/bin/ruby
require 'date'
$SUNDAYS=0
(1901..2000).each { 
	|year|
	(1..12).each {
		|month|
		if(Date.new(year, month, 1).sunday?) then $SUNDAYS+=1 end
	}
}

puts "#{$SUNDAYS} sundays"