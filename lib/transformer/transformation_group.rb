module Transformer
	class TransformationGroup

		attr_reader :transformed_class, :transformations

		def initialize *args, &block

			@transformed_class = args.first if args.first.kind_of? Class
			@transformations = []
			instance_eval &block if block
			@filter = {}
			@filter = args[1][:where] if args[1]
		end

		def it *args, &block
			@transformations << Transformation.new(args, &block)
		end

		def run data
			should_run = @filter.all?{ |k,v| 
				if data.kind_of? Hash
					v.kind_of?(Array) ? v.any?{|x| data[k]==x} : data[k]==v 
				else
					true
				end
			} || @filter.size==0
			@transformations.each{|t| data = t.run(data)} if should_run
			data
		end

		def register
			Transformer.world.register self
		end

	end
end