-- REDUNDANT > These were remains of the script before I switched to OS engine
currentLineSprite = "blacklines";
currentRockSprite = "whiterock"
-- REDUNDANT > These were remains of the script before I switched to OS engine

lineFallSpeed = 0.4;

function onCreatePost()
	-- end of "create"
    doTweenAlpha('hideDad','dad', 0, 0.1, "cubeInOut");
    doTweenAlpha('hideGF','gf', 0, 0.1, "cubeInOut");
    doTweenAlpha('hideBF','boyfriend', 0, 0.1, "cubeInOut");
    doTweenAlpha('hideBG','backgroundimg', 0, 0.1, "cubeInOut");
    setWatermarkText(songName .. " | Modchart by creepycats");
    --setTextSize('watermark', 12);
    --addLuaText('watermark');
    scaleObject('backgroundimg', 5, 5);
    doTweenAlpha('UIFadeOut2','iconP2', 0, 0.1, "cubeInOut");

    makeLuaSprite('minutehand', 'minutehand', -350, -350);
    addLuaSprite('minutehand', false);
    scaleObject('minutehand', 2, 2);
    makeLuaSprite('hourhand', 'hourhand', -350, -400);
    addLuaSprite('hourhand', false);
    scaleObject('hourhand', 2, 2);
    doTweenAlpha('minutehandFade', 'minutehand', 0, 0.1, "cubeInOut");
    doTweenAlpha('hourhandFade', 'hourhand', 0, 0.1, "cubeInOut");

    addVCREffect("camgame",0.0,true,false,true);
    addScanlineEffect("camhud",false);

    -- EPILEPSY WARNING
    makeLuaText("warning", "- WARNING - FLASHING LIGHTS", 448, 412, 500);
    setTextSize('warning', 48);
    addLuaText("warning");

    -- Subtitles
    makeLuaText("subtitleText", "", 448, 412, 500);
    setTextSize('subtitleText', 24);
    addLuaText("subtitleText");

    -- Effect Helper
    -- bf side 900
    -- middle 580
    -- dad side 260
    makeLuaSprite('effectHelper', 'whiterock', 0, 0);
    addLuaSprite('effectHelper', false);	
    scaleObject('effectHelper', 0.01, 0.01);
    setObjectCamera('effectHelper', 'hud')
    setObjectOrder('effectHelper', 999);
    doTweenAlpha('effectHelperHide', 'effectHelper', 0, 0.01, "linear");
    doTweenX('effectHelp' .. getSongPosition(), 'effectHelper', 900, 1, "cubeInOut");
end
function onCountdownTick(counter)
	if counter == 2 then
        doTweenAlpha('showBF','boyfriend', 1, 1, "cubeInOut");
        doTweenAlpha('showBG','backgroundimg', 1, 1, "cubeInOut");
        cameraSetTarget('boyfriend');
        doTweenAngle('bfTilt1', 'boyfriend', -15, 5, "cubeInOut");
        doTweenY('bfmoveY1', 'boyfriend', 485, 5, "cubeInOut");
    end
    if counter == 4 then
        makeLuaSprite('fallLines', currentLineSprite, -750, 2500);
        addLuaSprite('fallLines', false);	
        scaleObject('fallLines', 3, 1.5);
        doTweenY('linesFall1', 'fallLines', -2500, lineFallSpeed, "linear");

        makeLuaSprite('rockFall', currentRockSprite .. '1', -750, 2500);
        addLuaSprite('rockFall', false);
        doTweenY('rockFall1', 'rockFall', -2500, lineFallSpeed * 2, "linear");

        noteTweenAlpha('hideNotes1', 0, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes2', 1, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes3', 2, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes4', 3, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes5', 4, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes6', 5, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes7', 6, 0, .1, "cubeInOut");
        noteTweenAlpha('hideNotes8', 7, 0, .1, "cubeInOut");

        doTweenAlpha('fadeWarning','warning',0, 1, "cubeInOut");
    end
end

