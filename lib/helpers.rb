def stylesheet_links
	AssetLinker.new('css', @items).links
end

def javascript_links
	AssetLinker.new('js', @items).links
end

def copyright
	time = Time.now.strftime('%Y')
	"&copy #{time} by David Nix"
end
