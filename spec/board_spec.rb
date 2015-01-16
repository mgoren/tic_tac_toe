require('rspec')
require('board')
require('space')
require('player')


describe(Board) do

  describe("#find") do
    it("returns a Space from its coordinates") do
      board1 = Board.new()
      expect(board1.find(2,2)).to(eq(board1.all_spaces().at(4)))
    end
  end

  describe("#gameover?") do
    it("returns false if game is not over") do
      board1 = Board.new()
      me = Player.new("x")
      you = Player.new("o")
      expect(board1.gameover?()).to(eq(false))
    end

    it("returns true if game is over") do
      board1 = Board.new()
      me = Player.new("x")
      you = Player.new("o")
      board1.x1y1().mark(me)
      board1.x1y2().mark(me)
      board1.x1y3().mark(me)
      expect(board1.gameover?()).to(eq(true))
    end






  end

end
