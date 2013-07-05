require 'spec_helper'

describe Transformer::World do
	subject { Transformer::World.new }

	context "when initiated" do
		it 'initializes an empty transformation array' do
			subject.transformations.should be_kind_of Array
			subject.transformations.size.should eq 0
		end
	end	

	context "when registering valid transformations" do
		it "registers correctly" do
			transformation = Transformer::Transformation.new {|lala| lala}
			subject.register transformation
			subject.transformations.should include transformation 
		end
	end

	context "when registering an invalid transformation" do
		it 'throws an error' do
			expect{ subject.register 'Happy Transformation' }.to raise_error Transformer::NotATransformation
		end
	end

	it 'has transformations' do
		subject.transformations.should_not be_nil
	end

end