require 'spec_helper'

module Transformer
	describe TransformationGroup do
		subject { 
			proc = Proc.new { ' jumps over the fence' }
			Transformer::TransformationGroup.new String, &proc 
		}

		context 'when initiated' do
			it 'has an empty transformation array' do
				subject.transformations.should be_kind_of Array
				subject.transformations.should be_empty
			end
		end

		it 'has a transformed_class' do
			subject.transformed_class.should eq String
		end

		describe 'adding transformations' do
			it "allows adding a transformation using 'it'" do
				subject.it('does sth 1') { }
				subject.it('does sth 2') { }
				subject.it('does sth 3') { }

				expect(subject.transformations.size).to eq(3)
			end
		end


		it "can register to world" do
			subject.register
			Transformer.world.transformation_groups[subject.transformed_class.
				to_s.to_sym].should include subject
		end

	end
end