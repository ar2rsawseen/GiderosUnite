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

--This is an example of how you can create a client, which will join to specific server
--and wait for acception

join_server = gideros.class(Sprite)

function join_server:init()
	local title = TextWrap.new("Available server: ", application:getContentWidth(), "center", 0.6, font)
	title:setPosition(0, 50)
	self:addChild(title)
	
	self.servers = {}
	
	function self:onJoin(e)
		local text = TextField.new(font, e.data.host)
		local lastHeight = #self.servers*50 + 100
		text:setPosition(30, lastHeight)
		self:addChild(text)
		
		--join button
		local joinButton = Button.new(Bitmap.new(Texture.new("images/join_up.png")), Bitmap.new(Texture.new("images/join_down.png")))
		joinButton.upState:setScale(0.6)
		joinButton.downState:setScale(0.6)
		joinButton:setPosition((application:getContentWidth()-joinButton:getWidth()), lastHeight - joinButton:getHeight()/2)
		self:addChild(joinButton)
		--store id which server to accept
		joinButton.id = e.data.id
		local cnt = #self.servers + 1
		self.servers[cnt] = {}
		self.servers[cnt].text = text
		self.servers[cnt].button = joinButton
		function joinButton:click()
			--connect to server with this id
			serverlink:connect(self.id)
			local parent = self:getParent()
			self:removeFromParent()
		end
	
		joinButton:addEventListener("click", joinButton.click, joinButton)
	end
	
	--create client instance
	serverlink = Client.new({username = "IAmAClient"})
	--create event to monitor when new server starts broadcasting
	serverlink:addEventListener("newServer", self.onJoin, self)
	--event to listen if server accepted our connection
	serverlink:addEventListener("onAccepted", function()
		--draw button
		local drawButton = Button.new(Bitmap.new(Texture.new("images/draw_up.png")), Bitmap.new(Texture.new("images/draw_down.png")))
		drawButton:setPosition((application:getContentWidth()-drawButton:getWidth())/2, application:getContentHeight()-drawButton:getHeight()*5)
		self:addChild(drawButton)
	
		drawButton:addEventListener("click", 
			function()	
				sceneManager:changeScene("draw", 1, transition, easing.outBack)  
			end
		)
	end)
	--start listening for server broadcasts
	serverlink:startListening()

	--back button
	local backButton = Button.new(Bitmap.new(Texture.new("images/back_up.png")), Bitmap.new(Texture.new("images/back_down.png")))
	backButton:setPosition((application:getContentWidth()-backButton:getWidth())/2, application:getContentHeight()-backButton:getHeight()*2)
	self:addChild(backButton)

	backButton:addEventListener("click", 
		function()	
			--if we are heading back, close the client
			if serverlink then
				serverlink:close()
				serverlink = nil
			end
			sceneManager:changeScene("start", 1, transition, easing.outBack) 
		end
	)
end