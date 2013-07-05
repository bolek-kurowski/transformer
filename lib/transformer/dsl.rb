module Transformer
	module DSL

    def transform(*args, &block)
    	Transformer::TransformationGroup.new(*args, &block).register
    end

	end
end

extend Transformer::DSL
Module.send(:include, Transformer::DSL)