local stepsToShuffle = {836,851,868,882,900,915,932,1000000,964,979,997,1011,1028,1043,1060,1075,1157,1171,1189,1203,1924,1940,1956,1970,1989,2002,2020,2033};
local screenUpsideDownShuffling = false;
function ShuffleNotes(x)
    for i=1, #stepsToShuffle do
        if x <= (stepsToShuffle[i] + 14) then
            if x >= stepsToShuffle[i] then
                if math.mod(i,2) == 0 then
                    -- part 2
                    if x == (stepsToShuffle[i] + 0) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 396, .25, "quintIn");
                        noteTweenX('note6x' .. getSongPosition(), 6, 620, .25, "quintIn");
                        noteTweenY('note4y' .. getSongPosition(), 4, 150, .25, "quintOut");
                        noteTweenY('note6y' .. getSongPosition(), 6, 150, .25, "quintOut");
                        noteTweenX('note0x' .. getSongPosition(), 0, 92, 2, "cubeInOut");
                        noteTweenX('note1x' .. getSongPosition(), 1, 204, 2, "cubeInOut");
                        noteTweenX('note2x' .. getSongPosition(), 2, 316, 2, "cubeInOut");
                        noteTweenX('note3x' .. getSongPosition(), 3, 428, 2, "cubeInOut");

                        doTweenX('effectHelp' .. getSongPosition(), 'effectHelper', 260, 1.75, "linear")
                    end
                    if x == (stepsToShuffle[i] + 2) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 508, .25, "quintOut");
                        noteTweenX('note6x' .. getSongPosition(), 6, 732, .25, "quintOut");
                        noteTweenY('note4y' .. getSongPosition(), 4, 50, .25, "quintIn");
                        noteTweenY('note6y' .. getSongPosition(), 6, 50, .25, "quintIn");
                    end
                    if x == (stepsToShuffle[i] + 4) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 508, .25, "quintIn");
                        noteTweenX('note7x' .. getSongPosition(), 7, 732, .25, "quintIn");
                        noteTweenY('note5y' .. getSongPosition(), 5, 150, .25, "quintOut");
                        noteTweenY('note7y' .. getSongPosition(), 7, 150, .25, "quintOut");
                    end
                    if x == (stepsToShuffle[i] + 6) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 620, .25, "quintOut");
                        noteTweenX('note7x' .. getSongPosition(), 7, 844, .25, "quintOut");
                        noteTweenY('note5y' .. getSongPosition(), 5, 50, .25, "quintIn");
                        noteTweenY('note7y' .. getSongPosition(), 7, 50, .25, "quintIn");
                    end
                    if x == (stepsToShuffle[i] + 8) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 620, .25, "quintIn");
                        noteTweenX('note6x' .. getSongPosition(), 6, 844, .25, "quintIn");
                        noteTweenY('note4y' .. getSongPosition(), 4, 150, .25, "quintOut");
                        noteTweenY('note6y' .. getSongPosition(), 6, 150, .25, "quintOut");
                    end
                    if x == (stepsToShuffle[i] + 10) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 732, .25, "quintOut");
                        noteTweenX('note6x' .. getSongPosition(), 6, 956, .25, "quintOut");
                        noteTweenY('note4y' .. getSongPosition(), 4, 50, .25, "quintIn");
                        noteTweenY('note6y' .. getSongPosition(), 6, 50, .25, "quintIn");
                    end
                    if x == (stepsToShuffle[i] + 12) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 732, .25, "quintIn");
                        noteTweenX('note7x' .. getSongPosition(), 7, 956, .25, "quintIn");
                        noteTweenY('note5y' .. getSongPosition(), 5, 150, .25, "quintOut");
                        noteTweenY('note7y' .. getSongPosition(), 7, 150, .25, "quintOut");
                    end
                    if x == (stepsToShuffle[i] + 14) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 844, .25, "quintOut");
                        noteTweenX('note7x' .. getSongPosition(), 7, 1068, .25, "quintOut");
                        noteTweenY('note5y' .. getSongPosition(), 5, 50, .25, "quintIn");
                        noteTweenY('note7y' .. getSongPosition(), 7, 50, .25, "quintIn");
                        doTweenAngle('hudRot' .. getSongPosition(), "camHUD", 0, 0.5, "backOut")
                        screenUpsideDownShuffling = false;
                        --doTweenAngle('gameRot' .. getSongPosition(), "camGame", 0, 0.5, "backOut")
                        characterPlayAnim("boyfriend", "hurt", false)
                        noteTweenAngle('note0rot' .. getSongPosition(), 0, 0, 0.5, "backOut");
                        noteTweenAngle('note1rot' .. getSongPosition(), 1, 0, 0.5, "backOut");
                        noteTweenAngle('note2rot' .. getSongPosition(), 2, 0, 0.5, "backOut");
                        noteTweenAngle('note3rot' .. getSongPosition(), 3, 0, 0.5, "backOut");
                        noteTweenAngle('note4rot' .. getSongPosition(), 4, 0, 0.5, "backOut");
                        noteTweenAngle('note5rot' .. getSongPosition(), 5, 0, 0.5, "backOut");
                        noteTweenAngle('note6rot' .. getSongPosition(), 6, 0, 0.5, "backOut");
                        noteTweenAngle('note7rot' .. getSongPosition(), 7, 0, 0.5, "backOut");
                    end
                else
                    -- part 1
                    if x == (stepsToShuffle[i] + 0) then
                        characterPlayAnim("boyfriend", "hurt", false)
                        noteTweenX('note5x' .. getSongPosition(), 5, 732, .25, "quintIn");
                        noteTweenX('note7x' .. getSongPosition(), 7, 956, .25, "quintIn");
                        noteTweenY('note5y' .. getSongPosition(), 5, 150, .25, "quintOut");
                        noteTweenY('note7y' .. getSongPosition(), 7, 150, .25, "quintOut");
                        noteTweenX('note0x' .. getSongPosition(), 0, 732, 2, "cubeInOut");
                        noteTweenX('note1x' .. getSongPosition(), 1, 844, 2, "cubeInOut");
                        noteTweenX('note2x' .. getSongPosition(), 2, 956, 2, "cubeInOut");
                        noteTweenX('note3x' .. getSongPosition(), 3, 1068, 2, "cubeInOut");

                        doTweenX('effectHelp' .. getSongPosition(), 'effectHelper', 900, 1.75, "linear")
                    end
                    if x == (stepsToShuffle[i] + 2) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 620, .25, "quintOut");
                        noteTweenX('note7x' .. getSongPosition(), 7, 844, .25, "quintOut");
                        noteTweenY('note5y' .. getSongPosition(), 5, 50, .25, "quintIn");
                        noteTweenY('note7y' .. getSongPosition(), 7, 50, .25, "quintIn");
                    end
                    if x == (stepsToShuffle[i] + 4) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 620, .25, "quintIn");
                        noteTweenX('note6x' .. getSongPosition(), 6, 844, .25, "quintIn");
                        noteTweenY('note4y' .. getSongPosition(), 4, 150, .25, "quintOut");
                        noteTweenY('note6y' .. getSongPosition(), 6, 150, .25, "quintOut");
                    end
                    if x == (stepsToShuffle[i] + 6) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 508, .25, "quintOut");
                        noteTweenX('note6x' .. getSongPosition(), 6, 732, .25, "quintOut");
                        noteTweenY('note4y' .. getSongPosition(), 4, 50, .25, "quintIn");
                        noteTweenY('note6y' .. getSongPosition(), 6, 50, .25, "quintIn");
                    end
                    if x == (stepsToShuffle[i] + 8) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 508, .25, "quintIn");
                        noteTweenX('note7x' .. getSongPosition(), 7, 732, .25, "quintIn");
                        noteTweenY('note5y' .. getSongPosition(), 5, 150, .25, "quintOut");
                        noteTweenY('note7y' .. getSongPosition(), 7, 150, .25, "quintOut");
                    end
                    if x == (stepsToShuffle[i] + 10) then
                        noteTweenX('note5x' .. getSongPosition(), 5, 396, .25, "quintOut");
                        noteTweenX('note7x' .. getSongPosition(), 7, 620, .25, "quintOut");
                        noteTweenY('note5y' .. getSongPosition(), 5, 50, .25, "quintIn");
                        noteTweenY('note7y' .. getSongPosition(), 7, 50, .25, "quintIn");
                    end
                    if x == (stepsToShuffle[i] + 12) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 396, .25, "quintIn");
                        noteTweenX('note6x' .. getSongPosition(), 6, 620, .25, "quintIn");
                        noteTweenY('note4y' .. getSongPosition(), 4, 150, .25, "quintOut");
                        noteTweenY('note6y' .. getSongPosition(), 6, 150, .25, "quintOut");
                    end
                    if x == (stepsToShuffle[i] + 14) then
                        noteTweenX('note4x' .. getSongPosition(), 4, 284, .25, "quintOut");
                        noteTweenX('note6x' .. getSongPosition(), 6, 508, .25, "quintOut");
                        noteTweenY('note4y' .. getSongPosition(), 4, 50, .25, "quintIn");
                        noteTweenY('note6y' .. getSongPosition(), 6, 50, .25, "quintIn");
                        doTweenAngle('hudRot' .. getSongPosition(), "camHUD", 180, 0.5, "backOut")
                        screenUpsideDownShuffling = true;
                        --doTweenAngle('gameRot' .. getSongPosition(), "camGame", 180, 0.5, "backOut")
                        characterPlayAnim("boyfriend", "hurt", false)
                        noteTweenAngle('note0rot' .. getSongPosition(), 0, 180, 0.5, "backOut");
                        noteTweenAngle('note1rot' .. getSongPosition(), 1, 180, 0.5, "backOut");
                        noteTweenAngle('note2rot' .. getSongPosition(), 2, 180, 0.5, "backOut");
                        noteTweenAngle('note3rot' .. getSongPosition(), 3, 180, 0.5, "backOut");
                        noteTweenAngle('note4rot' .. getSongPosition(), 4, 180, 0.5, "backOut");
                        noteTweenAngle('note5rot' .. getSongPosition(), 5, 180, 0.5, "backOut");
                        noteTweenAngle('note6rot' .. getSongPosition(), 6, 180, 0.5, "backOut");
                        noteTweenAngle('note7rot' .. getSongPosition(), 7, 180, 0.5, "backOut");
                    end
                end
            end
        end
    end
