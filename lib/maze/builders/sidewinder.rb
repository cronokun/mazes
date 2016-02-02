module Maze
  module Builders
    class Sidewinder
      attr_reader :grid, :run
      private :run

      def initialize(grid)
        @grid = grid
        @run = []
      end

      def build
        grid.each_row do |row|
          row.each do |cell|
            run.push(cell)

            case next_or_close(cell)
            when :close
              close_run
            when :next
              cell.link(cell.east)
            end
          end

          grid
        end
      end

      private

      def next_or_close(cell)
        return :close unless cell.east
        return :next unless cell.north
        [:close, :next].sample
      end

      def close_run
        cell = run.sample
        cell.link(cell.north)
        run.clear
      end
    end
  end
end
