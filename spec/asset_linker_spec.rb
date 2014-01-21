require_relative '../lib/asset_linker'
require 'minitest/autorun'

describe AssetLinker do
	
	before do
		@timestamp = "4321"
		@item = OpenStruct.new(identifier: '/custom/')
	end

	describe '#filename' do

		it "returns correct path for css" do
			name = AssetLinker.new('css', nil, @timestamp).filename(@item)
			name.must_equal "/custom4321.css" 
		end

		it "returns correct path for js" do
			name = AssetLinker.new('js', nil, @timestamp).filename(@item)
			name.must_equal "/custom4321.js"
		end		
	end

	describe '#links' do

		before do
			@items = []
			@items << OpenStruct.new(identifier: '/css/test/')
			@items << OpenStruct.new(identifier: '/js/another/')
			@items << OpenStruct.new(identifier: '/about/')
		end

		it "returns correct filterd link for css" do
			linker = AssetLinker.new('css', @items, @timestamp)
			linker.links.must_equal %Q{<link rel="stylesheet" href=/css/test4321.css type="text/css">}
		end

		it "returns correct filtered link for js" do
			linker = AssetLinker.new('js', @items, @timestamp)
			linker.links.must_equal %Q{<script type="text/javascript" src=/js/another4321.js></script>}
		end

		it "raises error for invalid type" do
			linker = AssetLinker.new('about', @items, @timestamp)
			-> {linker.links}.must_raise RuntimeError
		end
	end
end