end
local showFakeNotes = false;
local fakeNoteOpacity = 0.3;

-- Beat Effects
local beatEffect = 0;
local lastBeat = 0;

-- Dance Effects
local noteDanceEffect = 0;

-- Flash Effect
function doFlashEffect(fade)
    makeLuaSprite('flasheffect' .. getSongPosition(), 'whitebg', -600, -300);
    setScrollFactor('flasheffect' .. getSongPosition(), 1, 1);
    addLuaSprite('flasheffect' .. getSongPosition(), false);	
    setObjectCamera('flasheffect' .. getSongPosition(), 'other')
    setObjectOrder('flasheffect' .. getSongPosition(), 999);
    doTweenAlpha('flashCam' .. getSongPosition(), 'flasheffect' .. getSongPosition(), 0, fade, "linear");
end

function onUpdatePost(elapsed)
	-- end of "update"
    --cameraSetTarget('dad');

    if curBeat - lastBeat >= 1 then
        lastBeat = curBeat;
        if beatEffect == 1 then
            cameraShake('hud', 0.035, 0.2);
        end
        if beatEffect == 2 then
            addInvertEffect("camgame",true);
            cameraShake('hud', 0.035, 0.2);
        end
        if beatEffect == 3 then
            cameraShake('hud', 0.015, 0.2);
        end
        if beatEffect == 4 then
            addInvertEffect("camgame",true);
            cameraShake('hud', 0.015, 0.2);
        end
    end

    if noteDanceEffect == 1 then
        for i = 0, getProperty('notes.length')-1 do
            distance = getPropertyFromGroup('notes', i, 'strumTime') - getSongPosition();
            if math.cos(getPropertyFromGroup('notes', i, 'strumTime')) > 0 then
                setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') + (distance / 150)^4);
            else
                setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') - (distance / 150)^4);
            end
        end
    end
    if noteDanceEffect == 2 then
        for i = 0, getProperty('notes.length')-1 do
            distance = getPropertyFromGroup('notes', i, 'strumTime') - getSongPosition();
            if getPropertyFromGroup('notes', i, 'mustPress') == false then 
                setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') + 150 - 50 * (distance / 100));
            else
                setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') - 50 * (distance / 100));
            end
        end
    end
    if noteDanceEffect == 3 then
        for i = 0, getProperty('notes.length')-1 do
            distance = getPropertyFromGroup('notes', i, 'strumTime') - getSongPosition();
            if getPropertyFromGroup('notes', i, 'mustPress') == false then 
                setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') + (((getPropertyFromGroup('notes', i, 'x') - 580)/6.4) * (distance / 100)));
            else
                setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'x') - (((getProperty("effectHelper.x") - 580)/6.4) * (distance / 100)));
            end
        end
    end

    for i = 0, getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', i, 'noteType') == 'fakenote' then
            if showFakeNotes == true then
                setPropertyFromGroup('notes', i, 'alpha', fakeNoteOpacity);
            else
                setPropertyFromGroup('notes', i, 'alpha', 0);
            end
        end
        if getPropertyFromGroup('notes', i, 'noteType') == 'fakeLEFT' then
            if getSongPosition() > 162964 then
                setPropertyFromGroup('notes', i, 'alpha', 0.5);
            else
                setPropertyFromGroup('notes', i, 'alpha', 0);
            end
        end
        if getPropertyFromGroup('notes', i, 'noteType') == 'fakeDOWN' then
            if getSongPosition() > 162964 then
                setPropertyFromGroup('notes', i, 'alpha', 0.5);
            else
                setPropertyFromGroup('notes', i, 'alpha', 0);
            end
        end
        if getPropertyFromGroup('notes', i, 'noteType') == 'fakeUP' then
            if getSongPosition() > 162964 then
                setPropertyFromGroup('notes', i, 'alpha', 0.5);
            else
                setPropertyFromGroup('notes', i, 'alpha', 0);
            end
        end
        if getPropertyFromGroup('notes', i, 'noteType') == 'fakeRIGHT' then
            if getSongPosition() > 162964 then
                setPropertyFromGroup('notes', i, 'alpha', 0.5);
            else
                setPropertyFromGroup('notes', i, 'alpha', 0);
            end
        end
    end
end

