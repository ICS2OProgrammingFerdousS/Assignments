--------------------------------------------------------------------------------------
--- Title: point
-- Name: Ferdous S
-- Course: ICS2O
--playing math game assignment--
--main.lua
-----------------------------------------------------------------------------------------
-- my codes here
-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
-- hide setStatusBar
----------------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
---------------------------------------------------------------------------------------------------
	-- adding background color
----------------------------------------------------------------------------------------------------
display.setDefault("background", 0, 0.4, 0.2)
	-------------------------------------------------
	-- LOCAL VARIABLES
	-------------------------------------------------
   local question
	local correct
	local numericField
	local randomNumber1
	local randomNumber2
	local randomNumber3
	local randomNumber4
	local randomNumber5
	local randomNumber6
    local giveAnswer
	local yourAnswer
	local correctAnswer
	local wrongAnswer
	local point=0
	local CorrectSound = audio.loadSound("Sounds/correctSound.mp3")
	local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
	local CorrectSoundCehnnel
	local wrongChennel
	local youLost2
	local randomOpreator
    local greatAnswer
    local winImage
    local lostImage
    local heart1
    local heart2
    local heart3
    local totalSecond = 10
    local secondLeft = 10
    local clockText
    local countDownTimer
    local lives = 3
    local backgroundMusic = audio.loadStream("Sounds/bkgMusic.mp3")
    local msicChannel
    local wrongObject
    local correctAnswer2

