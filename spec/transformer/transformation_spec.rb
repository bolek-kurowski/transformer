require 'spec_helper'

describe Transformer::Transformation do
	subject { 
		proc = Proc.new { |data| data + ' jumps over the fence' }
		Transformer::Transformation.new 'jump over the fence', &proc }

	it 'requires a transformation block' do
		expect{ Transformer::Transformation.new }.to raise_error Transformer::EmptyTransformation
	end

	it 'has a name' do
		subject.name.should eq 'jump over the fence'
	end

	it "can register to world" do
		subject.register
		Transformer.world.transformations.should include subject
	end

	it 'runs transformations' do
		subject.run('Brown Fox').should eq 'Brown Fox jumps over the fence'
	end

end