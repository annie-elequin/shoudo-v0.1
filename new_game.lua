local composer = require( "composer" )
local scene = composer.newScene()

----------------------------------------------------------------------------------
-- 
--      NOTE:
--      
--      Code outside of listener functions (below) will only be executed once,
--      unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------


-- local forward references should go here --
require 'shoudo'

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

function new_game()
  -- put the background on the screen
  init_background()
  loadMenu()
  readCards()
end

function init_background()

    print("*****\ninitializing background...")
    -- get the background image, and set it to the center
    Shoudo.bg.img = display.newImage(GameConfig.bg,
              GameConfig.cx, GameConfig.cy)
    print("background initialized")
end
  
-- TODO create menu
function loadMenu()
    print("*****\nloading menu...")
    
    -- display and scale the Shoudo logo
    logo = display.newImage("./assets/logo2-white.png")
    logo:scale(.10,.10)
    logo.x = GameConfig.cx-GameConfig.cw/4.3
    logo.y = GameConfig.cy
    
    -- put in "play game" button
    play_options = {
      x = GameConfig.cx+GameConfig.cx/1.7,
      y = GameConfig.cy-GameConfig.cy/3.8,
      width = GameConfig.cw-GameConfig.cw/1.6,
      height = GameConfig.cy-GameConfig.cy/1.3,
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
    
    print("menu loaded")
end

function readCards()
  -- 
end

-- begin gameplay
function play()
  print("*****\nplaying game")
  
  -- shuffle the deck and create the "board" table
  
  local opt = {
    effect = "fade",
    time = 1000
  }
  composer.gotoScene("gameplay", opt)
end



-- Called when the scene's view does not exist:
function scene:createScene( event )
        local group = self.view

    -----------------------------------------------------------------------------

    --      CREATE display objects and add them to 'group' here.
    --      Example use-case: Restore 'group' from previously saved state.

    -----------------------------------------------------------------------------

end


-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
       local group = self.view

     -----------------------------------------------------------------------------

     --      This event requires build 2012.782 or later.

     -----------------------------------------------------------------------------

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        local group = self.view

         -----------------------------------------------------------------------------

        --      INSERT code here (e.g. start timers, load audio, start listeners, etc.)

        -----------------------------------------------------------------------------

 end


 -- Called when scene is about to move offscreen:
 function scene:exitScene( event )
         local group = self.view

         -----------------------------------------------------------------------------

         --      INSERT code here (e.g. stop timers, remove listeners, unload     sounds,etc.)

-----------------------------------------------------------------------------

 end


-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
        local group = self.view

    -----------------------------------------------------------------------------

    --      This event requires build 2012.782 or later.

    -----------------------------------------------------------------------------

 end


 -- Called prior to the removal of scene's "view" (display group)
  function scene:destroyScene( event )
         local group = self.view

         -----------------------------------------------------------------------------

         --      INSERT code here (e.g. remove listeners, widgets, save state, etc.)

         -----------------------------------------------------------------------------

 end


-- Called if/when overlay scene is displayed via storyboard.showOverlay()
 function scene:overlayBegan( event )
         local group = self.view
         local overlay_name = event.sceneName  -- name of the overlay scene

         -----------------------------------------------------------------------------

         --      This event requires build 2012.797 or later.

         -----------------------------------------------------------------------------

 end


 -- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
  function scene:overlayEnded( event )
         local group = self.view
         local overlay_name = event.sceneName  -- name of the overlay scene

         -----------------------------------------------------------------------------

         --      This event requires build 2012.797 or later.

         -----------------------------------------------------------------------------

 end



  ---------------------------------------------------------------------------------
  -- END OF YOUR IMPLEMENTATION
  ---------------------------------------------------------------------------------

 -- "createScene" event is dispatched if scene's view does not exist
  scene:addEventListener( "createScene", scene )

  -- "willEnterScene" event is dispatched before scene transition begins
  scene:addEventListener( "willEnterScene", scene )

 -- "enterScene" event is dispatched whenever scene transition has finished
  scene:addEventListener( "enterScene", scene )

  -- "exitScene" event is dispatched before next scene's transition begins
  scene:addEventListener( "exitScene", scene )

  -- "didExitScene" event is dispatched after scene has finished transitioning out
  scene:addEventListener( "didExitScene", scene )

 -- "destroyScene" event is dispatched before view is unloaded, which can be
  -- automatically unloaded in low memory situations, or explicitly via a call to
  -- storyboard.purgeScene() or storyboard.removeScene().
  scene:addEventListener( "destroyScene", scene )

 -- "overlayBegan" event is dispatched when an overlay scene is shown
 scene:addEventListener( "overlayBegan", scene )

 -- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
 scene:addEventListener( "overlayEnded", scene )

  ---------------------------------------------------------------------------------

  return scene