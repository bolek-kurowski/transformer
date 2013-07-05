require "transformer/version"
require "transformer/world"
require "transformer/transformation_group"
require "transformer/transformation"
require "transformer/exceptions"
require "transformer/dsl"

module Transformer
  def self.world
    if @world.nil?
      @world = World.new
      dirs = Dir['./transformations/**/*_tform.rb'].each { |f| load f }
    end
  	@world
  end

  def self.reset
  	@world = nil
    world
  end

  def self.run data
    tgs = world.transformation_groups[data.class.to_s.to_sym]
  	tgs.each{|t| data = t.run data } if tgs
  	data
  end
end