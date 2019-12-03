-----------------------------------------------------------------------------------------
-- Title: splash screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a splash screen that shows the game company logo

-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "main_menu")
display.setDefault("background", 0.5, 0.7, 1)





