-- Ferdous
-- credits_screen.lua
-- Created by: Daniel Lopez-Carreon
-- Date: Nov. 10th, 2019
-- Description: This is the you win screen
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------
-- sound veriables
local youLost = audio.loadSound("Sounds/boo.mp3")
local youLostChannel

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "You_Lose"

-- Creating Scene Object
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- DISPLAY OBJECTS
-----------------------------------------------------------------------------------------
local bkg_image

local transitionOption =({
    effect="zoomOutInRotate",
    time = 500
})


local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )
end

local function gotoLevel2Screen()
    composer.gotoScene( "Level2_screen", transitionOption )
end

local function gotoQuestions()
    composer.gotoScene( "level2_questions", transitionOption )
end
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/YouLoseScreenFerdous.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

backButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/2,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/MainMenuUnpressedFerdous@2x.png",
    overFile = "Images/MainMenuButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    })
backButton2 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/4,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/QuestionButtonUnPressedFerdous@2x.png",
    overFile = "Images/QuestionButtonPressedFerdous.png",
    -- Setting Functional Properties
    onRelease = gotoQuestions
    })

backButton3 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.3,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/BackToLevel2ButtonUnPressedFerdous@2x .png",
    overFile = "Images/BackToLevel2ButtonPressed@2x.png",
    -- Setting Functional Properties
    onRelease = gotoLevel2Screen
    })
   
   
-----------------------------------------------------------------------------------------

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( backButton2 )
    sceneGroup:insert( backButton3 )


end

-----------------------------------------------------------------------------------------

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
        -- display the sound
        youLostChannel = audio.play(youLost)

        
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )

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