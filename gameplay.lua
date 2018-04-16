local composer = require( "composer" )
require 'shoudo'
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- FUNCTIONALITY FOUND IN THIS FILE
-- 
-- puts the background image on screen
-- shuffles the cards and puts them onto the board
-- -----------------------------------------------------------------------------------
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 print("made it to the new game screen")
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    sceneGroup:insert(Shoudo.bg.img)
    sceneGroup:insert(init_board())
    
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
      
        print("hello, boop")
        piecesGroup = display.newGroup();
        placePieces();
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 -- -----------------------------------------------------------------------------------
-- My functions!
-- -----------------------------------------------------------------------------------

function init_board()    
  mygroup = display.newGroup()
  
  --if(Shoudo.deck) then print('the thing exists') end
  cards = Shoudo.deck 
  used = {}
  row = {}
  num = table.maxn(cards)
  
  for i=1, 4 do -- for each row
    for j=1, 5 do -- for each column
      pos = math.random(num) -- get a random card from the deck
      print("pos: "..tostring(pos))
      
      -- while the card is one that we've used, draw a new card
      -- yeah yeah yeah I know this is a bad function that could be an infinite loop
      -- dont sass me about it
      while table.indexOf(used,pos) and table.maxn(used) < 20 do
        print("get a new number")
        pos = math.random(num)
      end
      Shoudo.deck[pos].r = i -- assign a row to the card
      print( "position: "..pos.." and row: "..Shoudo.deck[pos].r.." shoop: "..i)
      Shoudo.deck[pos].c = j -- assign a column to the card
      table.insert(row, cards[pos]) -- insert the correct card into the board
      table.insert(used, pos) -- insert the index into the "used" table
    end
    table.insert(Shoudo.board, row)
    row = {}
  end
  
 
  print("display the board!")
  print(tostring(table.maxn(Shoudo.board)))
  print("-----")
  
  locx = 8
  locy = gc.cy/2.5
  for i=1, #Shoudo.board do
    for j=1, #Shoudo.board[i] do
      print("-> "..tostring(Shoudo.board[i][j].id))
      
      -- print(tostring(Shoudo.board[i].id).." ") -- print the id
      -- if i%5==0 then print("--------") end -- make a new line for a new row
      -- t = display.newText("boop", locx, locy)
      
      cardID = Shoudo.board[i][j].id -- assign card id to this var
      -- temp = display.newText(tostring(Shoudo.board[i][j].id), locx, locy)
      Shoudo.board[i][j].x = locx
      Shoudo.board[i][j].y = locy
      img = display.newImage(mygroup, Shoudo.board[i][j].img, locx, locy)
      img.id = cardID
      img:scale(.16,.16)
      img:addEventListener("tap", foundcard)
      --temp:addEventListener("tap", foundcard)
      --mygroup:insert(temp)
      
      locx = locx + gc.cw/5.3
      
    end
    locx = 8
    locy = ((i-1)*70)+gc.cy/2.5
  end
  
  
  sleep(.5)
  return mygroup
  --return display.newText("hello", gc.cx, gc.cy)
end

function foundcard(e)
    id = e.target.id
  print( "Tap event on card: " ..id )
  print( "row: "..tonumber(Shoudo.deck[tonumber(id)].r) )
  print( "col: "..tonumber(Shoudo.deck[tonumber(id)].c) )
  return true
end

function placePieces() -- place each piece for each team on the board
  -- pieces to place: 
  -- Mori: daimyo, heir, samurai
  -- Shimazu: daimyo, heir, samurai
  numPlaced = 0
  placed = {} -- this will keep track of where we've placed pieces
  
  print("lets place some pieces")  
  
  if Shoudo.Mori then
    print("lalala")
    print(Shoudo.Mori["daimyo"].strength)
  end
  
  -- PLACING PIECES 
  Shoudo.Mori["daimyo"] = place(Shoudo.Mori["daimyo"], placed)
  Shoudo.Mori["heir"] = place(Shoudo.Mori["heir"], placed)
  Shoudo.Mori["samurai"] = place(Shoudo.Mori["samurai"], placed)
  Shoudo.Shimazu["daimyo"] = place(Shoudo.Shimazu["daimyo"], placed)
  Shoudo.Shimazu["heir"] = place(Shoudo.Shimazu["heir"], placed)
  Shoudo.Shimazu["samurai"] = place(Shoudo.Shimazu["samurai"], placed)
  
  print("----- display the pieces! -----")
  print(Shoudo.board[2][2].id)

  MD = display.newImage(piecesGroup, Shoudo.Mori["daimyo"].img, Shoudo.Mori["daimyo"].x, Shoudo.Mori["daimyo"].y)
  MD:scale(.16,.16)
  MH = display.newImage(piecesGroup, Shoudo.Mori["heir"].img, Shoudo.Mori["heir"].x, Shoudo.Mori["heir"].y)
  MH:scale(.16,.16)
  MS = display.newImage(piecesGroup, Shoudo.Mori["samurai"].img, Shoudo.Mori["samurai"].x, Shoudo.Mori["samurai"].y)
  MS:scale(.16,.16)
  SD = display.newImage(piecesGroup, Shoudo.Shimazu["daimyo"].img, Shoudo.Shimazu["daimyo"].x, Shoudo.Shimazu["daimyo"].y)
  SD:scale(.16,.16)
  SH = display.newImage(piecesGroup, Shoudo.Shimazu["heir"].img, Shoudo.Shimazu["heir"].x, Shoudo.Shimazu["heir"].y)
  SH:scale(.16,.16)
  SS = display.newImage(piecesGroup, Shoudo.Shimazu["samurai"].img, Shoudo.Shimazu["samurai"].x, Shoudo.Shimazu["samurai"].y)
  SS:scale(.16,.16)

end

function place(piece, placed) -- "piece" is the piece table we'll place
    
    --[[
      mori daimyo card id = 1
      mori heir card id = 2
      mori samurai card id = 3
      sam daimyo card id = 11
      sam heir card id = 12
      sam sam card id = 13
    ]]

    id = piece["id"]
    if id == "md" then 
      print('mori daimyo')
      ndx = 1
    elseif id == "mh" then
      print('mori heir')
      ndx = 2
    elseif id == "ms" then 
      print('mori sam')
      ndx = 3
    elseif id == "sd" then 
      print('shim daimyo')
      ndx = 11
    elseif id == "sh" then
      print('shim heir')
      ndx = 12
    elseif id == "ss" then
      print('shim sam')
      ndx = 13
    end

    piece.x = Shoudo.deck[ndx].x
    piece.y = Shoudo.deck[ndx].y
    piece.r = Shoudo.deck[ndx].r 
    piece.c = Shoudo.deck[ndx].c 

    return piece
end

function inTable(table, item)
  for i=1, #table do
              print("table: "..tostring(table[1])..", "..tostring(item))

    if table[i] == item then
      return true
    end
  end
  return false
end

function countValues(table)
  count = 0
  for k,v in pairs(t) do
       count = count + 1
  end
end

local clock = os.clock
function sleep(n)  -- seconds
	local t0 = clock()
	while clock() - t0 <= n do end
end

 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene