local composer = require( "composer" )
require 'shoudo'
 
local scene = composer.newScene()
 
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
      -- TODO: seed random number with time so they're SUPER RANDOM
      
      -- while the card is one that we've used, draw a new card
      while table.indexOf(used,pos) and table.maxn(used) < 20 do
        print("get a new number")
        pos = math.random(num)
      end
      Shoudo.deck[pos].row = i
      Shoudo.deck[pos].col = j
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
      img = display.newImage(mygroup, "./assets/cards/newcards/"..cardID..".png", locx, locy)
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
  
  return mygroup
  --return display.newText("hello", gc.cx, gc.cy)
end

function foundcard(event)
  print( "Tap event on card: " .. event.target.id )
  return true
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