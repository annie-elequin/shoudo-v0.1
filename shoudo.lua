Shoudo = {
  deck = nil,
  bg = { img=nil },
  board = {{}}, -- [row][col]
  Mori = { -- the pieces for Mori
      daimyo = {
        id="md",
        strength=5,
        status=0,
        r=1,
        c=1,
        img = "./assets/pieces/daimyo-mori.png"
      },
      heir = {
        id="mh",
        strength=3,
        status=0,
        r=1,
        c=1,
        img = "./assets/pieces/heir-mori.png"
      },
      samurai = {
        id="ms",
        strength=2,
        status=0,
        r=1,
        c=1,
        img = "./assets/pieces/samurai-mori.png"
      }
  },
  Shimazu = { -- the pieces for Shimazu
    daimyo = {
        id="sd",
        strength=5,
        status=0,
        r=1,
        c=1,
        img = "./assets/pieces/daimyo-shimazu.png"
      },
      heir = {
        id="sh",
        strength=3,
        status=0,
        r=1,
        c=1,
        img = "./assets/pieces/heir-shimazu.png"
      },
      samurai = {
        id="ss",
        strength=2,
        status=0,
        r=1,
        c=1,
        img = "./assets/pieces/samurai-shimazu.png"
      }
  }
  
}

--[[
deck structure:
deck is an array of cards
card = {id, clan, piece, type, val, status}
]]--