----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_questions"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText

local firstNumber
local secondNumber

local answer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3

local answerText 
local wrongAnswerText1
local wrongAnswerText2
local wrongAnswerText3

local answerPosition = 1
local bkg
local cover

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false
-- variables for counting the right answer
local totalAnswer = 0

-- The local variables for the timer
local totalSeconds = 60
local secondsLeft = 60
local clockText
local countDownTimer

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
--local function BackToLevel1() 
  --  composer.hideOverlay("fadeOut", 1000 )
  
  display.setDefault("background", 0.1, 0.9, 0.5)

--end 
local transitionOption =({
    effect="zoomOutInRotate",
    time = 500
})
local function yourcake( ... )
    composer.gotoScene("your_cake", transitionOption)

end
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

local function DisplayQuestion()
    local randomQuestion = math.random (1,5)
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
            questionText.text = "What is image of?"
            rootImage.isVisible = true
    --creating answer text from list it corispondes with the animals list
            answerText.text = "Root"
    
            --creating wrong answers
            wrongText1.text = "leaves"
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
            wrongText3.text = "darkness"

        elseif (randomQuestion == 4) then
            PositionAnswers()
            --creating the question depending on the selcetion number
            questionText.text = "What is the\n stronget shape?"
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
            answerText.text = "Bloosm Trees"
                 --creating wrong answers
            wrongText1.text = "Maple Trees"
            wrongText2.text = "Oak Trees"
            wrongText3.text = "Oval Trees"
                
        end
end


-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    if (touch.phase == "ended") then
        DisplayQuestion()
        totalAnswer = totalAnswer + 1
        if(totalAnswer == 5)then
            yourcake()
        end 
    end
end
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    if (touch.phase == "ended") then
        composer.gotoScene("You_Lose")    
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    if (touch.phase == "ended") then
        composer.gotoScene("You_Lose") 
    end 
end
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    if (touch.phase == "ended") then
        composer.gotoScene("You_Lose")  
    end 
end

local function UpdateTime( )
    secondsLeft = secondsLeft - 1
    clockText.text = secondsLeft .. ""

    if(secondsLeft == 0)then
        secondsLeft = totalSeconds
        composer.gotoScene("You_Lose")


    end
end

local  function startTimer( )
    countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end


--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
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

    clockText= display.newText(secondsLeft, display.contentWidth/7, display.contentHeight/7, nil, 50)
    clockText.x = 30
    clockText.y = 45
    clockText:setTextColor(0.3, 0.3, 0.2)
    sceneGroup:insert(clockText)
    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(200/255, 200/255, 200/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 75)
    questionText:setTextColor(0.2, 0.2, 0.2)
    questionText:setFillColor( 0.2, 0.2, 0. )

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 40)
    answerText.anchorX = 0
    answerText:setTextColor(1, 0.3, 0.5)
    wrongText1 = display.newText("", X2, Y2, Arial, 40)
    wrongText1.anchorX = 0
    wrongText1:setTextColor(1, 0.3, 0.5)
    wrongText2 = display.newText("", X1, Y1, Arial, 40)
    wrongText2.anchorX = 0
    wrongText2:setTextColor(1, 0.3, 0.5)
    wrongText3 = display.newText("", X1, Y2, Arial, 40)
    wrongText3.anchorX = 0
    wrongText3:setTextColor(1, 0.3, 0.5)

    -----------------------------------------------------------------------------------------
    rootImage = display.newImageRect("Images/roots.png", display.contentWidth, display.contentHeight) 
    rootImage.x = 500
    rootImage.y = 250
    rootImage.width = 200
    rootImage.height = 200
    rootImage.isVisible = false
    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
    sceneGroup:insert(rootImage)



end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    -----------------------------------------------------------------------------------------
    if ( phase == "will" ) then
-- Called when the scene is still off screen (but is about to come on screen).
-----------------------------------------------------------------------------------------

        elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
            DisplayQuestion()
            PositionAnswers()
            AddTextListeners()
            startTimer()
    end

end --function scene:show( event )

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
        -- Called immediately after scene goes off screen.
            RemoveTextListeners()
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
-----------------------------------------------------------------------------------------
    -- Called prior to the removal of scene's view ("sceneGroup"). 
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

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