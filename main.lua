require 'new_game'
require 'game_config'
widget = require 'widget'
local composer = require('composer')

-- init game
local opt = {
  effect = "fade",
  time = 500
}
composer.gotoScene("new_game", opt)