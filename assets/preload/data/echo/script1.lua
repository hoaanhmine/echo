local shadname = "vcr"

function onCreatePost()
    luaDebugMode = true
    
    if shadname == "vcr" then
        initLuaShader(shadname)
    
    makeLuaSprite("temporaryShader")
    makeGraphic("temporaryShader", screenWidth, screenHeight)
    --your mom
--Unholy
    setSpriteShader("temporaryShader", shadname)
    setSpriteShader("botplayTxt", shadname)

        addHaxeLibrary("ShaderFilter", "openfl.filters")
-- change  cam.Game  to cam.HUD for colored notes
        runHaxeCode([[
            trace(ShaderFilter);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        ]])
    end
end
function onUpdate()
    setShaderFloat('temporaryShader','iTime',os.clock())
    setShaderFloat('botplayTxt','iTime',os.clock())
end