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
local backgroundSound = audio.loadSound("Sounds/Let it Go .mp3")
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
local chocolate_image
local egg_image
local bowl_image
local flour_image
local sugar_image

local touchChocolate = false
local touchButter = false
local touchFlour = false
local touchEggs = false
local touchSugar = false

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

local function movingChocolate(touch)
    --only work if none of the other boxes have been touched
    if (touchButter == false) and 
        (touchEggs == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            touchChocolate = true
          

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            chocolate_image.x = touch.x
            chocolate_image.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then
            touchChocolate = false
            chocolate_image.x = 960
            chocolate_image.y = 130
              -- if the number is dragged into the userAnswerBox, place it in the center of it
                
            
        end
        end
    end
    local function movingButter(touch)
    --only work if none of the other boxes have been touched
    if (touchSugar == false) and 
        ( touchFlour == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            touchButter = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            butter_image.x = touch.x
            butter_image.y = touch.y

        elseif (touch.phase == "ended") then
            touchButter = false
            butter_image.x = 960
            butter_image.y = 310

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
         
      end
      end
        end

local function movingEggs(touch)
    --only work if none of the other boxes have been touched
    if (touchChocolate == false) and 
        ( touchButter == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            touchEggs = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            egg_image.x = touch.x
            egg_image.y = touch.y

        elseif (touch.phase == "ended") then
            touchEggs = false
            egg_image.x = 960
            egg_image.y = 410

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
         
      end
      end
        end

local function movingFlour(touch)
    --only work if none of the other boxes have been touched
    if (touchChocolate == false) and 
        ( touchEggs == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            touchFlour = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            flour_image.x = touch.x
            flour_image.y = touch.y

        elseif (touch.phase == "ended") then
            touchFlour = false
            flour_image.x = 960
            flour_image.y = 225
        end
      end
    end

    local function movingSugar(touch)
    --only work if none of the other boxes have been touched
    if (touchChocolate == false) and 
        ( touchFlour == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            touchSugar = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            sugar_image.x = touch.x
            sugar_image.y = touch.y

        elseif (touch.phase == "ended") then
            touchSugar = false
            sugar_image.x = 960
            sugar_image.y = 500
        end
      end
    end
      local function AddAnswerBoxEventListeners()
        chocolate_image:addEventListener("touch", movingChocolate)
        butter_image:addEventListener("touch", movingButter)
        egg_image:addEventListener("touch", movingEggs)
        flour_image:addEventListener("touch", movingFlour)
        sugar_image:addEventListener("touch", movingSugar)

end 

-- Function that Removes Listeners to each answer box
local function RemoveAnswerBoxEventListeners()
    chocolate_image:removeEventListener("touch", movingChocolate)
    egg_image:removeEventListener("touch", movingButter)
    egg_image:removeEventListener("touch", movingEggs)
    flour_image:removeEventListener("touch", movingFlour)
    sugar_image:removeEventListener("touch", movingSugar)

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

    bowl_image =display.newImageRect("Images/bowlPlaceholder.png", display.contentWidth, display.contentHeight) 
    bowl_image.x = 600
    bowl_image.y = 430
    bowl_image.width = 200
    bowl_image.height = 200
    sceneGroup:insert(bowl_image)


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

    chocolate_image = display.newImageRect("Images/Chocolate.png", display.contentWidth, display.contentHeight)
    chocolate_image.x = 960
    chocolate_image.y = 130
    chocolate_image.width = 90
    chocolate_image.height = 50
    sceneGroup:insert(chocolate_image)
   
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
        AddAnswerBoxEventListeners()

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
        RemoveAnswerBoxEventListeners()
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