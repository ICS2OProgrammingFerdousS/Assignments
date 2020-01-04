--Title: main_menu
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make a main menu, instructio, and level 1 screen.
---- Use Composer Library
local composer = require( "composer" )
-----------------------------------------------------------------------------------------
-- Use Widget Library
local widget = require( "widget" )

local physics = require( "physics")

-------------------------------------------------------------------------------------------
-- Creating Scene Object
local scene = composer.newScene( sceneName)
---------------------------------------------------------------------------------------
-- Naming Scene
sceneName = "main_menu"
---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton

 soundOn = true

--VARIABLES for questions 
-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------
-- backgroundSound
local sound = audio.loadSound("Sounds/buddy.mp3")
local soundChannel 
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local transitionOption =({
    effect="zoomOutInRotate",
    time = 400
})


--transition variables
local transitionOption2 =({
    effect="zoomOutInRotate",
    time = 400
})

--transition variables
local transitionOptions4 = ({
     effect = "fromTop",
     time = 500
})
-- function for mute and 
local function Mute( touch )
    if(touch.phase == "ended")then
        --pause the sound
        audio.resume(soundChannel)
        --set boolean for sound status
        soundOn = true
        muteButton.isVisible = false
        unmuteButton.isVisible = true
    end 
end

--function for unMute

local function Unmute( touch )
    if(touch.phase == "ended")then
        --play the music 
        audio.pause(soundChannel)
        --set boolean for sound status
        soundOn = false
        muteButton.isVisible = true
        unmuteButton.isVisible = false
    end
end

local function CreditsTransition( )       
    composer.gotoScene( "Credit", transitionOptions4)
    clickSoundChannel = audio.play(clickSound)
end 
-----------------------------------------------------------------------------------------

 --Creating Transition to Level1 Screen
local function Level2ScreenTransition( )
    composer.gotoScene( "level4_screen", transitionOption2)
    clickSoundChannel = audio.play(clickSound)


end   
-----------------------------------------------------------------------------------------

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function gotoInstructions( )
    composer.gotoScene("Instruction", transitionOption)
    clickSoundChannel = audio.play(clickSound)
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
-- BACKGROUND IMAGE & STATIC OBJECTS
-----------------------------------------------------------------------------------------
 -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuAlex@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------   
    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
         x = display.contentWidth*6/8,
         y = display.contentHeight*4/10,
          -- Setting Dimensions
         width = 150,
         height = 70,
         -- Insert the images here
         defaultFile = "Images/PlayButtonUnpressedAlex@2x.png", 150, 100,
         overFile = "Images/PlayButtonPressedAlex@2x.png", 150, 100,
         --
         -- When the button is released, call the Level1 screen transition function
         onRelease = Level2ScreenTransition    
 } )
    sceneGroup:insert( playButton )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
        x = display.contentWidth*6/8,
        y = display.contentHeight*6/10,
         -- Setting Dimensions
        width = 150,
        height = 70,

            -- Insert the images here
        defaultFile = "Images/creditsButtonUnpressedAlex@2x.png", 150, 100,
        overFile = "Images/creditsButtonPressedAlex@2x.png", 150, 100,
        -- When the button is released, call the Credits transition function
        onRelease = CreditsTransition
} ) 
    sceneGroup:insert( creditsButton )

    -----------------------------------------------------------------------------------------

    -- ADD INSTRUCTIONS BUTTON WIDGET
    instructionsButton = widget.newButton( 
        {
        -- Set its position on the screen relative to the screen size
        x = display.contentWidth*6/8,
        y = display.contentHeight*8/10,
        -- Setting Dimensions
        width = 150,
        height = 70,
        -- Insert the images here
         defaultFile = "Images/InstructionsButtonUnpressedAlex@2x.png", 150, 100,
        overFile = "Images/InstructionsButtonPressedAlex@2x.png", 150, 100,
        -- When the button is released, call the Credits transition function
        onRelease = gotoInstructions
} ) 
    sceneGroup:insert( instructionsButton )
 
    -----------------------------------------------------------------------------------------

   --creating mute button
    muteButton = display.newImageRect("Images/muteButton.png", 90, 90)
    muteButton.x = 50
    muteButton.y = 40
    muteButton.isVisible = false
    sceneGroup:insert(muteButton)

    --creating mut button
    unmuteButton = display.newImageRect("Images/unmuteButton.png", 90, 90)
    unmuteButton.x = 50
    unmuteButton.y = 40
    unmuteButton.isVisible = true
    sceneGroup:insert(unmuteButton)
   
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP
    
end  

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
 -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
 -----------------------------------------------------------------------------------------
    local phase = event.phase
-----------------------------------------------------------------------------------------
-- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
      --  if(soundOn == false) then
           -- soundChannel = audio.pause(sound)
 -- The function that will go to the main menu 
----------------------------------------------------------------------------------------
    -- Called when the scene is now on screen.
    elseif ( phase == "did" ) then
        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", Unmute )
        soundChannel = audio.play(sound, {channel = 1, loops = -1})

        if(soundOn == true) then
            audio.resume(soundChannel)
            muteButton.isVisible = false
            unmuteButton.isVisible = true
        else
            audio.pause(soundChannel)
            muteButton.isVisible = true
            unmuteButton.isVisible = false
        end
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
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute )
        audio.pause(soundChannel)           
     end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
 -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
end 
-- function scene:destroy( event )

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