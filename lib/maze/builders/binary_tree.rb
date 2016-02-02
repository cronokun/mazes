module Maze
  module Builders
    class BinaryTree
      attr_reader :grid

      def initialize(grid)
        @grid = grid
      end

      def build
        grid.each_cell do |cell|
          cell.link get_neighbor_to_link(cell)
        end

        grid
      end

      private

      def get_neighbor_to_link(cell)
        [cell.north, cell.east].compact.sample
      end
    end
  end
end
