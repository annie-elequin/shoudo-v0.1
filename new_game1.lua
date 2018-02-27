local composer = require( "composer" )
require 'shoudo'

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

  
