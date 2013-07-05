module Transformer

	class World
		attr_reader :transformation_groups

		def initialize
			@transformation_groups = {}
		end

		def register transformation_group
			raise Transformer::NotATransformationGroup.new unless transformation_group.kind_of? TransformationGroup
			@transformation_groups[transformation_group.transformed_class.
				to_s.to_sym] ||= []
			@transformation_groups[transformation_group.transformed_class.
				to_s.to_sym] << transformation_group
		end

	end
end