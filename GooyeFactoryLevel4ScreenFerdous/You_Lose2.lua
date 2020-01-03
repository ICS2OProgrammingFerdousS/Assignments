--name: Ferdous
-- title:You_Lose_screen.lua
-- Description: in this assignment we add another the you lose screen if the user cannot put the ingradients before times finish.
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )
----------------------------------------------------------------------------------------
-- Use Widget Library
local widget = require( "widget" )
----------------------------------------------------------------------------------------
-- Naming Scene
sceneName = "You_Lose2"

-- Creating Scene Object
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

--------------------------------------------------------------------------------------------
-- local Sounds
--------------------------------------------------------------------------------------------
local youLost = audio.loadSound("Sounds/boo.mp3")
local youLostChannel


-----------------------------------------------------------------------------------------
-- local variables
-----------------------------------------------------------------------------------------
-- background image variable
local bkg_image

--transition variables
local transitionOption =({
    effect="zoomOutInRotate",
    time = 500
})

--transition variables
local transitionOption2 =({
    effect="zoomInOutFade",
    time = 500
})


--------------------------------------------------------------------------------------------------
--local functions
---------------------------------------------------------------------------------------------------

-- function for going back to main menu screen

local function BackTransition()
    composer.gotoScene( "levelSelect_screen", transitionOption )
end
-- function for going to level 2 screen 


-- function for going back to the questions 
local function gotoMainMenu()
    composer.gotoScene( "main_menu", transitionOption2 )
end
-- function for level 3

---------------------------------------------------------------------------------
--Global functions
----------------------------------------------------------------------------------------
-- creation of objects
function scene:create( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
----------------------------------------------------------------------------------------
    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/YouLoseScreenFerdous.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    sceneGroup:insert( bkg_image )

-- button for going back to questions screen
    backButton1 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/4,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/BackButtonUnPressedFerdous@2x.png",
    overFile = "Images/BackButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = gotoMainMenu
    })

    sceneGroup:insert( backButton1 )

    backButton2 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.4,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/LevelSelectUnPressedButtonFerdous@2x.png",
    overFile = "Images/LevelSelectPressedButtonFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    })
    -- Associating display objects with this scenes 
    sceneGroup:insert( backButton2 )


end

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
        -- display the background sound
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
-----------------------------------------------------------------------------------------
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
-- return the scene 
return scene