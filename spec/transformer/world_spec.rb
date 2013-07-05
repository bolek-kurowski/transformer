require 'spec_helper'

describe Transformer::World do
	subject { Transformer::World.new }

	context "when initiated" do
		it 'initializes an empty transformation group hash' do
			subject.transformation_groups.should be_kind_of Hash
			subject.transformation_groups.size.should eq 0
		end
	end	

	context "when registering valid transformation group" do
		it "registers correctly" do
			transformation_group = Transformer::TransformationGroup.new Integer do |lala| lala; end
			subject.register transformation_group
			subject.transformation_groups[transformation_group.transformed_class.
				to_s.to_sym].should include transformation_group
		end
	end

	context "when registering an invalid transformation" do
		it 'throws an error' do
			expect{ subject.register 'Happy Transformation' }.to raise_error Transformer::NotATransformationGroup
		end
	end

	it 'has transformations' do
		subject.transformation_groups.should_not be_nil
	end

end