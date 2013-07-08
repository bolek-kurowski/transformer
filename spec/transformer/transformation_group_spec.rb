require 'spec_helper'

module Transformer
	describe TransformationGroup do
		subject { 
			proc = Proc.new { ' jumps over the fence' }
			TransformationGroup.new String, &proc 
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

		context "when :where provided" do
			it 'runs transformations only on matching hash items by equality' do
				tg = TransformationGroup.new Hash, where: { id: 1 }
				tg.it('adds a new key value pair') { |h| h[:test] = 'new value'; h; }

				matching_hash = {id: 1}
				not_matching_hash = {id: 0}
				not_matching_hash_orig = {id: 0}

				expected_hash = { id: 1, test: 'new value' }

				tg.run(matching_hash).should eq expected_hash
				tg.run(not_matching_hash).should == not_matching_hash_orig
			end

			it 'runs transformations only on matching hash items included in array' do
				tg = TransformationGroup.new Hash, where: { id: [1,2] }
				tg.it('adds a new key value pair') { |h| h[:test] = 'new value'; h; }

				matching_hash = {id: 1}
				not_matching_hash = {id: 0}
				not_matching_hash_orig = {id: 0}

				expected_hash = { id: 1, test: 'new value' }

				tg.run(matching_hash).should eq expected_hash
				tg.run(not_matching_hash).should == not_matching_hash_orig
			end


		end

	end
end