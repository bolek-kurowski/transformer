require "transformer/version"
require "transformer/world"
require "transformer/transformation_group"
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
    tgs = world.transformation_groups[data.class.to_s.to_sym]
  	tgs.each{|t| data = t.run data } if tgs
  	data
  end
end
