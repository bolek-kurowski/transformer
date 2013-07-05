require "transformer/version"
require "transformer/world"
require "transformer/transformation"
require "transformer/exceptions"
require "transformer/dsl"

module Transformer
  def self.world
  	@world ||= World.new
  end

  def self.reset
  	@world = World.new
  end

  def self.run data
  	world.transformations.each{|t| data = t.run data }
  	data
  end
end
