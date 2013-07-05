module Transformer
	module DSL

    def transform(*args, &transform_block)
    	Transformer::Transformation.new(*args, &transform_block).register
    end

	end
end

extend Transformer::DSL
Module.send(:include, Transformer::DSL)