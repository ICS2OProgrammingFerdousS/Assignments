--name: Ferdous
-- title:levelSelect_screen.lua
-- Description: in this assignment we add the you level select screen that user can chose what level they want

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
sceneName = "levelSelect_screen"

-- Creating Scene Object
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

--------------------------------------------------------------------------------------------
-- local Sounds
--------------------------------------------------------------------------------------------
local youLost = audio.loadSound("Sounds/Correct.wav")
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
--transition variables
local transitionOption3 =({
    effect="zoomOutInRotate",
    time = 500
})
--transition variables
local transitionOptions4 = ({
     effect = "fromBottom",
     time = 1000
})

--------------------------------------------------------------------------------------------------
--local functions
---------------------------------------------------------------------------------------------------

-- function for going back to main menu screen

local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )
end
-- function for going to level 2 screen 

local function gotoLevel2Screen()
    composer.gotoScene( "Level2_screen", transitionOption2 )
end
-- function for going back to the questions 
local function gotoQuestions()
    composer.gotoScene( "level2_questions", transitionOption2 )
end
local function GotoLevel1Screen()
    composer.gotoScene( "Level2_screen", transitionOption3 )
end
-- function for level 3
local function GotoLevel3Screen()
    composer.gotoScene( "Level2_screen", transitionOption4 )
end
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
    bkg_image = display.newImage("Images/vector.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

-- button for going back to main menu screen
    backButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/2,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/BackButtonUnPressedFerdous@2x.png",
    overFile = "Images/BackButtonPressedFerdous@2x - Copy.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    })

-- button for going back to questions screen
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

--creation button for going to level 2 screen 
    backButton3 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.3,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/Level2ButtonUnPressedFerdous@2x.png",
    overFile = "Images/Level2ButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = gotoLevel2Screen
    })
    backButton4 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.3,
    y = display.contentHeight*15/22,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/BackToLevel1UnPressedButtonFerdous@2x.png",
    overFile = "Images/BackToLevel1ButtonPressedFerdous@2x .png",
    -- Setting Functional Properties
    onRelease = gotoLevel2Screen
    })

    backButton5 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/2,
    y = display.contentHeight*15/22,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/SkipLevelButtonUnPressedFerdous@2x .png",
    overFile = "Images/SkipLevelButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = GotoLevel3Screen
    })

    backButton6 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/4,
    y = display.contentHeight*15/22,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/GoToLevel3ButtonUnPressedFerdous@2x.png",
    overFile = "Images/GoToLevel3ButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = GotoLevel3Screen
    })


-----------------------------------------------------------------------------------------
    -- Associating display objects with this scenes 
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( backButton )
    sceneGroup:insert( backButton2 )
    sceneGroup:insert( backButton3 )
    sceneGroup:insert( backButton4 )
    sceneGroup:insert( backButton5 )
    sceneGroup:insert(backButton6)

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