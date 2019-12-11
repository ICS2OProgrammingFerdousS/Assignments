-- name: Ferdous
--title: You_Win screen
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
sceneName = "You_win"
-----------------------------------------------------------------------------------------
-- local variable for sound effect
local youWinSound =  audio.loadSound("Sounds/Correct.wav")
local yowWinSoundChannel

-----------------------------------------------------------------------------------------
--local variable
-----------------------------------------------------------------------------------------
local bkg_image
local function YouWin( )
    composer.gotoScene( "your_cake", {effect = "fromLeft", time = 3000})

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
    bakeText =  display.newImage("Images/textFerdous.png")
    bakeText.x = 500
    bakeText.y = 200
    bakeText.width = 900
    bakeText.height = 900


    yesButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/3,
    y = display.contentHeight*15/21,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
    defaultFile = "Images/BakeButtonUnpressedAlex@2x.png",
    overFile = "Images/BakeButtonPressedAlex@2x.png",
    -- Setting Functional Properties
    onRelease = YouWin
})
    -- Setting Position
   noButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.5,
    y = display.contentHeight*15/21,
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
    sceneGroup:insert( bakeText )



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
    -----------------------------------------------------------------------------------------

        elseif ( phase == "did" ) then
    --    display the sound effect
            composer.removeScene("You_Win")
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