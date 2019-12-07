--Ferdous Sediqi
-- You_Win
-- Description: In this scene whe display the You win screen
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------
-- Use Widget Library
local widget = require( "widget" )

sceneName = "You_Win"
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-------------------------------------------------------------------------------------------------------
-- Local Sounds
------------------------------------------------------------------------------------------------------
local youWinSound =  audio.loadSound("Sounds/Correct.wav")
local yowWinSoundChannel
----------------------------------------------------------------------------------------------------
--local variable
-----------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
local bkg_image

local transitionOption =({
    effect="zoomOutInRotate",
    time = 500
})
-----------------------------------------------------------------------------------------------------
-- Local Functions 
-----------------------------------------------------------------------------------------------------
--local function gotoCake( ... )
  --  composer.gotoScene("your_cake", transitionOption)

--end
-- function for going back to main menu 
local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )

end
-- function for going to level 2 screen
local function gotoLevel2Screen()
    composer.gotoScene( "Level2_screen", transitionOption )
end
-- function for going to questions screen
local function gotoQuestions()
    composer.gotoScene( "level2_questions", transitionOption )
end
---------------------------------------------------------------------------------------------------
--Global Functions
---------------------------------------------------------------------------------------------------
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
-- create the going back button to main menu screen 
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
-- Creating button for going to questions screen
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

--Creating button fo going back 2 level 2 screen
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
    
     -- Associating display objects with this scenes 
    sceneGroup:insert( bkg_image )
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


        elseif ( phase == "did" ) then
    end 
end
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
end --function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- ADD EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene