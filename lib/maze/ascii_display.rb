require "forwardable"

module Maze
  class AsciiDisplay
    extend Forwardable

    attr_reader :output
    def_delegators :@grid, :columns, :rows, :each_row

    CELL = "   ".freeze
    CELL_HORZ = "---".freeze
    CELL_VERT = "|".freeze
    CROSS = "+".freeze
    LINK_HORZ = "   ".freeze
    LINK_VERT = " ".freeze

    def initialize(grid)
      @grid = grid
      @output = ""
    end

    def to_s
      puts_top_boundry
      each_row { |row| puts_row(row) }
      output
    end

    private

    def puts_row(row)
      output << CELL_VERT
      row.each do |cell|
        output << CELL
        output << (cell.linked?(cell.east) ? LINK_VERT : CELL_VERT)
      end
      output << "\n"
      row.each do |cell|
        output << CROSS
        output << (cell.linked?(cell.south) ? LINK_HORZ : CELL_HORZ)
      end
      output << "#{CROSS}\n"
    end

    def puts_top_boundry
      output << CROSS
      output << "#{CELL_HORZ}#{CROSS}" * columns
      output << "\n"
    end
  end
end
