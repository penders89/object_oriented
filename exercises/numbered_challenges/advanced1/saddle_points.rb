class Matrix
  def initialize(input)
    @input = input
  end

  def rows
    @input.split("\n").map(&:split).map { |ar| ar.map(&:to_i) }
  end

  def columns
    rows.transpose
  end

  def saddle_points
    saddle_points = []
    rows.each_with_index do |row, row_idx|
      columns.each_with_index do |col, col_idx|
        if row[col_idx] >= row.max && col[row_idx] <= col.min
          saddle_points << [row_idx, col_idx]
        end
      end
    end
    saddle_points
  end
end
