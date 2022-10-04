function onCreate()
	-- background shit
	makeLuaSprite('backgroundimg', 'whitebg', -700, -500);
	setScrollFactor('backgroundimg', 0, 0);
	addLuaSprite('backgroundimg', false);	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end