function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag
    if tag == 'bfTilt1' then
        doTweenAngle('bfTilt2', 'boyfriend', 15, 5, "cubeInOut");
    end
    if tag == 'bfTilt2' then
        doTweenAngle('bfTilt1', 'boyfriend', -15, 5, "cubeInOut");
    end
    if tag == 'bfmoveY1' then
        doTweenY('bfmoveY2', 'boyfriend', 615, 2.5, "cubeInOut");
    end
    if tag == 'bfmoveY2' then
        doTweenY('bfmoveY1', 'boyfriend', 485, 2.5, "cubeInOut");
    end
    if tag == 'linesFall1' then
        makeLuaSprite('fallLines', currentLineSprite, 750, 2500);
        addLuaSprite('fallLines', false);
        scaleObject('fallLines', 3, 1.5);
        doTweenY('linesFall2', 'fallLines', -2500, lineFallSpeed, "linear");
    end
    if tag == 'linesFall2' then
        makeLuaSprite('fallLines', currentLineSprite, -750, 2500);
        addLuaSprite('fallLines', false);
        scaleObject('fallLines', 3, 1.5);
        doTweenY('linesFall1', 'fallLines', -2500, lineFallSpeed, "linear");
    end
    if tag == 'rockFall1' then
        makeLuaSprite('rockFall', currentRockSprite .. '2', 1350, 2500);
        addLuaSprite('rockFall', false);
        local rng = math.random() + 0.5;
        scaleObject('rockFall', rng, rng);
        doTweenY('rockFall2', 'rockFall', -2500, (lineFallSpeed * 4) * rng, "linear");
    end
    if tag == 'rockFall2' then
        makeLuaSprite('rockFall', currentRockSprite .. '1', -200, 2500);
        addLuaSprite('rockFall', false);
        local rng = math.random() + 0.5;
        scaleObject('rockFall', rng, rng);
        doTweenY('rockFall1', 'rockFall', -2500, (lineFallSpeed * 4) * rng, "linear");
    end

    if tag == 'camZoomFalling' then
        doTweenZoom('camZoomFalling2', 'camHUD', 1, 0.2, "cubeIn");
    end
    if tag == 'camRotFalling' then
        if screenUpsideDownShuffling then
            doTweenAngle('camRotFalling2', 'camHUD', 180, 0.2, "cubeIn");
        else
            doTweenAngle('camRotFalling2', 'camHUD', 0, 0.2, "cubeIn");
        end
    end

    if tag == 'creditTextFall' then
        doTweenY('creditTextFall2', "creditText", 500, 0.5, "quintIn")
        doTweenAlpha('creditTextHide', "creditText", 0, 0.5, "quintIn");
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
    if curStep > 622 then
        if curStep < 765 then
            if direction == 0 then
                doTweenAngle('camRotFalling', 'camHUD', -15, 0.05, "cubeOut");
            end
            if direction == 1 then
                doTweenZoom('camZoomFalling', 'camHUD', 0.85, 0.05, "cubeOut");
            end
            if direction == 2 then
                doTweenZoom('camZoomFalling', 'camHUD', 1.15, 0.05, "cubeOut");
            end
            if direction == 3 then
                doTweenAngle('camRotFalling', 'camHUD', 15, 0.05, "cubeOut");
            end
        end
    end

    if curStep > 822 then
        local doDance = false;
        if curStep < 1211 then
            doDance = true;
        end
        if curStep > 1595 then
            doDance = true;
        end
        if doDance then
            if direction == 0 then
                if screenUpsideDownShuffling then
                    doTweenAngle('camRotFalling', 'camHUD', 170, 0.05, "cubeOut");
                else
                    doTweenAngle('camRotFalling', 'camHUD', -10, 0.05, "cubeOut");
                end
            end
            if direction == 1 then
                doTweenZoom('camZoomFalling', 'camHUD', 0.85, 0.05, "cubeOut");
            end
            if direction == 2 then
                doTweenZoom('camZoomFalling', 'camHUD', 1.15, 0.05, "cubeOut");
            end
            if direction == 3 then
                if screenUpsideDownShuffling then
                    doTweenAngle('camRotFalling', 'camHUD', 190, 0.05, "cubeOut");
                else
                    doTweenAngle('camRotFalling', 'camHUD', 10, 0.05, "cubeOut");
                end
            end
        end
    end
end