------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------------------------------
   heart1 = display.newImageRect("Images/heart.png", 70, 70)
    heart1.x = 40
	heart1.y = 40
    heart2 = display.newImageRect("Images/heart.png", 70, 70)
    heart2.x=120
    heart2.y=40
    heart3 = display.newImageRect("Images/heart.png", 70, 70)
    heart3.x= 200
    heart3.y=40
	greatAnswer =display.newText("You win ",display.contentWidth/2, display.contentHeight*2/3, nil, 50)
    greatAnswer.isVisible= false
	youLost = display.newText("You lost ",display.contentWidth/2, display.contentHeight*2/3, nil, 50)
	youLost.isVisible=false
	question= display.newText("", display.contentWidth/2.9, display.contentHeight/2, nil, 50)
	question:setTextColor(1, 0.7, 1)
	pointText= display.newText("Point = " .. point, display.contentWidth/1.1, display.contentHeight/4.5, Arial, 35)
	pointText:setTextColor(1, 0.4, 0.5)
	wrongObject =display.newText( " No! the answer is ", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
	wrongObject.isVisible =false
	clockText= display.newText("second left "..secondLeft, display.contentWidth/2, display.contentHeight/4.5, nil, 35)
	correct= display.newText(" Correct!", display.contentWidth/2, display.contentHeight*2/3, nil,  50)
	correct:setTextColor(255/255, 255/255, 255/255)
	correct.isVisible=false
	wrongAnswer= display.newText("Wrong Answer!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
	wrongAnswer:setTextColor(0.5,0.6,1)
	wrongAnswer.isVisible=false

-----------------------------------------------------------------------------------------------------------------------------------
				--creating numeric field
-----------------------------------------------------------------------------------------------------------------------------------
	numericField= native.newTextField(display.contentWidth/2, display.contentHeight/2, 100, 70)
	numericField.inputType="number"
-----------------------------------------------------------------------------------------------------------------------------------
--creating Images
-----------------------------------------------------------------------------------------------------------------------------------
    winImage = display.newImageRect("Images/you win.png", 1040, 1000)
    winImage.x= 500
    winImage.y= 600
    winImage.isVisible = false   
    lostImage = display.newImageRect("Images/game over.png", 1040, 1000)
    lostImage.x=520
    lostImage.y=400
    lostImage.isVisible=false
	-----------------------------------------------------------------------------------------------------------------------------
				-- LOCAL FUNCTIONS
	-----------------------------------------------------------------------------------------------------------------------------
				
				 
	 local function askMe( )
	-- creating 2 random number
	randomOpreator = math.random(1, 4)
	-- creating 2 random number
	randomNumber1= math.random(1, 20)
	randomNumber2= math.random(1, 20)
	randomNumber3= math.random(1, 10)
						randomNumber4= math.random(1, 10)
						randomNumber5= math.random(1, 100)
						randomNumber6= math.random(1, 100)


						 if(randomOpreator == 1)then
				               correctAnswer = randomNumber1 + randomNumber2 
				               question.text = randomNumber1 .. "+" .. randomNumber2 .. "="
				        
				        elseif(randomOpreator== 2)then
				        if(randomNumber1 < randomNumber2)then

				              correctAnswer = randomNumber2 - randomNumber1
				            question.text = randomNumber2 .. "-" .. randomNumber1 .. "="
				        else
				         correctAnswer = randomNumber1 - randomNumber2
				            question.text = randomNumber1 .. "-" .. randomNumber2 .. "="
				        end
				         
				        elseif(randomOpreator == 3)then
				                correctAnswer = randomNumber3 * randomNumber4
				                question.text = randomNumber3 .. " * " .. randomNumber4 .. "="
				             
				         elseif(randomOpreator == 4)then
				                correctAnswer1 = randomNumber5 * randomNumber6
				                correctAnswer = correctAnswer * randomNumber5
				                question.text = randomNumber5 .. " / " .. randomNumber6 .. "="

					    end
					   end


                  local function visible( ... )
                  heart1.isVisible = true
                  heart2.isVisible = true
                  heart3.isVisible = true
                 end
				local function HideText( )
				correct.isVisible = false
				wrongAnswer.isVisible = false
				winImage.isVisible = false
				lostImage.isVisible = false
				wrongObject.isVisible = false
				askMe()

			    end
			    local function  updateTime( ... )
		        secondLeft = secondLeft - 1
		        clockText.text = secondLeft ..""
		        if(secondLeft == 0)then
		   	  wrongObject.text = ("the answer is ".. correctAnswer)
		   	  wrongObject.isVisible = true
		     	secondLeft = totalSecond
		     	lives = lives - 1
		    	     	askMe()
		     	   timer.performWithDelay(2000, HideText)


		    	end
		       end
		       
			   local function numricListener(event)
			    if(event.phase=="began") then
		         local   musicChannel=  audio.play(backgroundMusic, {loops= -1})
				 elseif(event.phase=="submitted")then
				    yourAnswer = tonumber(event.target.text)

				    event.target.text = ""
				    

				    if(yourAnswer == correctAnswer) then
				      point = point + 1
				            correct.isVisible = true

				       CorrectSoundCehnnel = audio.play(CorrectSound)

				      pointText.text = "Point = " .. point
				      secondLeft = totalSecond
				      timer.performWithDelay(1500, HideText)

				      if ( point > 4) then
				        -- display you win image
				        winImage.isVisible=true
				      point= 0
				      timer.performWithDelay(100, HideText)

			          end
			

				      else 

			           wrongChennel = audio.play(wrongSound)
					   secondLeft = totalSecond	
					   wrongObject.text = ("the answer is ".. correctAnswer)
				 	   timer.performWithDelay(2000, HideText)
					   wrongObject.isVisible = true  
				      end
		              lives = lives - 1
				      if(lives== 2)then
			          heart3.isVisible= false
					  secondLeft= totalSecond					 
					  elseif(lives == 1)then
                      lives = lives - 1
					  heart2.isVisible = false
					  secondLeft = totalSecond
					  askMe()
					 else
					 heart1.isVisible = false
					 lostImage.isVisible = true
				     timer.performWithDelay(500, visible)
				     end
				    end   
			       end
                    
                     local   function startTimer()
                      countDownTimer = timer.performWithDelay(1000, updateTime, 1000)
				      end

					------------------------------------------------------------------------------------------------------
					-- EVENT LISTENERS
					-------------------------------------------------------------------------------------------------------

					numericField:addEventListener("userInput", numricListener)
	--------------------------------------------------------------------------------------------------------
										--calling the event listener 
----------------------------------------------------------------------------------------------------------------------------
					startTimer()
			        askMe()
		        
