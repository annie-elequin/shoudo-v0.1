local composer = require( "composer" )
require 'shoudo'
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    sceneGroup:insert(init_background())
    sceneGroup:insert(loadMenu())
    
    readCards("./cards.txt")
 
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
-- my functions!
-- -----------------------------------------------------------------------------------

 function new_game()
  -- put the background on the screen
  init_background()
  loadMenu()
  readCards()
end

function init_background()

    print("*****\ninitializing background...")
    -- get the background image, and set it to the center
    Shoudo.bg.img = display.newImage(gc.bg,
              gc.cx, gc.cy)
    print("background initialized")
    return Shoudo.bg.img
end
  
-- TODO create menu
function loadMenu()
    print("*****\nloading menu...")
    
    menu = display.newGroup()
    
    -- display and scale the Shoudo logo
    logo = display.newImage("./assets/logo2-white.png")
    logo:scale(.10,.10)
    logo.x = gc.cx-gc.cw/4.3
    logo.y = gc.cy
    
    -- put in "play game" button
    play_options = {
      x = gc.cx+gc.cx/1.7,
      y = gc.cy-gc.cy/3.8,
      width = gc.cw-gc.cw/1.6,
      height = gc.cy-gc.cy/1.3,
      id = "play_btn",
      label = "Play Game",
      labelAlign = "center",
      labelColor = { default = {0}, over = {0.8} },
      fontSize = 25,
      fillColor = { default = {1}, over = {.8} },
      shape = "roundedRect",
      cornerRadius = 40,
      onPress = play
    }
    play = widget.newButton(play_options)
    
    menu:insert(logo)
    menu:insert(play)
    print("menu loaded")
    
    return menu
end

-- begin gameplay
function play()
  print("*****\nplaying game")
  
  -- shuffle the deck and create the "board" table
  
  local opt = {}
  composer.gotoScene("gameplay", opt)
end

function readCards(fileName)
  local file, errorString = io.open(fileName, "r")
  cards = {}
  
  if not file then
    -- error occured; output cause
    print("file error: "..errorString)
  else 
    -- the file opened correctly 
    -- read in the number of cards
    local num = file:read("*l")
    print("there are "..num.." cards")
    
    -- for the number of cards in the file
    for i = 1, tonumber(num) do   
      local line = file:read("*l") -- read the line
      card = {}
      count = 0
      -- print(line)
      if line then
        for token in line:gmatch("%w+") do
          -- print("tok: "..token.." count: "..tostring(count))
          
          -- assign each token to the appropriate tag
          if count == 0 then card.id = token
          elseif count == 1 then card.clan = token
          elseif count == 2 then card.piece = token
          elseif count == 3 then card.type = token
          elseif count == 4 then card.val = token
          elseif count == 5 then card.status = token
          else print('boop') end -- end if
          count = count+1 -- increment count
        end -- end for token
      end -- end if line
      
      card.img = "./assets/cards/newcards/cards-with-values/"..card.id..".png"
      card.imgBurned = "./assets/cards/newcards/cards-with-values/"..card.id.."-burn.png"
      
      -- add the newly created card to the "cards" table
      if(cards) then table.insert(cards, card) end 
      
    end -- end "for each line" block
  end -- end "if file" 
  io.close(file)
  file = nil
  
  Shoudo.deck = cards
end -- end function
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene