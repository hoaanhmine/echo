function onCreate()
	-- background shit
	makeLuaSprite('backgroundimg', 'whitebg', -700, -330);
	setScrollFactor('backgroundimg', 0, 0);
	scaleObject('backgroundimg', 50, 50);
	addLuaSprite('backgroundimg', false);	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
