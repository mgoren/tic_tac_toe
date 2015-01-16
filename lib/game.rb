class Player

  attr_reader(:marker)

  define_method(:initialize) do |marker|
    @marker = marker
  end
end


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

    # PRINT STATUS OF BOARD
    space1 = x1y1.marked_by()
    space2 = x1y2.marked_by()
    space3 = x1y3.marked_by()
    space4 = x2y1.marked_by()
    space5 = x2y2.marked_by()
    space6 = x2y3.marked_by()
    space7 = x3y1.marked_by()
    space8 = x3y2.marked_by()
    space9 = x3y3.marked_by()
    players_on_spaces = [space1, space2, space3, space4, space5, space6, space7, space8, space9]
    players_on_spaces.each() do |player|
      if player != nil
        puts(player.marker())
      else
        puts("nil")
      end
    end


    done = false
    @lines_to_check.each() do |line|

      if line[0].marked_by() == nil || line[1].marked_by() == nil || line[2].marked_by() == nil
        #
      elsif line[0].marked_by() == line[1].marked_by() && line[1].marked_by() == line[2].marked_by()
        done = true
      else
        #
      end
    end
    return done
  end

end




class Game

  define_method(:initialize) do
    @board = Board.new()
    @player1 = Player.new("x")
    @player2 = Player.new("o")
  end

  define_method(:player1_play) do |coordinates_entered|

      @board.all_spaces().each() do |space|
        if space.where() == coordinates_entered
          space.mark(@player1)
        end
      end

      if @board.gameover?()
        puts("PLAYER 1 WINS")
      else
        # player2_play()
      end

    end


  define_method(:player2_play) do |coordinates_entered|

      @board.all_spaces().each() do |space|
        if space.where() == coordinates_entered
          space.mark(@player2)
        end
      end

        if @board.gameover?()
          puts("PLAYER 2 WINS")
        else
          # player1_play()
        end
      end
    end







game = Game.new()
puts("----- START - PLAYER 1 ------")
game.player1_play([2,2])
puts("----- PLAYER 2 -------")
game.player2_play([2,3])
puts("----- PLAYER 1 -------")
game.player1_play([1,2])
puts("----- PLAYER 2 -------")
game.player2_play([3,3])
puts("----- PLAYER 1 -------")
game.player1_play([3,2])
