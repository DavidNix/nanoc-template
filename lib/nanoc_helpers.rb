include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo

class Nanoc::RuleContext
	def production?
		ENV['ENVIRONMENT'] == 'production'
	end
end