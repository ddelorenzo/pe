#!/usr/bin/ruby
require_relative '../../lib/primes.rb'

prime = Primes.new
puts "10001st prime = #{prime.getNthPrime(10001)}"