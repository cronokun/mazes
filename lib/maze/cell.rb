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

    # %i(east north south west).each do |direction|
    #   define_method(direction) { @links[direction] }
    # end

    # TODO why this method need to know where to link other cell?
    # TODO should it check if cells are adjustent?
    def link(cell, to:)
      @links[to] = cell
      cell.link(self, to: OPPOSITE[to]) unless cell.linked?(self)
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
  end
end
