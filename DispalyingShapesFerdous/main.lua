-- Title: display Shapes 

-- Name: Ferdous S
-- Course: ICS2O
-- This program is display ships---------------------------------------------------------------------------------------
--
-- main.lua
--------------------------------------------------------------------------------
-- Your code here


----set backgroundColor

display.setDefault("background", 0.5, 1, 1)


--global variable
local scrollSpeed = 4

--code for triangle
--adding triangle vertices and text 

local tgText

local textSize=50

local tAngle 

local tgVertices = {60,-250, 300, -50, -80, -50, }





local  Text= display.newText("Triangle", 0, 0, Arial, textSize)



local triangle= display.newPolygon( 1, 2, tgVertices )

--triangle and text position
triangle.x= 200
triangle.y= 300



Text.x = 200

Text.y=450

--text color 
Text:setTextColor(0.2, 0.5, 0.7)

--function for moving triangle
local function movingTriangle( event )
	triangle.x= triangle.x + scrollSpeed
end
Runtime:addEventListener("enterFrame", movingTriangle)



--adding trazeoid vertices and text 

local Trazeoid
local vTrapezoid= {-100,-100,100,-100,140,120,-140,120 }
local textSize = 50
local TextTrapezoid


TextTrapezoid =display.newText("Trazeoid", 0, 0, Arial, textSize)

local Trazeoid = display.newPolygon(0, 0, vTrapezoid)

-- Trazeoid  and text position
Trazeoid.x=800
Trazeoid.y = 300
TextTrapezoid.x= 800
TextTrapezoid.y= 450

--adding text color
TextTrapezoid:setTextColor(0.2, 0.5, 0.7)


--function for moving Trazeoid

local function movingTrazeoid( event )
	Trazeoid.x= Trazeoid.x - scrollSpeed
end
Runtime:addEventListener("enterFrame", movingTrazeoid)


-- adding the Heptagon vertices and Text
local Heptagon 
local oVertices = { 0,-60,60,-40,80,40,40,80,-40,80,-80,40,-60,-40 }
local TextHeptagon
local textSize= 50



 TextHeptagon= display.newText("Heptagon", 0, 0, Arial, textSize)

Heptagon = display.newPolygon(0, 0, oVertices)

-- Heptagon and text position
Heptagon.x= 500
Heptagon.y = 500
TextHeptagon.x=500
TextHeptagon.y= 600

--adding text color
TextHeptagon:setTextColor(0.2, 0.5, 0.7)

-- adding background color to shapes
Heptagon:setFillColor(0.2, 0.2, 0.8)

triangle:setFillColor(0.7, 0.4, 0.7)

Trazeoid:setFillColor(0.4, 0.4, 0.4)


--function for moving Heptagon
local function movingHeptagon(event)

Heptagon.y = Heptagon.y -scrollSpeed
end

Runtime:addEventListener("enterFrame", movingHeptagon)


--local Hexagon
--local HVertices={10,-80, 10, 90, 10, 100, -100, 10, 10, -200,203 }
--local TextHexagon
--local  textSize=50

--local Hexagon =display.newPolygon(0, 0, HVertices)

--TextHexagon= display.newText("Hexagon", 0, 0, Arial, textSize)

--Hexagon.x=500
--Hexagon.y=100


