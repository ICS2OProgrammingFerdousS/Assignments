-----------------------------------------------------------------------------------------
-- Title: AnimatingImages

-- Name: Ferdous S
-- Course: ICS2O
-- This program moves moves images like animation
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


--------------------------------
--making the statusbar disapear 
--------------------------------
display.setStatusBar(display.HiddenStatusBar)

-------------------------------------------------------------
--making the global variable
--------------------------------------------------------------
local scrollSpeed= 2
local scrollSpeed2=5
local firstcharacterText
local secondCharacterText
local thirdCharacterText

------------------------------------------------------------------------
--background images with width and height
------------------------------------------------------------------------
local  bacgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
-------------------------------------------
-- creation of objects  and possitions
-------------------------------------------

local firstcharacter = display.newImageRect("Images/Spider.png", 200, 200)
local secondCharacter= display.newImageRect("images/crayon.png", 200, 200)
local thirdCharacter =  display.newImageRect("images/cartoon2.png", 200, 200)
local ball = display.newImageRect("Images/Sports.png", 100, 100)
firstcharacterText= display.newText("I am coming!", display.contentWidth/4, display.contentHeight*2/3, nil, 30)
firstcharacterText:setTextColor(0.3, 0.2, 1)
firstcharacterText.x = 100
firstcharacterText.y = 300
secondCharacterText= display.newText("I am here!", display.contentWidth/4, display.contentHeight*2/3, nil, 30)
secondCharacterText.x= 900
secondCharacterText:setTextColor(0.4, 0.9, 0.8)
thirdCharacterText = display.newText("same here!", display.contentWidth/4, display.contentHeight*2/3, nil, 30)
thirdCharacterText:setTextColor(0.1, 0.2, 0.7)
thirdCharacterText.xScale = 0
ball.x=800
ball.y=700


-----------------------------------------------------------------------------------------------------------------------------------
--set images transprent
--------------------------------------------------------------------------------------------------------------------------------------
thirdCharacter.alpha =0
--------------------------------------------------------------------------------------------------------------------------------
--set the positions for shapes
---------------------------------------------------------------------------------------------------------------------------
firstcharacter.x = 100
firstcharacter.y = 650
secondCharacter.x= 1000
secondCharacter.y= 650
thirdCharacter.x= 0
thirdCharacter.y= 650

-------------------------------------------------------------------------------------------------------------------------------
--local functions
---------------------------------------------------------------------------------------------------------------------------------------

local function myMove( event )
--move the character 
	thirdCharacter.x = thirdCharacter.x + scrollSpeed
	--change transprent
	thirdCharacter.alpha = thirdCharacter.alpha + 0.5
	thirdCharacterText.x = thirdCharacterText.x + scrollSpeed
	thirdCharacter.x = thirdCharacter.x + scrollSpeed
	if(thirdCharacter.x == 0)then
		thirdCharacter.x = thirdCharacter.x + scrollSpeed
		thirdCharacter.x = 900
		end
	if(thirdCharacter.x==900)then
      thirdCharacter.x = thirdCharacter.x- scrollSpeed
  end
 end



 -----------------------------------------------------------------------------------------------------------------------
      --addEventListener
      -----------------------------------------------------------------------------------------------------------------------

Runtime:addEventListener("enterFrame", myMove)
-----------------------------------------------------------------------------------------------------------------------------
--function for secondCharacter
---------------------------------------------------------------------------------------------------------------------------
local function secondMove( event )
	firstcharacter.x = firstcharacter.x +scrollSpeed2
	firstcharacter.y= firstcharacter.y - scrollSpeed2
secondCharacterText.x = secondCharacterText.x - scrollSpeed2

 end

  ------------------------------------------------------------------------------------------------------------------
     --addEventListener
     -------------------------------------------------------------------------------------------------------------------
 
Runtime:addEventListener("enterFrame", secondMove)
----------------------------------------------------------------------------------------------------------------------------
--thirdCharacter function 
----------------------------------------------------------------------------------------------------------------------

local function thirdMove( event )
	secondCharacter.x = secondCharacter.x - scrollSpeed
		firstcharacterText.x = firstcharacterText.x + scrollSpeed
		firstcharacterText.y = firstcharacterText.y - scrollSpeed

   end
   ---------------------------------------------------------------------------------------------------------------------
   --addEventListener
   -----------------------------------------------------------------------------------------------------------------------
Runtime:addEventListener("enterFrame", thirdMove )

 local function fourthMove( event )
 ball.y = ball.y - scrollSpeed2
end

Runtime:addEventListener( "enterFrame" , fourthMove )