require 'spec_helper'

main = self

describe 'The Transformer DSL' do
	methods = [ :transform ]

	methods.each do |method_name|
		describe "##{method_name}" do
			it "is not added to every object in the system" do
				expect(main).to respond_to(method_name)
				expect(Module.new).to respond_to(method_name)
				expect(Object.new).not_to respond_to(method_name)
			end
		end
	end
end