function onStepHit()
    -- Funny Credits
    if curStep == 1 then
        makeLuaSprite('creditText', "creditIntroSongA", 850, 250);
        setObjectCamera('creditText', "other");
        addLuaSprite('creditText', false);
        setProperty('creditText.alpha', 0);
        scaleObject('creditText', 1.5, 1.5);
        doTweenAlpha('creditTextShow', "creditText", 1, 1, "quintOut");
        doTweenY('creditTextFall', "creditText", 350, 1, "quintOut");
    end
    if curStep == 15 then
        removeLuaSprite("creditText",true)
        makeLuaSprite('creditText', "creditIntroSongB", 200, 250);
        setObjectCamera('creditText', "other");
        addLuaSprite('creditText', false);
        scaleObject('creditText', 1.5, 1.5);
        setProperty('creditText.alpha', 0);
        doTweenY('creditTextFall', "creditText", 350, 1, "quintOut")
        doTweenAlpha('creditTextShow', "creditText", 1, 1, "quintOut");
    end
    if curStep == 30 then
        removeLuaSprite("creditText",true)
        makeLuaSprite('creditText', "creditIntroSongC", 850, 250);
        setObjectCamera('creditText', "other");
        addLuaSprite('creditText', false);
        scaleObject('creditText', 1.5, 1.5);
        setProperty('creditText.alpha', 0);
        doTweenY('creditTextFall' , "creditText", 350, 1, "quintOut")
        doTweenAlpha('creditTextShow', "creditText", 1, 1, "quintOut");
    end
    if curStep == 45 then
        removeLuaSprite("creditText",true)
        makeLuaSprite('creditText', "creditIntroSongD", 200, 250);
        setObjectCamera('creditText', "other");
        addLuaSprite('creditText', false);
        scaleObject('creditText', 1.5, 1.5);
        setProperty('creditText.alpha', 0);
        doTweenY('creditTextFall', "creditText", 350, 1, "quintOut")
        doTweenAlpha('creditTextShow', "creditText", 1, 1, "quintOut");
    end

    -- Revised stuff
    if curStep == 622 then -- Center
        noteTweenX('note4x' .. getSongPosition(), 4, 412, 2, "cubeInOut");
        noteTweenX('note5x' .. getSongPosition(), 5, 524, 2, "cubeInOut");
        noteTweenX('note6x' .. getSongPosition(), 6, 636, 2, "cubeInOut");
        noteTweenX('note7x' .. getSongPosition(), 7, 748, 2, "cubeInOut");
        noteTweenY('note4y' .. getSongPosition(), 4, 150, 2, "cubeInOut");
        noteTweenY('note5y' .. getSongPosition(), 5, 150, 2, "cubeInOut");
        noteTweenY('note6y' .. getSongPosition(), 6, 150, 2, "cubeInOut");
        noteTweenY('note7y' .. getSongPosition(), 7, 150, 2, "cubeInOut");
    end
    if curStep == 764 then -- Final Dance Fastfall
        noteTweenX('note4x' .. getSongPosition(), 4, 732, 1, "cubeInOut");
        noteTweenX('note5x' .. getSongPosition(), 5, 844, 1, "cubeInOut");
        noteTweenX('note6x' .. getSongPosition(), 6, 956, 1, "cubeInOut");
        noteTweenX('note7x' .. getSongPosition(), 7, 1068, 1, "cubeInOut");
        noteTweenY('note4y' .. getSongPosition(), 4, 50, 1, "cubeInOut");
        noteTweenY('note5y' .. getSongPosition(), 5, 50, 1, "cubeInOut");
        noteTweenY('note6y' .. getSongPosition(), 6, 50, 1, "cubeInOut");
        noteTweenY('note7y' .. getSongPosition(), 7, 50, 1, "cubeInOut");
        noteTweenAngle('note4rot' .. getSongPosition(), 4, 0, 1, "elasticOut");
        noteTweenAngle('note5rot' .. getSongPosition(), 5, 0, 1, "elasticOut");
        noteTweenAngle('note6rot' .. getSongPosition(), 6, 0, 1, "elasticOut");
        noteTweenAngle('note7rot' .. getSongPosition(), 7, 0, 1, "elasticOut");
    end

    if curStep == 1290 then
        doTweenX('dadX' .. getSongPosition(),'dad', 400, 0.01, "cubeInOut");
        doTweenY('dadY' .. getSongPosition(),'dad', 450, 0.01, "cubeInOut");
        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0.5, 0.5, "cubeInOut");
    end
    if curStep == 1484 then
        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0, 0.5, "cubeInOut");
    end

    if curStep == 1493 then
        noteTweenY('note0y' .. getSongPosition(), 0, 350, 0.01, "sineOut");
        noteTweenY('note1y' .. getSongPosition(), 1, 350, 0.01, "sineOut");
        noteTweenY('note2y' .. getSongPosition(), 2, 350, 0.01, "sineOut");
        noteTweenY('note3y' .. getSongPosition(), 3, 350, 0.01, "sineOut");

        noteTweenX('note0x' .. getSongPosition(), 0, 92, 0.01, "cubeInOut");
        noteTweenX('note1x' .. getSongPosition(), 1, 204, 0.01, "cubeInOut");
        noteTweenX('note2x' .. getSongPosition(), 2, 316, 0.01, "cubeInOut");
        noteTweenX('note3x' .. getSongPosition(), 3, 428, 0.01, "cubeInOut");

        noteTweenAlpha('note0alpha' .. getSongPosition(), 0, 1, 0.5, "cubeInOut");
        noteTweenAlpha('note1alpha' .. getSongPosition(), 1, 1, 0.5, "cubeInOut");
        noteTweenAlpha('note2alpha' .. getSongPosition(), 2, 1, 0.5, "cubeInOut");
        noteTweenAlpha('note3alpha' .. getSongPosition(), 3, 1, 0.5, "cubeInOut");

        doTweenX('dadX' .. getSongPosition(),'dad', 250, 0.01, "cubeInOut");
        doTweenY('dadY' .. getSongPosition(),'dad', 750, 0.01, "cubeInOut");
        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0.5, 0.5, "cubeInOut");
    end
    if curStep == 1502 then
        noteTweenAlpha('note0alpha' .. getSongPosition(), 0, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note1alpha' .. getSongPosition(), 1, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note2alpha' .. getSongPosition(), 2, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note3alpha' .. getSongPosition(), 3, 0, 0.5, "cubeInOut");

        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0, 0.25, "cubeInOut");
        doTweenX('dadX' .. getSongPosition(),'dad', 450, 0.5, "cubeInOut");
        doTweenY('dadY' .. getSongPosition(),'dad', 450, 0.5, "cubeInOut");
    end
    if curStep == 1511 then
        noteTweenY('note0y' .. getSongPosition(), 0, 300, 0.01, "sineOut");
        noteTweenY('note1y' .. getSongPosition(), 1, 300, 0.01, "sineOut");
        noteTweenY('note2y' .. getSongPosition(), 2, 300, 0.01, "sineOut");
        noteTweenY('note3y' .. getSongPosition(), 3, 300, 0.01, "sineOut");

        noteTweenX('note0x' .. getSongPosition(), 0, 1112, 0.01, "cubeInOut");
        noteTweenX('note1x' .. getSongPosition(), 1, 1224, 0.01, "cubeInOut");
        noteTweenX('note2x' .. getSongPosition(), 2, 1336, 0.01, "cubeInOut");
        noteTweenX('note3x' .. getSongPosition(), 3, 1448, 0.01, "cubeInOut");

        noteTweenAlpha('note0alpha' .. getSongPosition(), 0, 1, 0.5, "cubeInOut");
        noteTweenAlpha('note1alpha' .. getSongPosition(), 1, 1, 0.5, "cubeInOut");
        noteTweenAlpha('note2alpha' .. getSongPosition(), 2, 1, 0.5, "cubeInOut");
        noteTweenAlpha('note3alpha' .. getSongPosition(), 3, 1, 0.5, "cubeInOut");

        doTweenX('dadX' .. getSongPosition(),'dad', 1270, 0.01, "cubeInOut");
        doTweenY('dadY' .. getSongPosition(),'dad', 450, 0.01, "cubeInOut");
        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0.5, 0.5, "cubeInOut");
    end
    if curStep == 1518 then
        noteTweenAlpha('note0alpha' .. getSongPosition(), 0, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note1alpha' .. getSongPosition(), 1, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note2alpha' .. getSongPosition(), 2, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note3alpha' .. getSongPosition(), 3, 0, 0.5, "cubeInOut");

        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0, 0.25, "cubeInOut");
        doTweenX('dadX' .. getSongPosition(),'dad', 400, 0.5, "cubeInOut");
        doTweenY('dadY' .. getSongPosition(),'dad', 450, 0.5, "cubeInOut");
    end

    if curStep == 1 then
        noteTweenY('note4y' .. getSongPosition(), 4, -150, 0.01, "sineOut");
        noteTweenY('note5y' .. getSongPosition(), 5, -150, 0.01, "sineOut");
        noteTweenY('note6y' .. getSongPosition(), 6, -150, 0.01, "sineOut");
        noteTweenY('note7y' .. getSongPosition(), 7, -150, 0.01, "sineOut");
    end
    if curStep == 2 then
        noteTweenAlpha('showNotes4', 4, 1, 3, "cubeInOut");
        noteTweenY('note4y' .. getSongPosition(), 4, 50, 2, "sineOut");
    end
    if curStep == 15 then
        noteTweenAlpha('showNotes5', 5, 1, 3, "cubeInOut");
        noteTweenY('note5y' .. getSongPosition(), 5, 50, 2, "sineOut");
    end
    if curStep == 30 then
        noteTweenAlpha('showNotes6', 6, 1, 3, "cubeInOut");
        noteTweenY('note6y' .. getSongPosition(), 6, 50, 2, "sineOut");
    end
    if curStep == 45 then
        noteTweenAlpha('showNotes7', 7, 1, 3, "cubeInOut");
        noteTweenY('note7y' .. getSongPosition(), 7, 50, 2, "sineOut");
    end
    if curStep == 60 then
        doTweenAlpha('minutehandFade', 'minutehand', 0.5, 0.5, "cubeInOut");
        doTweenAlpha('hourhandFade', 'hourhand', 0.5, 0.5, "cubeInOut");
    end
    if curStep == 62 then
        doTweenAngle('minutehandTurn', 'minutehand', 30, 0.5, "elasticOut");
        doTweenAngle('hourhandTurn', 'hourhand', 2.5, 0.5, "elasticOut");
    end
    if curStep == 64 then
        --glitching = true;
    end
    if curStep == 66 then
        --glitching = false;
        doTweenAngle('minutehandTurn', 'minutehand', 60, 0.5, "elasticOut");
        doTweenAngle('hourhandTurn', 'hourhand', 5, 0.5, "elasticOut");
    end
    if curStep == 67 then
        --glitching = true;
    end
    if curStep == 70 then
        --glitching = false;
        doTweenAngle('minutehandTurn', 'minutehand', 90, 0.5, "elasticOut");
        doTweenAngle('hourhandTurn', 'hourhand', 7.5, 0.5, "elasticOut");
    end
    if curStep == 71 then
        --glitching = true;
    end
    if curStep == 73 then
        --glitching = false;
        doTweenAngle('minutehandTurn', 'minutehand', 120, 0.5, "elasticOut");
        doTweenAngle('hourhandTurn', 'hourhand', 10, 0.5, "elasticOut");
        doTweenAlpha('minutehandFade', 'minutehand', 0, 0.5, "cubeInOut");
        doTweenAlpha('hourhandFade', 'hourhand', 0, 0.5, "cubeInOut");
    end

    if curStep == 185 then
        addGrayscaleEffect("camhud");
    end
    if curStep == 197 then
        noteTweenX('note4x' .. getSongPosition(), 4, 692, 12.5, "sineIn");
        noteTweenX('note5x' .. getSongPosition(), 5, 824, 12.5, "sineIn");
        noteTweenX('note6x' .. getSongPosition(), 6, 976, 12.5, "sineIn");
        noteTweenX('note7x' .. getSongPosition(), 7, 1108, 12.5, "sineIn");
        noteTweenY('note4y' .. getSongPosition(), 4, 30, 12.5, "sineIn");
        noteTweenY('note5y' .. getSongPosition(), 5, 100, 12.5, "sineIn");
        noteTweenY('note6y' .. getSongPosition(), 6, 10, 12.5, "sineIn");
        noteTweenY('note7y' .. getSongPosition(), 7, 75, 12.5, "sineIn");
        noteTweenAngle('note4rot' .. getSongPosition(), 4, 35, 12.5, "sineIn");
        noteTweenAngle('note5rot' .. getSongPosition(), 5, 15, 12.5, "sineIn");
        noteTweenAngle('note6rot' .. getSongPosition(), 6, -30, 12.5, "sineIn");
        noteTweenAngle('note7rot' .. getSongPosition(), 7, 60, 12.5, "sineIn");
        doTweenX('boyfriendXscale' .. getSongPosition(), "boyfriend.scale", 0.5, 12.5, "sineIn");
        doTweenY('boyfriendYscale' .. getSongPosition(), "boyfriend.scale", 0.5, 12.5, "sineIn");
        doTweenZoom('camZoom' .. getSongPosition(), 'camHUD', 0.5, 12.5, "sineIn");
        doTweenAngle('camRot' .. getSongPosition(), 'camHUD', 15, 12.5, "sineIn");
    end
    if curStep == 314 then
        noteTweenX('note4x' .. getSongPosition(), 4, 732, 1, "elasticOut");
        noteTweenX('note5x' .. getSongPosition(), 5, 844, 1, "elasticOut");
        noteTweenX('note6x' .. getSongPosition(), 6, 956, 1, "elasticOut");
        noteTweenX('note7x' .. getSongPosition(), 7, 1068, 1, "elasticOut");
        noteTweenY('note4y' .. getSongPosition(), 4, 50, 1, "elasticOut");
        noteTweenY('note5y' .. getSongPosition(), 5, 50, 1, "elasticOut");
        noteTweenY('note6y' .. getSongPosition(), 6, 50, 1, "elasticOut");
        noteTweenY('note7y' .. getSongPosition(), 7, 50, 1, "elasticOut");
        noteTweenAngle('note4rot' .. getSongPosition(), 4, 0, 1, "elasticOut");
        noteTweenAngle('note5rot' .. getSongPosition(), 5, 0, 1, "elasticOut");
        noteTweenAngle('note6rot' .. getSongPosition(), 6, 0, 1, "elasticOut");
        noteTweenAngle('note7rot' .. getSongPosition(), 7, 0, 1, "elasticOut");
        doTweenZoom('camZoom' .. getSongPosition(), 'camHUD', 1, 1, "elasticOut");
        doTweenX('boyfriendXscale' .. getSongPosition(), "boyfriend.scale", 1, 1, "elasticOut");
        doTweenY('boyfriendYscale' .. getSongPosition(), "boyfriend.scale", 1, 1, "elasticOut");
        doTweenAngle('camRot' .. getSongPosition(), 'camHUD', 0, 1, "elasticOut");

        noteDanceEffect = 2;
        doFlashEffect(0.5);
        clearEffects("camhud");
        addScanlineEffect("camhud",false);
    end
    if curStep == 317 then
        showFakeNotes = true;
        beatEffect = 2;
    end
    if curStep == 384 then
        beatEffect = 1;
        addInvertEffect("camgame",true);
    end
    if curStep == 391 then
        beatEffect = 2;
    end
    if curStep == 576 then
        beatEffect = 0;
        lineFallSpeed = 0.1;
        noteDanceEffect = 0;
        showFakeNotes = false;
        doFlashEffect(0.5);
        addInvertEffect("camgame",true);
        cameraShake('game', 0.05, 0.5);
        characterPlayAnim("boyfriend", "hurt", false);
    end
    if curStep == 581 then
        cameraShake('game', 0.01, 20);
    end
    if curStep > 575 then
        if curStep < 768 then
            characterPlayAnim("boyfriend", "hurt", false);
        end
    end
    if curStep == 768 then
        lineFallSpeed = 0.4;
        characterPlayAnim("boyfriend", "pre-attack", false);
    end
    if curStep == 771 then
        lineFallSpeed = 0.4;
        noteDanceEffect = 0;
        showFakeNotes = false;
        characterDance("boyfriend");
    end

    if curStep == 833 then
        doFlashEffect(0.5);
    end
    ShuffleNotes(curStep);

    if curStep == 963 then
        doFlashEffect(0.5);
        fakeNoteOpacity = 0.25;
        showFakeNotes = true;
        noteDanceEffect = 3;
        beatEffect = 3;
    end
    if curStep == 1088 then
        showFakeNotes = false;
        noteDanceEffect = 0;
        beatEffect = 0;
    end
    if curStep == 1150 then
        beatEffect = 1;
    end
    if curStep == 1157 then
        doFlashEffect(0.5);
        showFakeNotes = true;
        noteDanceEffect = 3;
        beatEffect = 4;
    end
    if curStep == 1215 then
        showFakeNotes = false;
        noteDanceEffect = 1;
        beatEffect = 0;
    end
    if curStep == 1230 then
        noteTweenX('note4x' .. getSongPosition(), 4, 692, 28, "sineIn");
        noteTweenX('note5x' .. getSongPosition(), 5, 824, 28, "sineIn");
        noteTweenX('note6x' .. getSongPosition(), 6, 976, 28, "sineIn");
        noteTweenX('note7x' .. getSongPosition(), 7, 1108, 28, "sineIn");
        noteTweenY('note4y' .. getSongPosition(), 4, 30, 28, "sineIn");
        noteTweenY('note5y' .. getSongPosition(), 5, 100, 28, "sineIn");
        noteTweenY('note6y' .. getSongPosition(), 6, 10, 28, "sineIn");
        noteTweenY('note7y' .. getSongPosition(), 7, 75, 28, "sineIn");
        noteTweenAngle('note4rot' .. getSongPosition(), 4, 35, 28, "sineIn");
        noteTweenAngle('note5rot' .. getSongPosition(), 5, 15, 28, "sineIn");
        noteTweenAngle('note6rot' .. getSongPosition(), 6, -30, 28, "sineIn");
        noteTweenAngle('note7rot' .. getSongPosition(), 7, 60, 28, "sineIn");
        doTweenX('boyfriendXscale' .. getSongPosition(), "boyfriend.scale", 0.5, 28, "sineIn");
        doTweenY('boyfriendYscale' .. getSongPosition(), "boyfriend.scale", 0.5, 28, "sineIn");
        doTweenZoom('camZoom' .. getSongPosition(), 'camHUD', 0.5, 31, "sineIn");
        doTweenAngle('camRot' .. getSongPosition(), 'camHUD', -15, 31, "sineIn");
        
    end
    if curStep == 1520 then
        noteTweenX('note4x' .. getSongPosition(), 4, 412, 0.5, "elasticOut");
        noteTweenX('note5x' .. getSongPosition(), 5, 524, 0.5, "elasticOut");
        noteTweenX('note6x' .. getSongPosition(), 6, 636, 0.5, "elasticOut");
        noteTweenX('note7x' .. getSongPosition(), 7, 748, 0.5, "elasticOut");
        noteTweenY('note4y' .. getSongPosition(), 4, 50, 1, "elasticOut");
        noteTweenY('note5y' .. getSongPosition(), 5, 50, 1, "elasticOut");
        noteTweenY('note6y' .. getSongPosition(), 6, 50, 1, "elasticOut");
        noteTweenY('note7y' .. getSongPosition(), 7, 50, 1, "elasticOut");
        noteTweenAngle('note4rot' .. getSongPosition(), 4, 0, 1, "elasticOut");
        noteTweenAngle('note5rot' .. getSongPosition(), 5, 0, 1, "elasticOut");
        noteTweenAngle('note6rot' .. getSongPosition(), 6, 0, 1, "elasticOut");
        noteTweenAngle('note7rot' .. getSongPosition(), 7, 0, 1, "elasticOut");
        doTweenZoom('camZoom' .. getSongPosition(), 'camHUD', 1, 1, "elasticOut");
        doTweenX('boyfriendXscale' .. getSongPosition(), "boyfriend.scale", 1, 1, "elasticOut");
        doTweenY('boyfriendYscale' .. getSongPosition(), "boyfriend.scale", 1, 1, "elasticOut");
        doTweenAngle('camRot' .. getSongPosition(), 'camHUD', 0, 1, "elasticOut");

        noteTweenY('note0y' .. getSongPosition(), 0, 50, 0.01, "cubeInOut");
        noteTweenY('note1y' .. getSongPosition(), 1, 50, 0.01, "cubeInOut");
        noteTweenY('note2y' .. getSongPosition(), 2, 50, 0.01, "cubeInOut");
        noteTweenY('note3y' .. getSongPosition(), 3, 50, 0.01, "cubeInOut");
        noteTweenX('note0x' .. getSongPosition(), 0, 188, 0.01, "elasticOut");
        noteTweenX('note1x' .. getSongPosition(), 1, 300, 0.01, "elasticOut");
        noteTweenX('note2x' .. getSongPosition(), 2, 860, 0.01, "elasticOut");
        noteTweenX('note3x' .. getSongPosition(), 3, 972, 0.01, "elasticOut");
        noteTweenAlpha('note0alpha' .. getSongPosition(), 0, 0.5, 0.5, "cubeInOut");
        noteTweenAlpha('note1alpha' .. getSongPosition(), 1, 0.5, 0.5, "cubeInOut");
        noteTweenAlpha('note2alpha' .. getSongPosition(), 2, 0.5, 0.5, "cubeInOut");
        noteTweenAlpha('note3alpha' .. getSongPosition(), 3, 0.5, 0.5, "cubeInOut");

        noteDanceEffect = 0;
        doFlashEffect(0.5);
        clearEffects("camhud");
        addScanlineEffect("camhud",false);
        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0.5, 0.25, "cubeInOut");
    end
    if curStep == 1529 then
        noteTweenX('note4x' .. getSongPosition(), 4, 732, 1, "cubeInOut");
        noteTweenX('note5x' .. getSongPosition(), 5, 844, 1, "cubeInOut");
        noteTweenX('note6x' .. getSongPosition(), 6, 956, 1, "cubeInOut");
        noteTweenX('note7x' .. getSongPosition(), 7, 1068, 1, "cubeInOut");
        noteTweenX('note0x' .. getSongPosition(), 0, 92, 1, "cubeInOut");
        noteTweenX('note1x' .. getSongPosition(), 1, 204, 1, "cubeInOut");
        noteTweenX('note2x' .. getSongPosition(), 2, 316, 1, "cubeInOut");
        noteTweenX('note3x' .. getSongPosition(), 3, 428, 1, "cubeInOut");
        noteTweenAlpha('note0alpha' .. getSongPosition(), 0, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note1alpha' .. getSongPosition(), 1, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note2alpha' .. getSongPosition(), 2, 0, 0.5, "cubeInOut");
        noteTweenAlpha('note3alpha' .. getSongPosition(), 3, 0, 0.5, "cubeInOut");
        doTweenAlpha('dadAlpha' .. getSongPosition(),'dad', 0, 0.5, "cubeInOut");
    end
    if curStep == 1536 then
        showFakeNotes = false;
        noteDanceEffect = 0;
        doFlashEffect(0.5);
        beatEffect = 1;
    end
    if curStep == 1595 then
        fakeNoteOpacity = 0.4;
        showFakeNotes = true;
        noteDanceEffect = 2;
        beatEffect = 2;
        doFlashEffect(0.5);
    end

    if curStep == 952 then 
        noteTweenX('note0x' .. getSongPosition(), 0, 92, 3, "cubeInOut");
        noteTweenX('note1x' .. getSongPosition(), 1, 204, 3, "cubeInOut");
        noteTweenX('note2x' .. getSongPosition(), 2, 316, 3, "cubeInOut");
        noteTweenX('note3x' .. getSongPosition(), 3, 428, 3, "cubeInOut");

        noteTweenX('note4x' .. getSongPosition(), 4, 732, 1.5, "cubeInOut");
        noteTweenX('note5x' .. getSongPosition(), 5, 844, 1.5, "cubeInOut");
        noteTweenX('note6x' .. getSongPosition(), 6, 956, 1.5, "cubeInOut");
        noteTweenX('note7x' .. getSongPosition(), 7, 1068, 1.5, "cubeInOut");
        noteTweenY('note4y' .. getSongPosition(), 4, 50, 1.5, "cubeInOut");
        noteTweenY('note5y' .. getSongPosition(), 5, 50, 1.5, "cubeInOut");
        noteTweenY('note6y' .. getSongPosition(), 6, 50, 1.5, "cubeInOut");
        noteTweenY('note7y' .. getSongPosition(), 7, 50, 1.5, "cubeInOut");
        noteTweenAngle('note0rot' .. getSongPosition(), 0, 0, 1.5, "backOut");
        noteTweenAngle('note1rot' .. getSongPosition(), 1, 0, 1.5, "backOut");
        noteTweenAngle('note2rot' .. getSongPosition(), 2, 0, 1.5, "backOut");
        noteTweenAngle('note3rot' .. getSongPosition(), 3, 0, 1.5, "backOut");
        noteTweenAngle('note4rot' .. getSongPosition(), 4, 0, 1.5, "backOut");
        noteTweenAngle('note5rot' .. getSongPosition(), 5, 0, 1.5, "backOut");
        noteTweenAngle('note6rot' .. getSongPosition(), 6, 0, 1.5, "backOut");
        noteTweenAngle('note7rot' .. getSongPosition(), 7, 0, 1.5, "backOut");
        doTweenAngle('hudRot' .. getSongPosition(), "camHUD", 0, 1.5, "backOut")
        doTweenAngle('gameRot' .. getSongPosition(), "camGame", 0, 1.5, "backOut")
        screenUpsideDownShuffling = false;
        doTweenX('effectHelp' .. getSongPosition(), 'effectHelper', 900, 0.1, "cubeInOut")
    end

    if curStep == 1920 then
        beatEffect = 4;
        lineFallSpeed = 0.1;
        doFlashEffect(0.5);
        addInvertEffect("camgame",true);
        cameraShake('game', 0.05, 0.5);
        characterPlayAnim("boyfriend", "hurt", false);
        noteDanceEffect = 3;
    end
    if curStep == 1925 then
        cameraShake('game', 0.01, 13);
        fakeNoteOpacity = 0.3;
    end
    if curStep > 1920 then
        if curStep < 2048 then
            characterPlayAnim("boyfriend", "hurt", false);
        end
    end
    if curStep == 2048 then
        clearEffects("camhud");
        clearEffects("camgame");
        doFlashEffect(0.5);
        beatEffect = 0;
        lineFallSpeed = 0.7;
        showFakeNotes = false;
    end
    if curStep == 2048 then
        noteTweenAlpha('hideNote4' .. getSongPosition(), 4, 0, 1, "cubeInOut");
        noteTweenY('note4y' .. getSongPosition(), 4, -150, 2, "sineOut");
    end
    if curStep == 2056 then
        noteTweenAlpha('hideNote5' .. getSongPosition(), 5, 0, 1, "cubeInOut");
        noteTweenY('note5y' .. getSongPosition(), 5, -150, 2, "sineOut");
    end
    if curStep == 2064 then
        noteTweenAlpha('hideNote6' .. getSongPosition(), 6, 0, 1, "cubeInOut");
        noteTweenY('note6y' .. getSongPosition(), 6, -150, 2, "sineOut");
    end
    if curStep == 2072 then
        noteTweenAlpha('hideNote7' .. getSongPosition(), 7, 0, 1, "cubeInOut");
        noteTweenY('note7y' .. getSongPosition(), 7, -150, 2, "sineOut");
    end
end