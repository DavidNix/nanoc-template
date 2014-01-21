class AssetLinker
	attr_accessor :type, :items, :timestamp

	def initialize(type, nanoc_items=nil, timestamp=CacheBust.timestamp)
		@type = type
		@items = nanoc_items
		@timestamp = timestamp
	end

	def links
		filepaths.map { |path| link_for(path) }.join
	end

	def filename(nanoc_item)
		nanoc_item.identifier.chop + timestamp + '.' + type
	end
		
	private

	def filepaths
		filtered_items = @items.select { |item| item.identifier =~ /^\/#{type}/ }
		filtered_items.map { |item| filename(item) }
	end

	def link_for(filepath)
		case type
			when 'css'
				%Q{<link rel="stylesheet" href=#{filepath} type="text/css">}
			when 'js'
				%Q{<script type="text/javascript" src=#{filepath}>}
			else
				raise "Type not supported"
		end
	end
end
