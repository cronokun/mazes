module Maze
  class Cell
    attr_reader :column, :row
    attr_accessor :east, :north, :south, :west

    OPPOSITE = {
      east: :west,
      north: :south,
      south: :north,
      west: :east
    }.freeze

    def initialize(row, column)
      @column = column
      @row = row
      @links = {
        east:  nil,
        north: nil,
        south: nil,
        west:  nil
      }
    end

    def link(cell)
      return unless cell
      @links[direction_to_link(cell)] = cell
      cell.link(self) unless cell.linked?(self)
      self
    end

    def links
      @links.values.compact
    end

    def linked?(cell)
      links.include?(cell)
    end

    def unlink(cell)
      direction = @links.key(cell)
      @links.delete(direction)
      cell.unlink(self) if cell.linked?(self)
      self
    end

    private

    def direction_to_link(cell)
      return :north if cell.column == column && cell.row.next == row
      return :south if cell.column == column && cell.row.pred == row
      return :west if cell.row == row && cell.column.next == column
      return :east if cell.row == row && cell.column.pred == column
      raise ArgumentError, "Trying to link non-adjacent cells!"
    end
  end
end
