#!/usr/bin/ruby

(1..1000).each {
	|a|
	(a..1000).each {
		|b|
		c=1000-(a+b)
		if(a*a+b*b==c*c)
			puts "#{a} + #{b} + #{c} = 1000"
			puts "a*b*c = #{a*b*c}"
		end
	}
}