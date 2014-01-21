require_relative '../lib/cache_bust'
require 'minitest/autorun'

describe CacheBust do
	before do
		@it = CacheBust
	end

	it "must return a timestamp that is a string" do
		@it.timestamp.must_be_instance_of String
	end

	it "must memoize the timestamp" do
		stamp1 = @it.timestamp
		stamp2 = @it.timestamp
		stamp1.must_equal stamp2
	end

	it "must be a timestamp" do
		@it.timestamp.must_match /\d+/
	end
end