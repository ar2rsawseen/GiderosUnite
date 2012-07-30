--instance of unite class either client or server
--maybe not so pretty to make it global, but for this example it'll do
--you can try implement it your own way:)
serverlink = nil

transition = SceneManager.flipWithFade
font = TTFont.new("tahoma.ttf", 24);

--function for creating menu buttons
menuButton = function(image1, image2, container, current, all)
	local newButton = Button.new(Bitmap.new(Texture.new(image1)), Bitmap.new(Texture.new(image2)))
	local startHeight = (current-1)*(container:getHeight())/all + (((container:getHeight())/all)-newButton:getHeight())/2 + application:getContentHeight()/16
	newButton:setPosition((application:getContentWidth()-newButton:getWidth())/2, startHeight)
	return newButton;
end 
	
--define scenes
sceneManager = SceneManager.new({
	--start scene
	["start"] = start,
	--starting server
	["new_server"] = new_server,
	--listening to servers
	["join_server"] = join_server,
	--drawing together
	["draw"] = draw,
	--some desription scene
	["about"] = about
})
--add manager to stage
stage:addChild(sceneManager)

--start start scene
sceneManager:changeScene("start", 1, transition, easing.outBack)