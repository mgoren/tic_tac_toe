require('rspec')
require('player')

describe(Player) do

  describe('#marker') do
    it("returns string representing player's marker") do
      me = Player.new("x")
      expect(me.marker()).to(eq("x"))
    end
  end

end
