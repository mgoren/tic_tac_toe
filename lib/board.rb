class Board

  attr_reader(:x1y1, :x1y2, :x1y3, :x2y1, :x2y2, :x2y3, :x3y1, :x3y2, :x3y3)

  define_method(:initialize) do
    @x1y1 = Space.new(1,1)
    @x1y2 = Space.new(1,2)
    @x1y3 = Space.new(1,3)
    @x2y1 = Space.new(2,1)
    @x2y2 = Space.new(2,2)
    @x2y3 = Space.new(2,3)
    @x3y1 = Space.new(3,1)
    @x3y2 = Space.new(3,2)
    @x3y3 = Space.new(3,3)


    @spaces = [x1y1, x1y2, x1y3, x2y1, x2y2, x2y3, x3y1, x3y2, x3y3]
    @x1 = [x1y1, x1y2, x1y3]
    @x2 = [x2y1, x2y2, x2y3]
    @x3 = [x3y1, x3y2, x3y3]
    @y1 = [x1y1, x2y1, x3y1]
    @y2 = [x1y2, x2y2, x3y2]
    @y3 = [x1y3, x2y3, x3y3]
    @diag1 = [x1y1, x2y2, x3y3]
    @diag2 = [x1y3, x2y2, x3y1]
    @lines_to_check = [@x1, @x2, @x3, @y1, @y2, @y3, @diag1, @diag2]
  end

  define_method(:find) do |x, y|
    @spaces.each() do |space|
      if space.where() == [x,y]
        return space
      end
    end
  end

  define_method(:all_spaces) do
    @spaces
  end

  define_method(:gameover?) do
    @lines_to_check.each() do |line|
      line_winners = []
      line.each() do |space|
        if space.marked_by() == nil
          puts("nil")
        else
          puts(space.marked_by())
        end
        line_winners.push(space.marked_by())
      end
      if line_winners[0] == line_winners[1] && line_winners[1] == line_winners[2] && line_winners[0] != nil
        return true
      else
        return false
      end
    end
  end

end
