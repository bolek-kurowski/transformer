require 'spec_helper'

describe Transformer do
	it 'is a module' do
		Transformer.should be_kind_of Module
	end

	describe "::world" do
		it "returns the same object every time" do
			expect(Transformer.world).to equal(Transformer.world)
		end

		it "returns an instance of World" do
			Transformer.world.should be_kind_of Transformer::World
		end

		it "runs a set of trnsformations on a data point" do
			Transformer.reset

			tg = Transformer::TransformationGroup.new(String)
			tg.it('adds "over"') { |s| s += ' over' }
			tg.it('adds "the"') { |s| s+= ' the' }
			tg.it('adds "fence"') { |s| s+= ' fence' }
			tg.register

			#raise "#{tg.transformations.size}"
			tg.transformations.size.should == 3

			Transformer.run("Brown Fox").should eq 'Brown Fox over the fence'
		end
	end
end