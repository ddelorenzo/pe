$LARGEST=0

def isPalindrome(number)
	str = number.to_s
	return str == str.reverse
end

#begin
for i in 100..999
	for j in 100..999
		product = i*j
		if(isPalindrome(product) && product>$LARGEST)
			puts "Replacing old largest #{$LARGEST} with #{i} * #{j} = #{product}"
			$LARGEST=product
		end
	end
end