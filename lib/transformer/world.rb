module Transformer

	class World
		attr_reader :transformations

		def initialize
			@transformations = []
		end

		def register transformation
			raise Transformer::NotATransformation.new unless transformation.kind_of? Transformer::Transformation
			@transformations << transformation
		end

	end
end