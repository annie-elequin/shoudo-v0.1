Shoudo = {
  deck = nil,
  bg = { img=nil },
  board = {{}},
  Mori = {
      daimyo = {
        strength=5,
        status=0,
        row=1,
        col=1
      },
      heir = {
        strength=3,
        status=0,
        row=1,
        col=1
      },
      samurai = {
        strength=2,
        status=0,
        row=1,
        col=1
      }
  },
  Shimazu = {
    daimyo = {
        strength=5,
        status=0,
        row=1,
        col=1
      },
      heir = {
        strength=3,
        status=0,
        row=1,
        col=1
      },
      samurai = {
        strength=2,
        status=0,
        row=1,
        col=1
      }
  }
  
}

--[[
deck structure:
deck is an array of cards
card = {id, clan, piece, type, val, status}
]]--