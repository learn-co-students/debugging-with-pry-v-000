require 'pry'
require_relative './spec_helper'
require_relative '../lib/pry_debugging.rb'

describe '#plus_two' do 
	it 'should take in a number as an argument and return the sum of that number and 2' do
		expect(plus_two(3)).to eq(5)
	end
end