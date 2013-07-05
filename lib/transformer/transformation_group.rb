module Transformer
	class TransformationGroup

		attr_reader :transformed_class, :transformations

		def initialize *args, &block
			@transformed_class = args.first if args.first.kind_of? Class
			@transformations = []
			instance_eval &block if block
		end

		def it *args, &block
			@transformations << Transformation.new(args, &block)
		end

		def run data
			@transformations.each{|t| data = t.block.call(data)} 
			data
		end

		def register
			Transformer.world.register self
		end

	end
end