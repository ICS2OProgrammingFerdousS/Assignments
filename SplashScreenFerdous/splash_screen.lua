


--
---- Title: splash screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a splash screen that shows the game company logo
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"
-------------------------------------------------------------------------------------------------
--backgroundColor
------------------------------------------------------------------------------------------------

display.setDefault("background", 0.7, 1, 1)

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local companyLogo
local scrollXSpeed = 1
local scrollYSpeed = 1
local backgroundSound = audio.loadSound("Sounds/simon.wav")

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function logoEntry()
--scalling the image 
    companyLogo.xScale = companyLogo.xScale + 0.02 
    companyLogo.yScale = companyLogo.yScale + 0.02
   
end

local function movingLogo()
    companyLogo.x = companyLogo.x + scrollXSpeed
    end
-- The function that will go to the main menu 
local function gotoMenu()
    composer.gotoScene( "main_menu" )
end
-------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the beetleship image
    companyLogo = display.newImageRect("Images/CompanyLogoFerdous@2x.png", 200, 200)

    -- set the initial x and y position of the beetleship
    companyLogo.x = 500
    companyLogo.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( companyLogo )

end -- function scene:create( event )


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
   backgroundSoundChennal = audio.play(backgroundSound )
-- Call the moveBeetleship function as soon as we enter the frame.
  Runtime:addEventListener("enterFrame", logoEntry )
 -- Go to the main menu screen after the given time.
   timer.performWithDelay (4500, gotoMenu)
    end
end

--function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    
    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen

    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
   end

    -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

--Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------
return scene
