 
---- Title: splash screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a splash screen that shows the game company logo
-----------------------------------------------------------------------------------------

--  Composer for Library
local composer = require( "composer" )
-- Name the Scene
sceneName = "splash_screen"
-------------------------------------------------------------------------------------------------
--backgroundColor
------------------------------------------------------------------------------------------------
-- Create Scene Object
local scene = composer.newScene( sceneName )
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local companyLogo
local scrollXSpeed = 10
local scrollYSpeed = 10
local backgroundSound = audio.loadSound("Sounds/simon.wav")

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------
-- The function that moves the logo across the screen
local function logoEntry()
	--scalling the image 
	companyLogo.xScale = companyLogo.xScale + 0.03
	companyLogo.yScale = companyLogo.yScale + 0.03
end

local function movingLogo()
companyLogo.x = companyLogo.x + scrollXSpeed
end
-- The function that will go to the main menu 
local function gotoMenu()
composer.gotoScene( "main_menu" )
end
-------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )
	-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
 -- set the background to be black
	display.setDefault("background", 0, 0, 0)
-- Insert the beetleship image
	companyLogo = display.newImageRect("Images/CompanyLogoFerdous@2x.png", 200, 200)
-- set the initial x and y position of the beetleship
	companyLogo.x = 500
	companyLogo.y = display.contentHeight/2
-- Insert objects into the scene group in order to ONLY be associated with this scene
	sceneGroup:insert( companyLogo )
end 


--------------------------------------------------------------------------------------------
-- The function called when the scene is should to appear on screen
--------------------------------------------------------------------------------------------
function scene:show( event )
	-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
-----------------------------------------------------------------------------------------
	local phase = event.phase
-----------------------------------------------------------------------------------------
	-- Called when the scene is still off screen (but is about to come on screen).
	if ( phase == "will" ) then
----------------------------------------------------------------------------------------
	elseif ( phase == "did" ) then
	-- start the splash screen music
	backgroundSoundChennal = audio.play(backgroundSound )
	-- Call the moveBeetleship function as soon as we enter the frame.
	Runtime:addEventListener("enterFrame", logoEntry )
	-- timer for function duration
	timer.performWithDelay (3500, gotoMenu)
	end
end
 ------------------------------------------------------------------------------------
--function scene:show( event )
----------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )
-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
	local phase = event.phase
-----------------------------------------------------------------------------------------
	if ( phase == "will" ) then  
-----------------------------------------------------------------------------------------
-- Called immediately after scene goes off screen.
	elseif ( phase == "did" ) then
-- stop the jungle sounds channel for this screen
	end
end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
 -----------------------------------------------------------------------------------------
 end
-----------------------------------------------------------------------------------------
	-- EVENT LISTENERS
-----------------------------------------------------------------------------------------
	scene:addEventListener( "create", scene )
	scene:addEventListener( "show", scene )
	scene:addEventListener( "hide", scene )
	scene:addEventListener( "destroy", scene )
----------------------------------------------------------------------------------------
	--return the scene
	return scene
