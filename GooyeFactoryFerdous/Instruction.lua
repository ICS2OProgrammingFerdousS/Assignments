--Title: splash screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a main menu, instructio, and level 1 screen.
local composer = require( "composer" )
local widget = require( "widget" )
-- Naming Scene
sceneName = "Instruction"
-- Creating Scene Object
scene = composer.newScene( sceneName )
 -- This function doesn't accept a string, only 
-----------------------------------------------------------------------------------------
-- LOCAL Sounds
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
-- adding background sound
local soundEffect = audio.loadSound("Sounds/Hoot.wav")
local soundEffectChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local transitionOption = ({
    effect="zoomOutInRotate",
    time = 500
})

local  function BackTransition( )
    composer.gotoScene( "main_menu", transitionOption)
   -- soundChannel = audio.play()
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )
 -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
  -------------------------------------------------------------------------------------
  -- BACKGROUND AND DISPLAY OBJECTS
    ------------------------------------------------------------------------------------
-- Insert the background image and set it to the center of the screen
    bkg_image = display.newImageRect("Images/InstructionsScreenAlex@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
-- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
-- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()
-------------------------------------------------------------------------------------
 -- BUTTON WIDGETS
-------------------------------------------------------------------------------------
-- Creating Back Button
backButton = widget.newButton( 
{ -- Setting Position
    x = display.contentWidth*1/8,
    y = display.contentHeight*9/10,
-- Setting Dimensions
    width = 150,
    height = 70,
-- Setting Visual Properties
    defaultFile = "Images/backButtonUnpressedAlex@2x.png",
    overFile = "Images/BackButtonPressedAlex@2x.png",
 -- Setting Functional Properties
    onRelease = BackTransition
} )

-- Associating Buttons with this scene
sceneGroup:insert( backButton )
------------------------------------------------------------------------------------
--global FUNCTIONS
------------------------------------------------------------------------------------
    
-- The function called when the scene is issued to appear on screen
function scene:show( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
------------------------------------------------------------------------------------
    local phase = event.phase
-------------------------------------------------------------------------------------
    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
     -------------------------------------------------------------------------------------
    elseif ( phase == "did" ) then
        -- display background sound
        soundEffectChannel = audio.play(soundEffect, {channel = 3, loops = -1})
       
    end
end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-------------------------------------------------------------------------------------
    local phase = event.phase
-------------------------------------------------------------------------------------
    if ( phase == "will" ) then
     -- stop the sound after scene gone 
     -- Called when the scene is on screen (but is about to go off screen).
        
----------------------------------------------------------------------------------
     elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        soundEffectChannel = audio.stop()
    end
end 

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
 -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    -- Called prior to the removal of scene's view ("sceneGroup").
    end --function scene:destroy( event )
end
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
