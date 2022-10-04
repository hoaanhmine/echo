function onCreatePost()
	 luaDebugMode = true
    initLuaShader("tailsVCR")
    
    makeLuaSprite("shaderImage")
    makeGraphic("shaderImage", screenWidth, screenHeight)
    
    setSpriteShader("shaderImage", "tailsVCR")
    
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
    ]])
end