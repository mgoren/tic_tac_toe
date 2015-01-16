class Space

  attr_reader(:x, :y)

  define_method(:initialize) do |x, y|
    @x = x
    @y = y
  end

  define_method(:where) do
    [@x, @y]
  end

  define_method(:mark) do |player|
    if @marked_by == nil
      @marked_by = player
    end
  end

  define_method(:marked_by) do
    @marked_by
  end

end
