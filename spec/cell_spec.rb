require "rspec"
require_relative "../lib/maze/cell"

module Maze
  RSpec.describe Cell do
    let(:cell) { Cell.new(1,1) }
    let(:other_cell) { Cell.new(1,2) }

    describe "#link" do
      it "links given cell to current cell" do
        cell.link(other_cell, to: :east)
        expect(cell.links).to include(other_cell)
      end

      it "links both cells" do
        cell.link(other_cell, to: :east)
        expect(other_cell.links).to include(cell)
      end

      it "returns the cell object" do
        resoult = cell.link(other_cell, to: :east)
        expect(resoult).to eql(cell)
      end
    end

    describe "#links" do
      let(:east_cell) { Cell.new(1,2) }
      let(:west_cell) { Cell.new(1,0) }
      let(:north_cell) { Cell.new(0,1) }
      let(:south_cell) { Cell.new(2,1) }

      it "returns a list of linked cells" do
        cell.link(east_cell, to: :east)
            .link(west_cell, to: :west)
            .link(north_cell, to: :north)
            .link(south_cell, to: :south)

        expect(cell.links).to match_array([east_cell, north_cell, south_cell, west_cell])
      end

      it "returns an empty list by default" do
        expect(cell.links).to be_empty
      end
    end

    describe "#linked" do
      it "returns true if a given cell is linked to the current" do
        cell.link(other_cell, to: :east)
        expect(cell.linked?(other_cell)).to be_truthy
      end

      it "returns false otherwise" do
        expect(cell.linked?(other_cell)).to be_falsey
      end
    end

    describe "#unlink" do
      let(:linked_cell) { Cell.new(1,1).link(other_cell, to: :east) }

      before { linked_cell.unlink(other_cell) }

      it "unlinks two cells" do
        expect(linked_cell.linked?(other_cell)).to be_falsey
      end

      it "unlinks both cells" do
        expect(other_cell.linked?(linked_cell)).to be_falsey
      end
    end
  end
end
