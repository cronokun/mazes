require "rspec"
require_relative "../lib/maze/ascii_display"
require_relative "../lib/maze/cell"
require_relative "../lib/maze/grid"

module Maze
  RSpec.describe AsciiDisplay do
    let(:grid) { Grid.new(2, 2) }

    let(:simple_output) { <<-OUTPUT
+---+---+
|   |   |
+---+---+
|   |   |
+---+---+
OUTPUT
    }

    let(:linked_output) { <<-OUTPUT
+---+---+
|       |
+   +---+
|       |
+---+---+
OUTPUT
    }

    describe "#to_s" do
      it "prints basic grid" do
        expect(grid.to_s).to eq(simple_output)
      end

      it "prints linked cells" do
        c1, c2, c3, c4 = grid[0,0], grid[0,1], grid[1,0], grid[1,1]
        c1.link(c2)
        c3.link(c1)
        c3.link(c4)

        expect(grid.to_s).to eq(linked_output)
      end
    end
  end
end
