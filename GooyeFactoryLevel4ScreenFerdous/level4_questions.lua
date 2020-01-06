--name:Ferdous
--title:level2_questions screen
--Discription: in this scene we display the questions 
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")

-- Creating Scene Object
local scene = composer.newScene( sceneName )
-- Naming Scene
sceneName = "level4_questions"

-----------------------------------------------------------------------------------------
--Local Sounds
----------------------------------------------------------------------------------------
local sound = audio.loadSound("Sounds/inspire.mp3")
local soundChannel

local popUp = audio.loadSound("Sounds/pop up2.mp3")
local popUpChannel

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
-- variable for question text
local questionText

--variables for answers
local answer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3
local userAnswer

-- variables for answers texts
local answerText 
local wrongAnswerText1
local wrongAnswerText2
local wrongAnswerText3
-- answers position variable
local answerPosition = 1
local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7
-- background variables 
local bkg
local cover

-- boolean for touching the answers
local textTouched = false
-- variables for counting the right answers
local totalAnswer = 0

local numWrong = 0

-- The local variables for the timer
local totalSeconds = 60
local secondsLeft =  60
local clockText
local countDownTimer

-- background color
display.setDefault("background", 0.9, 0.9, 0.5)

------------------------------------------------------------------------------------------
--tasnsition variables
------------------------------------------------------------------------------------------
local transitionOption =({
    effect="slideUp",
    time = 500
})

local transitionOption2 =({
    effect="flip",
    time = 500
})
-- transition effect variable
local transitionOption3 =({
    effect="slideDown",
    time = 500
})
local transitionOption4 =({
    effect="zoomInOutFade",
    time = 500
})
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- function for mute and 
local function Mute( touch )
    if(touch.phase == "ended")then
        print ("***clicked on Mute")
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
        print ("***clicked on Unmute")
        --play the music 
        audio.pause(soundChannel)
        --set boolean for sound status
        soundOn = false
        muteButton.isVisible = true
        unmuteButton.isVisible = false
    end
end


-- function for going back to main menu screen

local function BackTransition()
    composer.gotoScene( "main_menu", transitionOption )
end
-- function for going to level 2 screen 

local function gotoLevel2Screen()
    composer.gotoScene( "level4_screen", transitionOption2 )
end

-- function for going to you win screen
local function yourcake()
    composer.gotoScene("You_Win", transitionOption3)

end
-- FUNCTIONS for going to you lose screen
local function youLostScreen( ... )
    composer.gotoScene("You_Lose", transitionOption4)

end
-- FUNCTIONS changing the answers positions 
local function PositionAnswers()
    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
        elseif (answerPosition == 2) then

            answerText.x = X2
            answerText.y = Y2
            
            wrongText1.x = X1
            wrongText1.y = Y1
            
            wrongText2.x = X2
            wrongText2.y = Y1

            wrongText3.x = X1
            wrongText3.y = Y2


        elseif (answerPosition == 3) then

            answerText.x = X2
            answerText.y = Y1
            
            wrongText1.x = X1
            wrongText1.y = Y2
            
            wrongText2.x = X1
            wrongText2.y = Y1

            wrongText3.x = X2
            wrongText3.y = Y2
            
    
        elseif (answerPosition == 4) then

            answerText.x = X2
            answerText.y = Y1
            
            wrongText1.x = X1
            wrongText1.y = Y2
            
            wrongText2.x = X1
            wrongText2.y = Y1

            wrongText3.x = X2
            wrongText3.y = Y2
            
    end
end
-- FUNCTION for Displaying Questions

