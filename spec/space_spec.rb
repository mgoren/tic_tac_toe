require('rspec')
require('space')
require('player')

describe(Space) do

  describe('#where') do
    it("returns coordinates of space") do
      test_space = Space.new(1,2)
      expect(test_space.where()).to(eq([1,2]))
    end
  end

  describe('#marked_by') do
    it("returns Player who marked the space") do
      foo = Space.new(1,2)
      me = Player.new("x")
      you = Player.new("o")
      foo.mark(me)
      expect(foo.marked_by()).to(eq(me))
    end
  end

  describe('#mark') do
    it("will not allow a second marking") do
      foo = Space.new(1,2)
      me = Player.new("x")
      you = Player.new("o")
      foo.mark(me)
      foo.mark(you)
      expect(foo.marked_by()).to(eq(me))
    end
  end

end
