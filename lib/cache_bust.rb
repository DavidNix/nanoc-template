class CacheBust
	@timestamp = nil
	@cache_cleaned = false

	def self.timestamp
		@timestamp ||= Time.now.to_i.to_s
	end

	def self.clean_caches!(*dirs)
		return if @cache_cleaned
		root_path = File.expand_path './output'
		dirs.each do |dir|
			path = File.join(root_path, dir)
			FileUtils.rm_r(Dir.glob(path + '/*'))
		end
	end
end
