start = gideros.class(Sprite)

function start:init()
	--here we'd probably want to set up a background picture
	local screen = Bitmap.new(Texture.new("images/gideros_mobile.png"))
	self:addChild(screen)
	screen:setPosition((application:getContentWidth()-screen:getWidth())/2, (application:getContentHeight()-screen:getHeight())/2)

	--create start button
	local startButton = Button.new(Bitmap.new(Texture.new("images/start_up.png")), Bitmap.new(Texture.new("images/start_down.png")))
	startButton:setPosition((application:getContentWidth()-startButton:getWidth())/2, ((application:getContentHeight()-startButton:getHeight())/2)-(startButton:getHeight()+20))
	self:addChild(startButton)

	--start button on click event
	startButton:addEventListener("click", 
		function()
			--go to client select scene
			sceneManager:changeScene("new_server", 1, transition, easing.outBack) 
		end
	)
	
	--create start button
	local optionsButton = Button.new(Bitmap.new(Texture.new("images/join_up.png")), Bitmap.new(Texture.new("images/join_down.png")))
	optionsButton:setPosition((application:getContentWidth()-optionsButton:getWidth())/2, ((application:getContentHeight()-optionsButton:getHeight())/2))
	self:addChild(optionsButton)

	--start button on click event
	optionsButton:addEventListener("click", 
		function()	
			--go to server select scene
			sceneManager:changeScene("join_server", 1, transition, easing.outBack) 
		end
	)
	
	--create start button
	local helpButton = Button.new(Bitmap.new(Texture.new("images/about_up.png")), Bitmap.new(Texture.new("images/about_down.png")))
	helpButton:setPosition((application:getContentWidth()-helpButton:getWidth())/2, ((application:getContentHeight()-helpButton:getHeight())/2)+(helpButton:getHeight()+20))
	self:addChild(helpButton)

	--start button on click event
	helpButton:addEventListener("click", 
		function()	
			--go to pack select scene
			sceneManager:changeScene("about", 1, transition, easing.outBack) 
		end
	)
end