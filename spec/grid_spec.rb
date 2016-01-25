require "rspec"
require_relative "../lib/maze/grid"

module Maze
  RSpec.describe Grid do
    let(:grid) { Grid.new(2, 3) }

    describe "#initialize" do
      it "sets grid dementions" do
        expect(grid.rows).to eql(2)
        expect(grid.columns).to eql(3)
      end

      it "generates grid cells"

      it "connects all adjustent cells" do
        cell_a = grid[0, 0]
        cell_b = grid[0, 1]
        expect(cell_a.east).to eql(cell_b)
      end
    end

    describe "#each_row" do
      it "returns an iterator by grid rows" do
        grid.each_row do |row|
          expect(row.length).to eql(grid.columns)
        end
      end
    end

    describe "#each_cell" do
      it "returns an iterator by each cell in the grid" do
        total = 0
        grid.each_cell { |cell| total += 1 } # FIXME ugly code
        expect(total).to eql(grid.size)
      end
    end

    describe "#[]" do
      it "retuns a cell at given row and column" do
        cell = grid[1,2]
        expect(cell.row).to eql(1)
        expect(cell.column).to eql(2)
      end
    end
  end
end
