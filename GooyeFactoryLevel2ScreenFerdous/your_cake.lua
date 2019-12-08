-- Ferdous
-- credits_screen.lua
-- Created by: Daniel Lopez-Carreon
-- Date: Nov. 10th, 2019
-- Description: This is the you win screen
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )


-- Creating Scene Object
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string
-- Naming Scene
sceneName = "your_cake"
-----------------------------------------------------------------------------------------
-- local variable for sound effect
local youWinSound =  audio.loadSound("Sounds/Correct.wav")
local yowWinSoundChannel

-----------------------------------------------------------------------------------------
--local variable
-----------------------------------------------------------------------------------------
local bkg_image
local function YouWin( )
    composer.gotoScene( "You_Win", {effect = "fromLeft", time = 1000})

end   


local function gotoMainMenu( )
    composer.gotoScene( "main_menu", {effect = "fromLeft", time = 1000})

end   

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/youWinFerdous@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    -- creating baking button 
     --creationg bake text
    bakeText =  display.newText(" Great job do you want to bake the cake?", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)
    bakeText.x = 500
    bakeText.y = 250
    bakeText:setTextColor(0/255, 255/255, 255/255)
    yesButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/3,
    y = display.contentHeight*15/27,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
    defaultFile = "Images/YesButtonPressedFerdous@2x.png",
    overFile = "Images/YesButtonUnPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = YouWin
})
    -- Setting Position
   noButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.5,
    y = display.contentHeight*15/27,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
    defaultFile = "Images/NoButtonPressedFerdous@2x.png",
    overFile = "Images/NoButtonUnPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = gotoMainMenu
    })
    sceneGroup:insert( yesButton )
    sceneGroup:insert( noButton )

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
        -- display the win sound
            yowWinSoundChannel = audio.play(youWinSound)

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
               -- YouWin()

        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

        elseif ( phase == "did" ) then
    --    display the sound effect
            composer.removeScene("your_cake")
            bakeText.isVisible = false


end --function scene:hide( event )
end
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

-----------------------------------------------------------------------------------------

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