--Title: splash screen/MainMenue
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a main menu, instructio, and level 1 screen.
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )
local widget = require( "widget" )

-- Name the Scene
sceneName = "Level1_screen"
scene = composer.newScene(sceneName)
--------------------------------------------------------------------------------
--local sounds
---------------------------------------------------------------------------------
local backgroundSound = audio.loadSound("Sounds/Hoot.wav")
local backgroundSoundChannel
-----------------------------------------------------------------------------------------
-- Create Scene Object
local scene = composer.newScene( sceneName )
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------- 
-- The local variables for this scene
local beetleship
local scrollXSpeed = 10
local scrollYSpeed = -5
local jungleSounds = audio.loadSound("Sounds/animals144.mp3")
local jungleSoundsChannel
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------
-- The function that will go to the main menu 
local transitionOption =({
    effect="zoomOutInRotate",
    time = 500
})
local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    -- set the background to be black
    bkg_image = display.newImageRect("Images/Level1ScreenAlex.png", display.contentWidth, display.contentHeight)
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
    defaultFile = "Images/BackButtonUnpressedAlex@2x.png",
    overFile = "Images/BackButtonPressedAlex@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    } )
   
-----------------------------------------------------------------------------------------
-- Associating Buttons with this scene
    sceneGroup:insert( backButton )

    butter_image = display.newImageRect("Images/butter.png", display.contentWidth, display.contentHeight)
    butter_image.x = 960
    butter_image.y = 310
    butter_image.width = 100
    butter_image.height = 100

    sceneGroup:insert( butter_image )

    egg_image = display.newImageRect("Images/eggs.png", display.contentWidth, display.contentHeight)
    egg_image.x = 960
    egg_image.y = 410
    egg_image.width = 100
    egg_image.height = 100
    sceneGroup:insert(egg_image)

    sugar_image = display.newImageRect("Images/sugar.png", display.contentWidth, display.contentHeight)
    sugar_image.x = 960
    sugar_image.y = 500
    sugar_image.width = 100
    sugar_image.height = 100
    sceneGroup:insert(sugar_image)

    flour_image = display.newImageRect("Images/flour.png", display.contentWidth, display.contentHeight)
    flour_image.x = 960
    flour_image.y = 225
    flour_image.width = 100
    flour_image.height = 100
    sceneGroup:insert(flour_image)


    
end 
 -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
    local phase = event.phase
-----------------------------------------------------------------------------------------
-- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
-----------------------------------------------------------------------------------------
    elseif ( phase == "did" ) then
-- start the splash screen music
        backgroundSoundChannel = audio.play(backgroundSound, {channel = 4, loops = -1})   
    end

end 
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
        backgroundSoundChannel = audio.stop()

-- stop the jungle sounds channel for this screen
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------
-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view

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