local function DisplayQuestion()
    local randomQuestion = math.random (1, 20)
    if (randomQuestion == 1) then
        rootImage.isVisible = false
        --creating the question depending on the selcetion number
        questionText.text = "What color is\n the sky?"
    --creating answer text from list it corispondes with the animals list
        answerText.text = "Blue"
        --creating wrong answers
        wrongText1.text = "Green"
        wrongText2.text = "Yellow"
        wrongText3.text = "Purple"
        elseif (randomQuestion == 2) then
            PositionAnswers()
    --creating the question depending on the selcetion number
            questionText.text = "What is this image of?"
            rootImage.isVisible = true
    --creating answer text from list it corispondes with the animals list
            answerText.text = "Root"
    
            --creating wrong answers
            wrongText1.text = "Leaves"
            wrongText2.text = "Branch"
            wrongText3.text = "Flower"
        elseif (randomQuestion == 3) then
            PositionAnswers()
    --creating the question depending on the selcetion number
            questionText.text = "What do plants need\n to grow?"
            rootImage.isVisible = false
    --creating answer text from list it corispondes with the animals list
            answerText.text = "Water"
    
            --creating wrong answers
            wrongText1.text = "Moonlight"
            wrongText2.text = "Juice"
            wrongText3.text = "Darkness"

        elseif (randomQuestion == 4) then
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What is the\n strongest shape?"
            rootImage.isVisible = false
            --creating answer text from list it corispondes with the animals list
            answerText.text = "Triangle"
            --creating wrong answers
            wrongText1.text = "Square"
            wrongText2.text = "Circle"
            wrongText3.text = "Star"
        elseif (randomQuestion == 5) then
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What kind of trees\n have flowers on them?"
            rootImage.isVisible = false
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Blossom tree"
                 --creating wrong answers
            wrongText1.text = "Maple Trees"
            wrongText2.text = "Oak Trees"
            wrongText3.text = "Oval Trees"    
        elseif (randomQuestion == 6) then
            PositionAnswers()
            rootImage.isVisible = false

            --creating the question depending on the selcetion number
            questionText.text = " Raissa will transfer the bowl of food\n to another place. Her action shows?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Motion "
                 --creating wrong answers
            wrongText1.text = "Force"
            wrongText2.text = "Pressure"
            wrongText3.text = "Inertia"     

        elseif (randomQuestion == 7) then
            PositionAnswers()
            rootImage.isVisible = false

            --creating the question depending on the selcetion number
            questionText.text = "It is where the white part of the\n eye becomes bloodshot or sore?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Conjunctivitis"
                 --creating wrong answers
            wrongText1.text = "Cataracts"
            wrongText2.text = "Glaucoma"
            wrongText3.text = "Strabismus"     
        elseif (randomQuestion == 8) then
            PositionAnswers()
            rootImage.isVisible = false

            --creating the question depending on the selcetion number
            questionText.text = " True / False \n do you call the air around the Earth Atmosphere?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "True"
                 --creating wrong answers
            wrongText1.text = "False"
            wrongText2.text = ""
            wrongText3.text = ""    
        elseif (randomQuestion == 9) then
            rootImage.isVisible = false

            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "Which of the following\n have different texture?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Hollow blocks"
                 --creating wrong answers
            wrongText1.text = " Plastic cover"
            wrongText2.text = " Satin cloth"
            wrongText3.text = "Glass"      
        elseif (randomQuestion == 10) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "In which form does water have a\n definite shape and volume?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Ice"
                 --creating wrong answers
            wrongText1.text = "Liquid water"
            wrongText2.text = " Water vapor"
            wrongText3.text = "clouds"   
        elseif (randomQuestion == 11) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "Plants need which of the following to live?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Air, Water"
                 --creating wrong answers
            wrongText1.text = "Oxygen"
            wrongText2.text = "Monnlight"
            wrongText3.text = "Shade And Food" 

        elseif (randomQuestion == 12) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = " Which group of animal does not have a backbone?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "arachnid"
                 --creating wrong answers
            wrongText1.text = "fish"
            wrongText2.text = "bird"
            wrongText3.text = "amphibian" 
        elseif (randomQuestion == 13) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = " Which planet is known as the red planet?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Mars"
                 --creating wrong answers
            wrongText1.text = "Earth"
            wrongText2.text = "Venus"
            wrongText3.text = "Jupiter" 

        elseif (randomQuestion == 14) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What is the part of the plant that\n uses light to make food?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Leaves"
                 --creating wrong answers
            wrongText1.text = "Flowers"
            wrongText2.text = "Roots"
            wrongText3.text = "Stem" 
        elseif (randomQuestion == 15) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What causes erosion?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Heat"
                 --creating wrong answers
            wrongText1.text = "Cold"
            wrongText2.text = "Sun And\n Water"
            wrongText3.text = "Wind And\n Water" 
        elseif (randomQuestion == 16) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "The plants that live in dry places Their roots are?."
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Long"
                 --creating wrong answers
            wrongText1.text = "Short"
            wrongText2.text = "Small"
            wrongText3.text = "None of them" 
        elseif (randomQuestion == 17) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What do fishes use to breathe in water?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Gills"
                 --creating wrong answers
            wrongText1.text = "Lungs"
            wrongText2.text = "Fins"
            wrongText3.text = "Tail" 
        elseif (randomQuestion == 18) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "Which part of a plant holds it upright\n and moves it towards light?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Stem"
                 --creating wrong answers
            wrongText1.text = "Roots"
            wrongText2.text = "Flower"
            wrongText3.text = "Leaves" 
        elseif (randomQuestion == 19) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What the All pushes and pulls called?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Force"
                 --creating wrong answers
            wrongText1.text = "Weight"
            wrongText2.text = "Gravity"
            wrongText3.text = "Energy" 
        elseif (randomQuestion == 20) then
            rootImage.isVisible = false
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What are the ends of magnets called?"
             --creating answer text from list it corispondes with the animals list
            answerText.text = "Poles"
                 --creating wrong answers
            wrongText1.text = "Equator"
            wrongText2.text = "Circuits"
            wrongText3.text = "Axis" 
        end                      
