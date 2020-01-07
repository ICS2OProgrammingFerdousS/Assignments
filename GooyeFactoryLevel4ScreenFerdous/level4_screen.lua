--Title: Level2_screen
-- Name: Ferdous Sediqi
-- Course: ICS2O
-- in This this assigment i will make the level 4 screen.
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")

-----------------------------------------------------------------------------------------
-- Create Scene Object
local scene = composer.newScene( sceneName )
------------------------------------------------------------------------------------------
-- Name the Scene
sceneName = "level4_screen"

--------------------------------------------------------------------------------
--local sounds
---------------------------------------------------------------------------------
local backgroundSound = audio.loadStream("Sounds/sweet.mp3")
local backgroundSoundChannel

local touchSound = audio.loadStream("Sounds/PopSound.wav")
local touchSoundChannel

local foodSound = audio.loadStream("Sounds/water.mp3")
local foodSoundChannel
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------- 
-- text for finishing cooking
local readyText


--variables for the touch of the objects
local touchVanilla = false
local touchMilk = false
local touchVanillaBean = false
local touchEggs = false
local touchOil = false
local wrongFlourTouch = 0

--variables for the questions
local answerTextObject 
local wrongAnswer1TextObject
local wrongAnswer2TextObject
local wrongAnswer3TextObject
local wrongAnswer4TextObject

local answer 
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3
local wrongAnswer4
local scrollSpeed = 2

-- The local variables for the timer
local totalSeconds = 15
local secondsLeft =  15
local clockText 
local countDownTimer

 --variables for sounds mute and unMute

--------------------------------------------------------------------------------------
--set variables for making scene transition
------------------------------------------------------------------------------------------
local transitionOption =({
    effect="crossFade",
    time = 500
})

local transitionOption2 =({
    effect="flipFadeOutIn",
    time = 500
})
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------
-- function for mute and 
local function Mute( touch )
    if(touch.phase == "ended")then
        --pause the sound
        audio.resume(backgroundSoundChannel)
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
        audio.pause(backgroundSoundChannel)
        --set boolean for sound status
        soundOn = false
        muteButton.isVisible = true
        unmuteButton.isVisible = false
    end
end
-- The function that will go to the main menu 

local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption2 )
end

local function gotoQuestions( ... )
    composer.gotoScene("level4_questions", transitionOption)
end

local function GotoYouLose( ... )
    composer.gotoScene("You_Lose2")
end

local function  yesButtonVisible()
    yesButton.isVisible = true
end

local function movingVanilla(touch)

    if (touchMilk == false) and (touchOil == false) and 
        (touchEggs == false) and (touchVanillaBean == false) then

        if (touch.phase == "began") then
            --boolean for click the gredian
            touchVanilla = true
            instructionText.isVisible = false
            touchSoundChannel = audio.play(touchSound)

            --drag the objects to follow the mouse
        elseif (touch.phase == "moved") then
            vanilla_image.x = touch.x
            vanilla_image.y = touch.y

            -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            touchVanilla = false

            if (((bowl_image.x - bowl_image.width/1) < vanilla_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > vanilla_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < vanilla_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > vanilla_image.y ) ) then

                -- setting the position of the chocolate to be in the center of the box
                vanilla_image.x = bowl_image.x
                vanilla_image.y = bowl_image.y
                foodSoundChannel = audio.play(foodSound)

                vanilla_image.isVisible = false                
                checkMark2.isVisible = true
                smallVanilla.isVisible = true
              
            end

            vanilla_image.x = 960
            vanilla_image.y = 130
        end

        if(checkMark.isVisible == true)and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButton.isVisible = true
            yesButtonVisible()
        end
    end
end



