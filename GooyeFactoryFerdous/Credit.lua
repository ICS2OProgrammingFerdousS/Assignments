--Title: splash screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a main menu, instructio, and level 1 screen.
local composer = require( "composer" )
local widget = require( "widget" )
-----------------------------------------------------------------------------------------
-- Naming Scene
sceneName = "Credit"
-- Creating Scene Object
scene = composer.newScene( sceneName ) 
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
-- Adding background sound to the scene
local backgroundMusic = audio.loadSound("Sounds/T3.wav")
local backgroundMusicChannel
-- adding click sound
local clickSound = audio.loadSound("Sounds/PopSound.wp3.wav")
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- Creating Transitioning Function back to main menu
local transitionOption =({
	effect="fromRight",
    time = 500
})
local function BackTransition( )
	composer.gotoScene( "main_menu", transitionOption)
   -- local  clickSound = audio.play(clickSound)
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )
 -- Creating a group that associates objects with the scene
	local sceneGroup = self.view
-----------------------------------------------------------------------------------------
 -- BACKGROUND AND DISPLAY OBJECTS
-----------------------------------------------------------------------------------------
-- Insert the background image and set it to the center of the screen
	bkg_image = display.newImageRect("Images/CreditsScreenFerdous@2x (1).png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()
-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------
   -- Creating Back Button
   backButton = widget.newButton( 
   {
        -- Setting Position
	x = display.contentWidth*1/8,
    y = display.contentHeight*15/16,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
    defaultFile = "Images/BackButtonUnPressedAlex@2x.png",
    overFile = "Images/BackButtonPressedAlex@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    } )
-----------------------------------------------------------------------------------------
-- Associating Buttons with this scene
	sceneGroup:insert( backButton ) 
end 
--function scene:create( event )

-- The function called when the scene is issued to appear on screen
function scene:show( event )
-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
	-----------------------------------------------------------------------------------------
    local phase = event.phase
    -----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
 -- Called when the scene is still off screen (but is about to come on screen).
 -----------------------------------------------------------------------------------------
    elseif ( phase == "did" ) then
     --display backgroundMusic
    backgroundMusicChannel = audio.play(backgroundMusic, {channels = -1, loops = -1})

    end
end 

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to leave the screen
function scene:hide( event )

-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
 -----------------------------------------------------------------------------------------
    local phase = event.phase
 -----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
        --stpping the function the backgroundMusic after scene
	backgroundMusic = audio.stop()
        
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        audio.stop(backgroundMusicChannel)
    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is  to be destroyed
function scene:destroy( event )
-- Creating a group that associates objects with the scene
	local sceneGroup = self.view
-----------------------------------------------------------------------------------------
end

--function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

