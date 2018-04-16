require 'new_game'
require 'game_config'
widget = require 'widget'
local composer = require('composer')

math.randomseed(os.time())

-- init game
local opt = {
  effect = "fade",
  time = 1000
}
composer.gotoScene("new_game", opt)