local function MovingVanillaBean(touch)
--only work if none of the other objects have been touched
    if (touchVanilla == false) and (touchOil == false) and 
        (touchMilk == false) and (touchEggs == false) then 

        if (touch.phase == "began") then
            instructionText.isVisible = false

            --let see other objects know it has been clicked
            touchVanillaBean = true       
            touchSoundChannel = audio.play(touchSound)

        elseif (touch.phase == "moved") then
            --dragging function
            vanillaBean_image.x = touch.x
            vanillaBean_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchVanillaBean = false
            if (((bowl_image.x - bowl_image.width/1) < vanillaBean_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > vanillaBean_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < vanillaBean_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > vanillaBean_image.y ) ) then
            -- setting the position of the number to be in the center of the box
                vanillaBean_image.x = bowl_image.x
                vanillaBean_image.y = bowl_image.y
                foodSoundChannel = audio.play(foodSound)

                vanillaBean_image.isVisible = false
                checkMark3.isVisible = true
                smallVanillaBean.isVisible = true

            end
            vanillaBean_image.x = 960
            vanillaBean_image.y = 225
       
        end

        if(checkMark.isVisible == true)and(checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and(checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButtonVisible()            
        end
    end
end
local function movingMilk(touch)
        --only work if none of the other objects have been touched
    if (touchVanillaBean == false) and (touchVanilla == false) and 
        (touchOil == false) and (touchEggs == false) then

        if (touch.phase == "began") then
            instructionText.isVisible = false

            -- boolean to  know it has been clicked
            touchMilk = true  
            touchSoundChannel = audio.play(touchSound)
        elseif (touch.phase == "moved") then
            --dragging function
            milk_image.x = touch.x
            milk_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchMilk = false
            if (((bowl_image.x - bowl_image.width/1) < milk_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > milk_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < milk_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > milk_image.y ) ) then
                -- setting the position of butter
                milk_image.x = bowl_image.x
                milk_image.y = bowl_image.y
                foodSoundChannel = audio.play(foodSound)
                milk_image.isVisible = false
                checkMark.isVisible = true
                smallMilk.isVisible = true

        end
                 milk_image.x = 960
                 milk_image.y = 310
     end

        if(checkMark.isVisible == true) and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButtonVisible()            
            
        end
    end
end


local function movingEggs(touch)
--only work if none of the other objects have been touched
    if (touchMilk == false) and (touchOil == false) and
        (touchVanilla == false) and (touchVanillaBean == false) then  

        if (touch.phase == "began") then
            instructionText.isVisible = false

            --boolean know it has been clicked
            touchEggs = true 
            touchSoundChannel = audio.play(touchSound)

        elseif (touch.phase == "moved") then
            --dragging function
            egg_image.x = touch.x
            egg_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchEggs = false
            if (((bowl_image.x - bowl_image.width/1) < egg_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > egg_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < egg_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > egg_image.y ) ) then
                -- setting the position of the objects to be in the center of the box
                egg_image.x = bowl_image.x
                egg_image.y = bowl_image.y
                foodSoundChannel = audio.play(foodSound)
                egg_image.isVisible = false
                checkMark5.isVisible = true
                smallEggs.isVisible = true

        end
            egg_image.x = 960
            egg_image.y = 410
         
        end

        if(checkMark.isVisible == true) and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButtonVisible()            
           
        end
    end
end

local function movingOil(touch)
--only work if none of the other objects have been touched
    if (touchVanilla == false) and (touchVanillaBean == false) and 
        (touchMilk == false) and (touchEggs == false) then    

        if (touch.phase == "began") then
            instructionText.isVisible = false

            --boolean to know it has been clicked
            touchOil = true  

            touchSoundChannel = audio.play(touchSound)

        elseif (touch.phase == "moved") then
            --dragging function
            oil_image.x = touch.x
            oil_image.y = touch.y
        elseif (touch.phase == "ended") then
            touchOil = false
            if (((bowl_image.x - bowl_image.width/1) < oil_image.x ) and
            ((bowl_image.x + bowl_image.width/2) > oil_image.x ) and 
            ((bowl_image.y - bowl_image.height/2) < oil_image.y ) and 
            ((bowl_image.y + bowl_image.height/2) > oil_image.y ) ) then
                -- setting the position of the sugar to be in the center of the box
                oil_image.x = bowl_image.x
                oil_image.y = bowl_image.y
                foodSoundChannel = audio.play(foodSound)

                oil_image.isVisible = false
                checkMark4.isVisible = true
                smallOil.isVisible = true
                smallVanilla.isVisible = false
                smallEggs.isVisible = false
            end
            oil_image.x = 960
            oil_image.y = 520
        end
    end
        if(checkMark.isVisible == true) and (checkMark2.isVisible == true) and
            (checkMark3.isVisible == true) and (checkMark4.isVisible == true) and
            (checkMark5.isVisible == true) then
            readyImage.isVisible = true
            yesButtonVisible()            
           
        end
end

-- timer counting function 
local function UpdateTime( )
    secondsLeft = secondsLeft - 1
    clockText.text = secondsLeft .. ""
    if(secondsLeft == 0)then
        secondsLeft = totalSeconds
        GotoYouLose()


    end
end
-- FUNCTION start the timer again
local  function startTimer( )
  countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end


local function AddAnswerBoxEventListeners()
    vanilla_image:addEventListener("touch", movingVanilla)
    milk_image:addEventListener("touch", movingMilk)
    egg_image:addEventListener("touch", movingEggs)
    vanillaBean_image:addEventListener("touch", MovingVanillaBean)
    oil_image:addEventListener("touch", movingOil)
    


end 

-- Function that Removes Listeners to each objects
local function RemoveAnswerBoxEventListeners()
    vanilla_image:removeEventListener("touch", movingVanilla)
    milk_image:removeEventListener("touch", movingMilk)
    egg_image:removeEventListener("touch", movingEggs)
    vanillaBean_image:removeEventListener("touch", MovingVanillaBean)
    oil_image:removeEventListener("touch", movingOil)
   

end 

local function ResetIngredients()
    -- reset the original sugar image
    oil_image.x = 960
    oil_image.y = 520
    oil_image.isVisible = true
    smallOil.isVisible = false
    checkMark4.isVisible = false
    vanillaBean_image.x = 960
    vanillaBean_image.y = 225
    vanillaBean_image.isVisible = true
    smallVanillaBean.isVisible = false
    checkMark3.isVisible = false
    egg_image.x = 960
    egg_image.y = 410
    egg_image.isVisible = true
    smallEggs.isVisible = false
    checkMark5.isVisible = false
    milk_image.x = 960
    milk_image.y = 310
    milk_image.isVisible = true
    smallMilk.isVisible = false
    checkMark.isVisible = false
    vanilla_image.x = 960
    vanilla_image.y = 130
    vanilla_image.isVisible = true
    smallVanilla.isVisible = false
    checkMark2.isVisible =  false
    yesButton.isVisible = false
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    questionText = display.newText( "" , 0, 0, nil, 100)
    questionText.x = display.contentWidth * 0.7
    questionText.y = display.contentHeight * 0.6
    questionText:setTextColor(0.2, 0.4, 1)

   
    -- set the background to be black
    bkg_image = display.newImageRect("Images/level4ScreenFerdous.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
-- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -- display text for asking if the user ready for questions
    readyImage = display.newImageRect("Images/readyText.png", display.contentWidth, display.contentHeight)
    readyImage.x = 500
    readyImage.y = 300
    readyImage.width = 900
    readyImage.height = 700
-- Associating display objects with this scene 
    sceneGroup:insert( readyImage )
    readyImage.isVisible = false
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
    defaultFile = "Images/BackButtonUnPressedFerdous@2x.png",
    overFile = "Images/BackButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
})
   
-----------------------------------------------------------------------------------------
-- Associating Buttons with this scene
    sceneGroup:insert( backButton )
  
-- Creating bowl image
    bowl_image =display.newImageRect("Images/bowlPlaceholder.png", display.contentWidth, display.contentHeight) 
    bowl_image.x = 500
    bowl_image.y = 380
    bowl_image.width = 150
    bowl_image.height = 150
    sceneGroup:insert(bowl_image)
    --Creating yes buttton
   

 -- Creating butter image 
    milk_image = display.newImageRect("Images/milk.png", display.contentWidth, display.contentHeight)
    milk_image.x = 960
    milk_image.y = 310
    milk_image.width = 100
    milk_image.height = 100
    sceneGroup:insert( milk_image )
   --Creating chocolate image 
    vanilla_image = display.newImageRect("Images/vanilla.png", display.contentWidth, display.contentHeight)
    vanilla_image.x = 960
    vanilla_image.y = 130
    vanilla_image.width = 90
    vanilla_image.height = 50
    sceneGroup:insert(vanilla_image)
    
-- Creating flour image 
    vanillaBean_image = display.newImageRect("Images/vanilla bean.png", display.contentWidth, display.contentHeight)
    vanillaBean_image.x = 960
    vanillaBean_image.y = 225
    vanillaBean_image.width = 100
    vanillaBean_image.height = 100
    sceneGroup:insert(vanillaBean_image)


    
    -- Creating egg image 
    egg_image = display.newImageRect("Images/eggs.png", display.contentWidth, display.contentHeight)
    egg_image.x = 960
    egg_image.y = 410
    egg_image.width = 100
    egg_image.height = 100
    sceneGroup:insert(egg_image)


    -- Creating sugar image 
    oil_image = display.newImageRect("Images/oil.png", display.contentWidth, display.contentHeight)
    oil_image.x = 960
    oil_image.y = 520
    oil_image.width = 100
    oil_image.height = 100
    sceneGroup:insert(oil_image)


    
    milk_imageShort = display.newImageRect("Images/milk.png", display.contentWidth, display.contentHeight)
    milk_imageShort.x = 45
    milk_imageShort.y = 370
    milk_imageShort.width =60
    milk_imageShort.height = 60
    sceneGroup:insert(milk_imageShort)

    --Creating checkMarks 
    checkMark = display.newImageRect("Images/Mark.png", display.contentWidth, display.contentHeight)
    checkMark.x = 45
    checkMark.y = 370
    checkMark.width =60
    checkMark.height = 60
    sceneGroup:insert(checkMark)
    checkMark.isVisible = false
-- Creating small Images
    vanilla_imageShort = display.newImageRect("Images/vanilla.png", display.contentWidth, display.contentHeight)
    vanilla_imageShort.x = 45
    vanilla_imageShort.y = 200
    vanilla_imageShort.width = 60
    vanilla_imageShort.height = 60
    sceneGroup:insert(vanilla_imageShort)

    --Creating checkMarks 
    checkMark2 = display.newImageRect("Images/Mark.png", display.contentWidth, display.contentHeight)
    checkMark2.x = 45
    checkMark2.y = 200
    checkMark2.width = 60
    checkMark2.height = 60
    sceneGroup:insert(checkMark2)
    checkMark2.isVisible = false

-- Creating small Images of objects
    vanillaBean_imageShort = display.newImageRect("Images/vanilla bean.png", display.contentWidth, display.contentHeight)
    vanillaBean_imageShort.x = 45
    vanillaBean_imageShort.y = 280
    vanillaBean_imageShort.width = 60
    vanillaBean_imageShort.height = 60
    sceneGroup:insert(vanillaBean_imageShort)

    --Creating checkMarks 
    checkMark3 = display.newImageRect("Images/Mark.png", display.contentWidth, display.contentHeight)
    checkMark3.x = 45
    checkMark3.y = 280
    checkMark3.width = 60
    checkMark3.height = 60
    sceneGroup:insert(checkMark3)
    checkMark3.isVisible = false

-- Creating small Images of objects
    oil_imageShort = display.newImageRect("Images/oil.png", display.contentWidth, display.contentHeight)
    oil_imageShort.x = 45
    oil_imageShort.y = 540
    oil_imageShort.width = 60
    oil_imageShort.height = 60
    sceneGroup:insert(oil_imageShort)

    --Creating checkMarks 
    checkMark4 = display.newImageRect("Images/Mark.png", display.contentWidth, display.contentHeight)
    checkMark4.x = 45
    checkMark4.y = 540
    checkMark4.width = 60
    checkMark4.height = 60
    sceneGroup:insert(checkMark4)
    checkMark4.isVisible = false

   -- Creating small Images of objects
   egg_imageShort = display.newImageRect("Images/eggs.png", display.contentWidth, display.contentHeight)
   egg_imageShort.x = 45
   egg_imageShort.y = 460
   egg_imageShort.width = 60
   egg_imageShort.height = 60
   sceneGroup:insert(egg_imageShort)

    --Creating checkMarks 
    checkMark5 = display.newImageRect("Images/Mark.png", display.contentWidth, display.contentHeight)
    checkMark5.x = 45
    checkMark5.y = 460
    checkMark5.width = 60
    checkMark5.height = 60
    sceneGroup:insert(checkMark5)
    checkMark5.isVisible = false  

   -- Creating small Images of objects to stay in the bowl
    smallVanilla = display.newImageRect("Images/vanilla.png", display.contentWidth, display.contentHeight)
    smallVanilla.x = 500
    smallVanilla.y = 370
    smallVanilla.width = 50
    smallVanilla.height = 20
    sceneGroup:insert(smallVanilla)    
    smallVanilla.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallMilk = display.newImageRect("Images/milk.png", display.contentWidth, display.contentHeight)
    smallMilk.x = 500
    smallMilk.y = 370
    smallMilk.width = 50
    smallMilk.height = 20
    sceneGroup:insert(smallMilk)    
    smallMilk.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallVanillaBean = display.newImageRect("Images/vanilla bean.png", display.contentWidth, display.contentHeight)
    smallVanillaBean.x = 500
    smallVanillaBean.y = 370
    smallVanillaBean.width = 50
    smallVanillaBean.height = 20
    sceneGroup:insert(smallVanillaBean)    
    smallVanillaBean.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallOil = display.newImageRect("Images/oil.png", display.contentWidth, display.contentHeight)
    smallOil.x = 500
    smallOil.y = 370
    smallOil.width = 50
    smallOil.height = 20
    sceneGroup:insert(smallOil)    
    smallOil.isVisible = false

   -- Creating small Images of objects to stay in the bowl
    smallEggs = display.newImageRect("Images/eggs.png", display.contentWidth, display.contentHeight)
    smallEggs.x = 500
    smallEggs.y = 370
    smallEggs.width = 50
    smallEggs.height = 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    sceneGroup:insert(smallEggs)    
    smallEggs.isVisible = false

    --creating mute button
    muteButton = display.newImageRect("Images/muteButton.png", 90, 90)
    muteButton.x = 43
    muteButton.y = 35
    muteButton.isVisible = false
    sceneGroup:insert(muteButton)

--creating mut button
    unmuteButton = display.newImageRect("Images/unmuteButton.png", 90, 90)
    unmuteButton.x = 43
    unmuteButton.y = 35
    unmuteButton.isVisible = true
    sceneGroup:insert(unmuteButton)

    instructionText = display.newImageRect("Images/cook2.png", display.contentWidth, display.contentHeight)
    instructionText.x = 500
    instructionText.y = 100
    instructionText.width = 700
    instructionText.height = 500
    sceneGroup:insert(instructionText)
    instructionText.isVisible = true

      -- adding text and colour for timer
    clockText= display.newText( secondsLeft, display.contentWidth/7, display.contentHeight/7, nil, 50)
    clockText.x = 500
    clockText.y = 45
    clockText:setTextColor(0.9, 0, 0)
    sceneGroup:insert(clockText)
    yesButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/2,
    y = display.contentHeight*15/27,
    -- Setting Dimensions
    width = 100,
    height = 106,
    -- Setting Visual Properties
    defaultFile = "Images/YesButtonPressedFerdous@2x.png",
    overFile = "Images/YesButtonUnPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = gotoQuestions
})
    sceneGroup:insert(yesButton)
    yesButton.isVisible = false

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
        ResetIngredients()
        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", Unmute )
        -- display background music
        backgroundSoundChannel = audio.play(backgroundSound, {channel = 9, loops = -1}) 
            if(soundOn == true) then
                audio.resume(backgroundSoundChannel)
                muteButton.isVisible = false
                unmuteButton.isVisible = true
            else
                audio.pause(backgroundSoundChannel)
                muteButton.isVisible = true
                unmuteButton.isVisible = false
            end
        --calling the addEventListener function 
        AddAnswerBoxEventListeners()
            -- start timer 
        startTimer()
    end
end 
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
----------------------------------------------------------------------------------------
    if ( phase == "will" ) then 

-----------------------------------------------------------------------------------------
-- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        --removing Eventlisteners
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute )
        audio.pause(backgroundSoundChannel)
        RemoveAnswerBoxEventListeners()
        --canceling the timer
        timer.cancel(countDownTimer)
        secondsLeft = totalSeconds
        readyImage.isVisible = false
        backButton.x = 150
        backButton.y = 700
        yesButton.isVisible = false
 
           
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