end



-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    if (touch.phase == "ended") then
        -- adding the pop sound when objects touched 
        popUpChannel = audio.play(popUp)
        DisplayQuestion()
        -- counting the right answer
        totalAnswer = totalAnswer + 1
        -- make condition for winning the game 
        if(totalAnswer == 13)then
           yourcake()
        end 
    end
end


-- FUNCTION for hidding the correct answer text
local function HideCorrectAnswer( ... )
    giveThenAnswer.isVisible = false
end

--checking to see if the user pressed the right answer 
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    if (touch.phase == "ended") then
        -- pop sound when the objects touched
        popUpChannel = audio.play(popUp)
        -- Displaying the the right answer text
        giveThenAnswer.text = "Sorry, wrong answer. The correct \n answer is ".. answerText.text
        --make the text Visible
        giveThenAnswer.isVisible = true
            numWrong = numWrong + 1
            DisplayQuestion()
            if(numWrong == 3) then
                -- delaly for Displaying the you lose screen
                timer.performWithDelay(1000, youLostScreen )
            end
        -- delaly for hidding the correct answer text
        timer.performWithDelay(1500, HideCorrectAnswer)
           
    end 
end


--checking to see if the user pressed the right answer 
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    if (touch.phase == "ended") then
    --pop sound when the objects touched

        popUpChannel = audio.play(popUp)
        -- Displaying the correct answer text if the user got wrong
        giveThenAnswer.text = "Sorry wrong answer. The correct \n answer is ".. answerText.text
    -- making the correct answer text Visible
        giveThenAnswer.isVisible = true
        numWrong = numWrong + 1
        DisplayQuestion()
        if(numWrong == 3) then
            -- delaly for Displaying the you lose screen
            timer.performWithDelay(1000, youLostScreen )
        end
-- delaly for making the correct text inVisible
        timer.performWithDelay(1500, HideCorrectAnswer)
    end 
end
-- function for 3 wrong answer
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    if (touch.phase == "ended") then
        -- DisplayQuestion pop sound when the objects touched
        popUpChannel = audio.play(popUp)
        -- Displaying the right answer text if the user got it wrong
        giveThenAnswer.text = "Sorry wrong answer. The correct \n answer is ".. answerText.text
        -- making the right answer text Visible
        giveThenAnswer.isVisible = true
        numWrong = numWrong + 1
        DisplayQuestion()
        if(numWrong == 3) then
        -- delaly for Displaying the you lose screen
            timer.performWithDelay(1000, youLostScreen )
        end
        -- delaly for hidding the right answer
        timer.performWithDelay(1500, HideCorrectAnswer)

    end 
end
-- timer counting function 
local function UpdateTime( )
    secondsLeft = secondsLeft - 1
    clockText.text = secondsLeft .. ""
    if(secondsLeft == 0)then
        secondsLeft = totalSeconds
        composer.gotoScene("You_Lose")
    end
end
-- FUNCTION start the timer again
local  function startTimer( )
  countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end


