module Transformer
	class Transformation
		attr_reader :name

		def initialize *args, &block
			raise Transformer::EmptyTransformation unless block
			@block = block
			@name = args.first if args.first
		end
		
		def register
			Transformer.world.register self
		end

		def run data
			data = @block.call(data)
		end
		
	end

end