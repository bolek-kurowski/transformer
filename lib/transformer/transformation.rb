module Transformer
	class Transformation
		attr_reader :description, :block

		def initialize *args, &block
			raise Transformer::EmptyTransformation unless block
			@block = block
			@description = args.first if args.first
		end
		
		def run data
			data = @block.call(data)
		end
		
	end

end