--adding the event listeners to objects
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners from objects
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer)
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)
    sceneGroup:insert(bkg)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newImageRect("Images/question mark.png",display.contentWidth, display.contentHeight)
    cover.x = display.contentCenterX
    cover.y = display.contentCenterY
    cover.width = display.contentWidth
    cover.height = display.contentHeight 
    sceneGroup:insert(cover)
    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)
    questionText:setTextColor(0/255, 0/255, 255/255)
    sceneGroup:insert(questionText)

    --questionText:setFillColor( 0.2, 0.2, 0. )
  

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 35)
    answerText.anchorX = 0
    answerText:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(answerText)

    wrongText1 = display.newText("", X2, Y2, Arial, 35)
    wrongText1.anchorX = 0
    wrongText1:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(wrongText1)

    wrongText2 = display.newText("", X1, Y1, Arial, 35)
    wrongText2.anchorX = 0
    wrongText2:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(wrongText2)

    wrongText3 = display.newText("", X1, Y2, Arial, 35)
    wrongText3.anchorX = 0
    wrongText3:setTextColor(255/255, 0/255, 0/255)
    sceneGroup:insert(wrongText3)

-- creating the text to give the right answer if the got wrong
    giveThenAnswer =  display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 50)
    giveThenAnswer.x = 500
    giveThenAnswer.y = 500
    giveThenAnswer.isVisible = false
    giveThenAnswer:setTextColor(0, 0, 0)
    sceneGroup:insert(giveThenAnswer)

    --creationg bake text
    bakeText =  display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)
    bakeText.x = 500
    bakeText.y = 500
    bakeText.isVisible = false
    bakeText:setTextColor(0.4, 0.3, 0.9)
    -----------------------------------------------------------------------------------------
   -- creating roots image
    rootImage = display.newImageRect("Images/roots.png", display.contentWidth, display.contentHeight) 
    rootImage.x = 500
    rootImage.y = 250
    rootImage.width = 200
    rootImage.height = 200
    rootImage.isVisible = false
    sceneGroup:insert(rootImage)

    backButton = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.1,
    y = display.contentHeight*15/17,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/BackToLevel2ButtonPressed@2x.png",
    overFile = "Images/BackToLevel2ButtonUnPressedFerdous@2x .png",
    -- Setting Functional Properties
    onRelease = gotoLevel2Screen
    })
    sceneGroup:insert(backButton)

    backButton2 = widget.newButton( 
    {
-- Setting Position
    x = display.contentWidth*1/1.2,
    y = display.contentHeight*15/16.5,
        -- Setting Dimensions
    width = 150,
    height = 100,
    -- Setting Visual Properties
    defaultFile = "Images/BackButtonUnPressedFerdous@2x.png",
    overFile = "Images/BackButtonPressedFerdous@2x.png",
    -- Setting Functional Properties
    onRelease = BackTransition
    })
    sceneGroup:insert(backButton2)

    muteButton = display.newImageRect("Images/muteButton.png", 90, 90)
    muteButton.x = 45
    muteButton.y = 40
    muteButton.isVisible = false
    sceneGroup:insert(muteButton)

--creating mut button
    unmuteButton = display.newImageRect("Images/unmuteButton.png", 90, 90)
    unmuteButton.x = 45
    unmuteButton.y = 40
    unmuteButton.isVisible = true
    sceneGroup:insert(unmuteButton)

    
    -- adding text and colour for timer
    clockText= display.newText(secondsLeft, display.contentWidth/7, display.contentHeight/7, nil, 50)
    clockText.x = 500
    clockText.y = 45
    clockText:setTextColor(0.9, 0, 0)
    sceneGroup:insert(clockText)
end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    -----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
        DisplayQuestion()
        PositionAnswers()
        totalAnswer = 0
        numWrong = 0
-- Called when the scene is still off screen (but is about to come on screen).
-----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        totalAnswer = 0
        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", Unmute )
        -- called the FUNCTION to display questions
         DisplayQuestion()
        -- call the function to change the answers positions
         PositionAnswers()
            -- called texts 
        AddTextListeners()
        -- start timer 
        startTimer()
        -- play the background sound
        soundChannel = audio.play(sound, {channel = 58, loops = -1})
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
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )
-- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
-----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------
    elseif ( phase == "did" ) then
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute )
        -- call the remove the event listeners FUNCTION
        RemoveTextListeners()
        -- reset scene after leave it 
            --composer.removeScene("level4_questions")
        -- Displaying the background sound
        soundChannel = audio.stop()
            --canceling the timer
        timer.cancel(countDownTimer)
        secondsLeft = totalSeconds
        totalAnswer = 0
        numWrong = 0
    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
end 

-----------------------------------------------------------------------------------------
-- ADD EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene