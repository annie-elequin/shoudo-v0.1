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
  thing = display.newText("hello", gc.cx, gc.cy)
  
  if(Shoudo.deck) then print('the thing exists') end
  cards = Shoudo.deck 
  used = {}
  num = table.maxn(cards)
  
  print("num "..tostring(num))
  for i = 1, num do
    pos = math.random(num) -- get a random card from the deck
    
    if table.indexOf(used, pos) then -- check if we've used this position before
      while table.indexOf(used, pos) do pos=pos+1 end -- increment the position 
    end -- end "if not used"
    
    table.insert(Shoudo.board, cards[pos]) -- insert the correct card into the board
    table.insert(used, pos) -- insert the index into the "used" table
  end -- end "for each card"
  
  print("display the board!")
  print(tostring(table.maxn(Shoudo.board)))
  --[[
  for i = 0, #Shoudo.board do
    if i%5==0 and i~=0 then print() end -- make a new line for a new row
    
    print(tostring(Shoudo.board[i].id).." ")
  end
  ]]--
  
  return thing
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