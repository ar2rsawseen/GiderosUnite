--[[
*************************************************************
 * This script is developed by Arturs Sosins aka ar2rsawseen, http://appcodingeasy.com
 * Feel free to distribute and modify code, but keep reference to its creator
 *
 * Gideros Game Template for developing games. Includes: 
 * Start scene, pack select, level select, settings, score system and much more
 *
 * For more information, examples and online documentation visit: 
 * http://appcodingeasy.com/Gideros-Mobile/Gideros-Mobile-Game-Template
**************************************************************
]]--

about = gideros.class(Sprite)

function about:init()
	--here we'd probably want to set up a background picture
	local screen = Bitmap.new(Texture.new("images/gideros_mobile.png"))
	self:addChild(screen)
	screen:setPosition((application:getContentWidth()-screen:getWidth())/2, (application:getContentHeight()-screen:getHeight())/2)
	
	--create level description
	local description = Shape.new()
	description:setFillStyle(Shape.SOLID, 0xff0000, 0.5)   
	description:beginPath(Shape.NON_ZERO)
	description:moveTo(20,application:getContentHeight()/16)
	description:lineTo((application:getContentWidth()-20), application:getContentHeight()/16)
	description:lineTo((application:getContentWidth()-20), application:getContentHeight()-(application:getContentHeight()/16))
	description:lineTo(20, application:getContentHeight()-(application:getContentHeight()/16))
	description:lineTo(20, application:getContentHeight()/16)
	description:endPath()
	self:addChild(description)
	
	--setting up description texts
	local lastHeight = (application:getContentHeight()/16)*2
	local textWidth = application:getContentWidth() - 60
	--title
	local title = TextWrap.new("Title", textWidth, "center")
	title:setFont(font)
	title:setPosition(30, lastHeight)
	title:setTextColor(0xffffff)
	description:addChild(title)
	lastHeight = lastHeight + 20 + title:getHeight()
	
	--help text
	local helpDesc = TextWrap.new("Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit arcu placerat lorem iaculis bibendum. Phasellus eu urna non massa rutrum euismod. Proin ac scelerisque augue. Sed vitae augue mi. Cras mi tellus, auctor pulvinar aliquet sed, suscipit eget justo. Nulla nec sem ac metus mollis ullamcorper eget eget dolor. Phasellus dapibus ligula ut lectus fringilla eu suscipit purus iaculis. Pellentesque commodo ipsum ac magna sollicitudin placerat. Morbi tempor pellentesque lacinia. Praesent quis mauris diam. Proin scelerisque venenatis libero, eu dictum orci placerat eget. In vitae metus quis ligula mollis blandit. Vestibulum est sem, ultricies id tempus et, sollicitudin eu augue.", textWidth, "justify")
	helpDesc:setFont(font)
	helpDesc:setPosition(30, lastHeight)
	helpDesc:setTextColor(0xffffff)
	description:addChild(helpDesc)
	
	--back button
	local backButton = Button.new(Bitmap.new(Texture.new("images/back_up.png")), Bitmap.new(Texture.new("images/back_down.png")))
	backButton:setPosition((application:getContentWidth()-backButton:getWidth())/2, application:getContentHeight()-backButton:getHeight()*2)
	description:addChild(backButton)

	backButton:addEventListener("click", 
		function()	
			sceneManager:changeScene("start", 1, transition, easing.outBack) 
		end
	)
end