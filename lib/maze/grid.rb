module Maze
  class Grid
    attr_reader :columns, :grid, :rows
    private :grid

    def initialize(rows, columns)
      @columns = columns
      @rows = rows
      @grid = generate_cells
      connect_adjucent_cells
    end

    def [](row, column)
      return nil unless row.between?(0, rows - 1)
      return nil unless column.between?(0, columns - 1)
      grid[row][column]
    end

    def each_row
      grid.each { |row| yield row }
    end

    def each_cell
      grid.flatten.each { |cell| yield cell }
    end

    def random_cell
      grid.flatten.sample
    end

    def size
      columns * rows
    end

    def to_s
      AsciiDisplay.new(self).to_s
    end

    def inspect
      "<# Grid @columns=#{columns} @rows=#{rows} >"
    end

    private

    def generate_cells
      Array.new(rows) do |row|
        Array.new(columns) do |column|
          Cell.new(row, column)
        end
      end
    end

    def connect_adjucent_cells
      each_cell do |cell|
        column, row = cell.column, cell.row
        cell.east = self[row, column + 1]
        cell.west = self[row, column - 1]
        cell.north = self[row - 1, column]
        cell.south = self[row + 1, column]
      end
    end
  end
end
