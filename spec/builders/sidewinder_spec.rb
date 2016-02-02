require "rspec"
require_relative "../../lib/maze/builders/sidewinder"
require_relative "../../lib/maze/cell"
require_relative "../../lib/maze/grid"

module Maze
  module Builders
    RSpec.describe Sidewinder do
      describe "#build" do
        it "links some cells in a row unless the run is closed"
        it "links a random cell in a run to the north when the run is closed"
        it "always links all northen cells togather"
        it "always links all eastern cells togather"
      end
    end
  end
end
