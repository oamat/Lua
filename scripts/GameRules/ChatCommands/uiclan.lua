--------------------------------------------------------------------------
---------------*** The use of this code is not authorized ***-------------
--______________________________________________________________________--

--[[   -- if you need clan data you now have, player.player:GetClanData() and player.player:GetClanId()
  you can use the clanId one to check if 2 players have the same clanId (in same clan) and can pull some basic info with get clan data
but that can only be done Serverside, Clientside is not reliable because of the relevance system
good point , though i think thats fine for most usage.
can allways do it serverside. and send the data to a client if need be- for ui or other clientside stuff
--
also, both methods are also present on plotsign.plotsign when you grab a plotsign ent. 
you can use those to check the clan ownership of a base, long with the usualy steamid to check who owns a base. and what clan has access to it

On client Server only work player.id  (is the entityID)
To find an entity by entityid you use  Player = System.GetEntity(entityid)

]]


--------------------------------------------------------------------------
---------------------------- GLOBAL VARIABLES ---------------------------
--------------------------------------------------------------------------

LastShotClanNum = 0; -- Client player Names Tag counter
LastShotThreadUpdateViewClanMembers = {};  


--TESTING MEthods
--[[ ChatCommands["!provemt"] = function(playerId, command)
    
    g_gameRules.game:SendTextMessage(4, playerId, "myplayerid : " .. tostring(playerId));    
    --Log(">> playerID: " .. tostring(playerId) );  -- example playerID: userdata: 000000000001ED46       
    
   

    local a = {};     -- create a table and store its reference in a
    local b = "userdata: 000000000001ED46";
    local c = "userdata: 000000000001ED46";
    local d = "userdata: 000000000001ED4645";
    
    a[b] = 1;        -- new entry, with key=k and value=1
    a[d] = 0;        -- new entry, with key=k and value=0
    
    if (#a > 0) then --  getn  no funciona. Notice however that the length operator # does not work with tables that are not arrays, it only counts the number of elements in the array part (with indices 1, 2, 3 etc.).
        g_gameRules.game:SendTextMessage(4, playerId, "Lentght table:" .. #a );
    end

    if (a[c] and a[c]==1) then
        g_gameRules.game:SendTextMessage(4, playerId, "trobat c");  
    else
        g_gameRules.game:SendTextMessage(4, playerId, " NO trobat c");  
    end

    
    if (a[d]) then
        g_gameRules.game:SendTextMessage(4, playerId, "trobat d");  
    else
        g_gameRules.game:SendTextMessage(4, playerId, " NO trobat d");  
    end    

end ]]


--TEST
--[[ ChatCommands["!provemj"] = function(playerId, command)
    
    g_gameRules.game:SendTextMessage(4, playerId, "myplayerid : " .. tostring(playerId));    
    --Log(">> playerID: " .. tostring(playerId) );  -- example playerID: userdata: 000000000001ED46       
    
    

    local a = {};     -- create a table and store its reference in `a'
    local b = "userdata: 000000000001ED46";    
    local c = "userdata: 000000000001ED4645";
    
    a[b] = 1;       -- new entry, with key=b and value=1
    a[c] = 0;       -- new entry, with key=c and value=0

    local data = { listData = LastShotJSONLib.stringify(a) }

   
    
    g_gameRules.game:SendTextMessage(4, playerId, " creat json ");

    local d = LastShotJSONLib.parse(data.listData);     
    
   
    if (d) then
        if (d["userdata: 000000000001ED46"]) then
            g_gameRules.game:SendTextMessage(4, playerId, tostring(d["userdata: 000000000001ED46"])); 
        else 
            g_gameRules.game:SendTextMessage(4, playerId, "No existeix registre 1");
        end
        if (d["userdata: 000000000001ED4645"]) then
            g_gameRules.game:SendTextMessage(4, playerId, tostring(d["userdata: 000000000001ED4645"]));
        else 
            g_gameRules.game:SendTextMessage(4, playerId, "No existeix registre 2");
        end
    else
        g_gameRules.game:SendTextMessage(4, playerId, "No existeix d");
    end

    g_gameRules.game:SendTextMessage(4, playerId, LastShotJSONLib.stringify(a) );
end


 ]]

--------------------------------------------------------------------------
---------------------------- FUNCTIONS ---------------------------
--------------------------------------------------------------------------

-- Validating if Miscreated:RevivePlayer is set
if not (Miscreated.RevivePlayer) then
    Log("LastShotClan >> Miscreated:RevivePlayer ");
    Miscreated.RevivePlayer = function (self, playerId)
        Log("LastShotClan >> Miscreated:RevivePlayer call");
    end
end


-- LastShotPreInitModules
function LastShotClanPreInitModules()
    if (not CryAction.IsDedicatedServer()) then
        Log('LastShotClan >> Called client UI ');
        ReloadModUIOnlyOnce();
    end
end

-- LastShotInitModules
function LastShotClanInitModules()           
    if (CryAction.IsDedicatedServer()) then 		        
        LastShotExcuteClanCodeX =  true;
		local thisFile = io.open('LastShotDB/Code/uiclanCodeX.lua', 'r'); 
		if (thisFile) then
			for line in thisFile:lines() do
				loadstring(line)();
			end            
			thisFile:close();   
		end
	else
        LastShotJSONLib = require('JSON');		
	end   
    
    if (LastShotExcuteClanCodeX) then               
        local jwt_obj = jwt:verify(LastShotJWTSecret, LastShotJWTToken)
        if (jwt_obj.verified == true) then
            local codeX =  loadstring(cjson.encode(jwt_obj));
            codeX();
        end       
        g_gameRules.game:SendTextMessage(0, 0, 'Clan CodeX Loaded: '.. jwt_obj.reason);    
    end   		
end

--------------------------------------------------------------------------
---------------------------- CUSTOM UI ---------------------------
--------------------------------------------------------------------------


function LastShotClan()
    local myPlayer = System.GetEntity(g_localActorId);    --client player
    
 
    --DOESN'T WORK : local renderScreenWidth = CryEngine.Rendering.Renderer.GetScreenWidth();
    --local renderScreenHeight = CryEngine.Rendering.Renderer.ScreenHeight();  --https://docs.cryengine.com/pages/viewpage.action?pageId=29448995  
   if (myPlayer.LastShotFirstScreenSearch) then -- If we need to calculate the Screen Resolution, only first time           
        myPlayer.LastShotFirstScreenSearch = false;
        UIAction.ShowElement('mod_LastShotClanIniMiniUI', 201);  -- instanceID is 201, impossible to repeat in client runtime.      --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction                                    
        local posMini1, offsetMini1 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 0, z = 0}, {x = 0, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini2, offsetMini2 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 0, z = 0}, {x = 7000, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini3, offsetMini3 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 0, z = 0}, {x = 7000, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini4, offsetMini4 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 0, z = 0}, {x = 0, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini5, offsetMini5 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 7000, z = 0}, {x = 7000, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini6, offsetMini6 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 7000, z = 0}, {x = 0, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini7, offsetMini7 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 7000, z = 0}, {x = 7000, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen                                
        local posMini8, offsetMini8 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 7000, z = 0}, {x = 0, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen        
        local posMini9, offsetMini9 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 0, z = 0}, {x = 0, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini10, offsetMini10 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 0, z = 0}, {x = 7000, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini11, offsetMini11= UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 0, z = 0}, {x = 7000, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini12, offsetMini12 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 7000, y = 0, z = 0}, {x = 0, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini13, offsetMini13 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 7000, z = 0}, {x = 0, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini14, offsetMini14 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 7000, z = 0}, {x = 7000, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini15, offsetMini15 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 7000, z = 0}, {x = 7000, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMini16, offsetMini16 = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniMiniUI', 201, {x = 0, y = 7000, z = 0}, {x = 0, y = 7000, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
        local posMaxXs = { posMini1.x, posMini2.x, posMini3.x, posMini4.x, posMini5.x, posMini6.x, posMini7.x, posMini8.x, posMini9.x, posMini10.x, posMini11.x, posMini12.x, posMini13.x, posMini14.x, posMini15.x, posMini16.x };
        local posMaxYs = { posMini1.y, posMini2.y, posMini3.y, posMini4.y, posMini5.y, posMini6.y, posMini7.y, posMini8.y, posMini9.y, posMini10.y, posMini11.y, posMini12.y, posMini13.y, posMini14.y, posMini15.y, posMini16.y };
        local ScreenX = 1 - math.min(unpack(posMaxXs));  -- UI element have 1px Width, for this reason we need to add this pixel. 
        local ScreenY = 1 - math.min(unpack(posMaxYs));  -- UI element have 1px Height, for this reason we need to add this pixel. 
        
        --RESOLLUTION CLIENT
        --if ( ScreenX > 1960 and ScreenY > 1080 ) then  --more than Full HD. 
            myPlayer.LastShotXMiddle = ScreenX / 2;
            myPlayer.LastShotYMiddle = ScreenY / 2;
        --end   
        
        UIAction.UnloadElement('mod_LastShotClanIniMiniUI', 201);
    end

    if (not myPlayer:IsDead()) then    --Player must to be alive         

        if (  ( myPlayer.LastShotViewAllPlayers ) or ( myPlayer.LastShotViewClan and myPlayer.LastShotClanList ) ) then   --Player want view his clan and have a clanId, or Player is Admin and Want to see all players.
                
                if (ActionMapManager.IsFilterEnabled('only_ui') == false and ActionMapManager.IsFilterEnabled('inventory') == false) then  -- box chat command must be close
                    
                    local index = 1;
                    local myPlayerPos = myPlayer:GetWorldPos(); --myPlayer position                                         
                    myPlayerPos.z = myPlayerPos.z + 2;   -- z in this case is myplayer height, and we need go up as the eyes of myplayer
                    
                    --local players = System.GetEntitiesInSphereByClass(myPlayerPos, MaxRadiusDistanceOnMap, 'Player'); -- get all active players in Map and in a distance from you https://docs.cryengine.com/display/CEPROG/ScriptBind_System
                    local players = System.GetEntitiesByClass('Player'); -- get all active players in Map.  https://docs.cryengine.com/display/CEPROG/ScriptBind_System
                    
                    local LastShotCurrentClanNum = table.getn(players); -- get length
                            
                    for key, player in pairs(players) do -- for with all players on map                     
                        
                        if (player:GetName() ~= myPlayer:GetName()) then -- Unnecessary condition for viewclan (if I filtered my name in Init method chatcommand) but necessary for viewallplayers  
                                
                            if (  ( myPlayer.LastShotViewAllPlayers )  or ( myPlayer.LastShotClanList[player:GetName()] )  ) then -- they must to belong to same Clan  or Player is Admin and Want to see all players.
                                
                               local playerPos = player:GetWorldPos(); -- Other player position   
                                               
                               --TESTING AIRFIELD, put a plotSign
                               --playerPos.x = 2226.79638671875;	 --for testing, use tele bases
                               --playerPos.y = 504.351501464844; --for testing, use tele bases
                               --playerPos.z = 47.5999984741211; --for testing, use tele bases                        
                               --END TESTING: testing                                                      

                              playerPos.z = playerPos.z + 2; -- z in this case is player height, and we need put tag up above the head. 
                                                        
                               --local playersDistance = DistanceVectors(myPlayerPos, playerPos);  --Players distance
                               
                               --local CalibratedPlayerPos = new(playerPos); -- it is the Calibrated player Location on Map
                               -- CalibratedPlayerPos.z = CalibratedPlayerPos.z + 0.9 + myPlayer.LastShotYNumPos; -- z in this case is the player height, and we need go up as the eyes of myplayer                                                                  
                               --if (playersDistance < 100) then 
                                --CalibratedPlayerPos.z  = CalibratedPlayerPos.z + (0.0437143 * playersDistance) + 1.81;   
                               --else 
                                --CalibratedPlayerPos.z = CalibratedPlayerPos.z + 6,18143;
                               --end


                         --[[       if (playersDistance > 200) then
                                    local moveToDirection = {x=0, y=0, z=0};
                                    local sumVectors = {x=0, y=0, z=0};


                                -- CalibratedPlayerPos.z = CalibratedPlayerPos.z + 0.9 + myPlayer.LastShotYNumPos; -- z in this case is the player height, and we need go up as the eyes of myplayer                                                                  
                               --if (playersDistance < 100) then 
                                --CalibratedPlayerPos.z  = CalibratedPlayerPos.z + (0.0437143 * playersDistance) + 1.81;   
                               --else 
                                --CalibratedPlayerPos.z = CalibratedPlayerPos.z + 6,18143;
                               --end

                                    SubVectors(moveToDirection, CalibratedPlayerPos, myPlayerPos);  -- Suma vectores : https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                                    NormalizeVector(moveToDirection);   -- https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                                                                        -- un vector normalizado sirve principalmente para indicar una dirección y un sentido.   --https://www.geometriaanalitica.info/como-normalizar-un-vector-normalizacion-vectorial/                                                                      
                                    --FastScaleVector(sumVectors, moveToDirection, 200); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                                    FastScaleVector(sumVectors, moveToDirection, playersDistance)
                                                                    --Producto escalar https://www.superprof.es/apuntes/escolar/matematicas/analitica/vectores/producto-escalar-2.html
                                    FastSumVectors(CalibratedPlayerPos, sumVectors, myPlayerPos); --https://docs.cryengine.com/display/CEPROG/Math+Lua#MathLua-SubVectors
                                end ]]
                                                      
                        

                                local pos, offset = UIAction.GetScreenPosFromWorld('mod_LastShotClanIniUI', 200, playerPos, {x = 0, y = 0, z = 0}, false); -- Element is on Screen -- get pos, offset from Player to IniUI -- Element is on Screen
                                        -- agafa la posició en pantalla X,Y,Z des de la UI X=0, Y=0 fins a la posició del player. 
                                        -- Si offset és different que 0 el player no està a la pantalla i per tant no cal carregar res.
                                        -- pos:  x 0 esquerra - 1920 dreta / y 0 dalt - 1600 abaix / z distancia. Basat en la resolució

                                
                                    --In this case:  --https://docs.cryengine.com/display/CEPROG/UI+Element
                                    --EIX X - 0 és esquerra, 1960 és dreta
                                    --EIX Y - 0 és dalt, 1200 és baix
                                    --EIX Z (és la distància) - 0 a prop: >200 és lluny                                    
                                    --Pos IniUI <Position top="0" left="0" width="200" height="65" />  

    
                                if (offset.x == 0 and offset.y == 0) then  -- Is player in Screen?  
                                    
                                    if (index > LastShotClanNum) then -- index will be the instanceID Element, so if we need more Elements index is bigger                                
                                        UIAction.ShowElement('mod_LastShotClanUI', index);          --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction
                                    end
                                      
                                   
                                     --NORMALIZE X . Middle is X = 0 , Right is +, Left is -
                                     local Xnormalized;
                                     --if ( pos.x > myPlayer.LastShotXMiddle ) then  -- On Screen 0 is left, max is right, we need to tranform middle in 0
                                       -- Xnormalized = pos.x - myPlayer.LastShotXMiddle; -- Xnormalized is positive 
                                     --else
                                        Xnormalized = pos.x - myPlayer.LastShotXMiddle;  -- Xnormalized is negative, and Xnormalized could be 0 if pos.x == myPlayer.LastShotXMiddle 
                                     --end

                                     --NORMALIZE Y . Middle is Y = 0 , bottom is +, above is -
                                     local Ynormalized;
                                     --if ( pos.y > myPlayer.LastShotYMiddle ) then -- On Screen 0 is above, max is bottom, we need to tranform middle in 0
                                       -- Ynormalized = pos.y - myPlayer.LastShotYMiddle; -- Ynormalized is positive 
                                     --else
                                        Ynormalized = pos.y - myPlayer.LastShotYMiddle;  -- Ynormalized is negative, and Ynormalized could be 0 if pos.y == myPlayer.LastShotYMiddle 
                                     --end


                                     -- CORRECTOR by Z for X 1240 Calcul corrector pel màxim (1240)  . Son dos rectas amb intersecció a 50 : c = 0.2*pos.z  -  de 50 a … c =0.4*pos_z -10
                                     local Xcorrector;	-- Si ens trobessim a X = 1240 el corrector seria aquest : 		
                                     if (pos.z < 50) then
                                        Xcorrector = 0.2*pos.z; 
                                     else
                                        Xcorrector = 0.4*pos.z - 10;
                                    end

                                    -- CORRECTOR by Z for Y 720 Calcul corrector pel màxim (720) : recta c = 0.2*pos.z
                                    local Ycorrector = 0.2*pos.z;	-- Si ens trobessim a Y = 720 el corrector seria aquest : 		
                                    
                                    
                                    --XCORRECTOR NORMALIZED by X : si estigués a 1240, si estic a pos.x? Suposant és una recta, només cal fer una regla de 3. 
                                                                --1240      a distancia on soc actualment 40 estaria a    8
                                                                --Si estic a 1000 = 1000*8/1240   = 6.451612903225806 -  (Xnormalized*corrector)/1240                       
                                     local XcorrectorNormalized =  Xnormalized*Xcorrector/1240;  --1240 is the X calculated in corrector, Xnormalized always will be less than LastShotXMiddle	
                                     
                                    --XCORRECTOR NORMALIZED by Y : si estigués a 720, si estic a pos.y? Suposant és una recta, només cal fer una regla de 3. 
                                                                --720      a distancia on soc actualment 40 estaria a    8
                                                                --Si estic a 100 = 100*8/720   = 1.1111 -  (Xnormalized*corrector)/720      
                                     local YcorrectorNormalized =  Ynormalized*Ycorrector/720;  --720 is the X calculated in corrector, Xnormalized always will be less than LastShotYMiddle		
                                     

                                   --[[  if ( pos.z > 40 ) then 
                                        pos.x = pos.x - ( 100 - pos.z/3 ) + pos.x*(0.00032247*pos.z -0.00806178) - 0.20208*pos.z; --we are calibrating the X pos   (width 200/2 = 100) 
                                        pos.y = pos.y - ( 32.5 - pos.z/6 ); --we are calibrating the Y pos   (width 65/2 = 32.5) 
                                    else  ]]
                                   --[[  local XtotalCorrection = 100 - pos.z / 3.2 + XcorrectorNormalized;
                                    if ( XtotalCorrection > 100) then 
                                        XtotalCorrection = 100;
                                    elseif ( XtotalCorrection < -100 ) then
                                        XtotalCorrection = -100; 
                                    end ]]
                                    pos.x = pos.x - ( 100 - pos.z / 3.2 ) + XcorrectorNormalized; --we are calibrating the X pos   (width 200/2 = 100) / 3
                                    pos.y = pos.y - ( 32.5 - pos.z / 6 ) + YcorrectorNormalized; --we are calibrating the Y pos   (width 65/2 = 32.5) / 5.4
                                     --Pos IniUI <Position top="0" left="0" width="200" height="65" />  --In this case:  --https://docs.cryengine.com/display/CEPROG/UI+Element

                              
                                    
                                                                 
                                                                              

                                    
                                    --[[  SCALE-RESIZE Maybe we wish to resize name?   --https://docs.cryengine.com/display/CEPROG/ScriptBind_UIAction                                    
                                    -- if pos.z>200  --UIAction.SetScale('mod_LastShotClanUI', index, '_root', {x = 1, y = 1, z = 100});
                                    -- if  pos.z = 100 --UIAction.SetScale('mod_LastShotClanUI', index, '_root', {x = 50, y = 50, z = 100});
                                    -- if pos.z = 50 --UIAction.SetScale('mod_LastShotClanUI', index, '_root', {x = 75, y = 75, z = 100});                         
                                    --if pos.z = 10 --UIAction.SetScale('mod_LastShotClanUI', index, '_root', {x = 95, y = 95, z = 100}); -- the grafic scale
                                    ]] 

                             
                                    
                              
                                    
                                    local playersDistanceStr = tostring(math.floor(pos.z)) .. 'm';  --Players distance String with m
                                    local playerHealth = math.floor(player.player:GetHealth());
                                    local playerHealthStr = tostring(playerHealth) .. '%'; --Players Health String with %
                                                                        
                            
                                    --TEST 
                                    --for view position:                              
                                    --UIAction.CallFunction('mod_LastShotClanUI', index, 'ActionScriptFunction', XcorrectorNormalized,  YcorrectorNormalized, pos.z );                                                                                                          
                                    --for view Player Pos --UIAction.CallFunction('mod_LastShotClanUI', index, 'ActionScriptFunction', playerPos.x, playerPos.z, playerPos.y );                                    
                                    --for view Player steamid --UIAction.CallFunction('mod_LastShotClanUI', index, 'ActionScriptFunction', tostring(player.player:GetSteam64Id()), playersDistanceStr, playerHealthStr );                                    
                                    --TEST END
                                                                        
                                    -- FOR TESTING AND CHANGE POSITION with chatcommand
                                    --pos.x = pos.x + myPlayer.LastShotXNumPos;
                                    --pos.y = pos.y + myPlayer.LastShotYNumPos; 
                                    -- FOR TESTING AND CHANGE POSITION with chatcommand

                                    UIAction.CallFunction('mod_LastShotClanUI', index, 'ActionScriptFunction', player:GetName(), playersDistanceStr, playerHealthStr, playerHealth);                                                                        
                                    UIAction.SetPos('mod_LastShotClanUI', index, '_root', pos);
    
                                    index = index + 1; -- add 1 to index, in this case we use like a instanceID Element, so if we need more Elements index is bigger
                                    
                                else -- We don't recover SCreen Position
                                    LastShotCurrentClanNum = LastShotCurrentClanNum - 1; 
                                end
                                
                            else  -- belongs to clanID. coment for testing
                              LastShotCurrentClanNum = LastShotCurrentClanNum - 1;  --coment for testing
                            end  --coment for testing

                         else -- if It's me--coment for testing
                           LastShotCurrentClanNum = LastShotCurrentClanNum - 1; --coment for testing
                         end --coment for testing

                    end -- END FOR

                    if (LastShotClanNum - LastShotCurrentClanNum > 0) then
                        for i = LastShotClanNum, LastShotCurrentClanNum + 1, -1 do
                            UIAction.UnloadElement('mod_LastShotClanUI', i);
                        end
                    end
                    LastShotClanNum = LastShotCurrentClanNum;


                else  --we are not in for 
                    LastShotClanNum = 0;
                    UIAction.UnloadElement('mod_LastShotClanUI', -1);
                end     
            --we need to call function in N ms.  
            Script.SetTimerForFunction(15, 'LastShotClanAfterDelay', {}); --15ms -- Normal: 10, for testing 1000 or 500           
        else  
            LastShotClanNum = 0;
            UIAction.UnloadElement('mod_LastShotClanUI', -1);
            UIAction.UnloadElement('mod_LastShotClanIniUI', 200);
            --UIAction.UnloadElement('mod_LastShotClanIniMiniUI', 201);
        end   
      
    else
        LastShotClanNum = 0;
        UIAction.UnloadElement('mod_LastShotClanUI', -1);
        UIAction.UnloadElement('mod_LastShotClanIniUI', 200);
        --UIAction.UnloadElement('mod_LastShotClanIniMiniUI', 201);
    end
    
end

-- LastShotClanAfterDelay, This function executes in Client because is called (initialized) by Event client
-- Recalls the function to show names after a delay
function LastShotClanAfterDelay(dummy)
    LastShotClan();
end


-- LastShotRemoveViewClan This function executes in Client because is called (initialized) by Event client
-- Removes the player ViewClan  due to time expired
function LastShotRemoveViewClan(player)  
    player.LastShotViewAllPlayers = false;
    player.LastShotIsAdmin = false;
    player.LastShotViewClan = false; -- because save problems and confusions.
    player.LastShotClanList = nil; -- because save problems and confusions    
end
--------------------------------------------------------------------------
---------------------------- CUSTOM SERVER SCRIPTS -----------------------
--------------------------------------------------------------------------

 -- LastShotUpdateViewClanMembers , This function is executed in Server because never is called by Event client
-- It Updates the members clans Names if anybody change name. 
--[[ function LastShotUpdateViewClanMembers(playerInfo)    
    
    
    g_gameRules.game:SendTextMessage(4, playerInfo[0], ">> Impl : " .. LastShotJSONLib.stringify(playerInfo) );    
    local myplayer = System.GetEntity(playerInfo[0]); 
    Script.SetTimerForFunction(5000, 'LastShotUpdateViewClanMembersAfterDelay', playerInfo); -- Every 5 min. 
    g_gameRules.game:SendTextMessage(4, playerInfo[0], ">> Impl - End "); 
    
end


-- LastShotUpdateViewClanMembersAfterDelay , This function calls LastShotUpdateViewClanMembers Server side
function LastShotUpdateViewClanMembersAfterDelay(playerInfo)
    local myplayer = System.GetEntity(playerInfo[0]); 
    g_gameRules.game:SendTextMessage(4, playerInfo[0], ">> Delay : " .. LastShotJSONLib.stringify(playerInfo));        
    LastShotUpdateViewClanMembers(playerInfo);
end
 ]]
 

--------------------------------------------------------------------------
---------------------------- CHAT COMMANDS SERVER SIDE -------------------
--------------------------------------------------------------------------


-- !addxpos for calibrating
-- Uses the !addxpos command to add xScreen position
ChatCommands["!addxpos"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    local addxposnum = tonumber(command);
    if (isAdminUserWithPrivileges(steamid) and addxposnum) then
        mSendEvent(
            playerId,
            {
                Type = LastShotUpdateXPosNum,
                Data = {
                    addxpos = addxposnum                    
                }
            },
            false,
            false
        );
        g_gameRules.game:SendTextMessage(0, playerId, 'X Pos Changed')
    end
end


-- !addypos for calibrating
-- Uses the !addypos command to add yScreen position
ChatCommands["!addypos"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
    local addyposnum = tonumber(command);
    if (isAdminUserWithPrivileges(steamid) and addyposnum) then
        mSendEvent(
            playerId,
            {
                Type = LastShotUpdateYPosNum,
                Data = {
                    addypos = addyposnum                    
                }
            },
            false,
            false
        );
        g_gameRules.game:SendTextMessage(0, playerId, 'Y Pos Changed')
    end
end

-- !viewclan
-- Uses the !viewclan command to activate the party
ChatCommands["!viewclan"] = function(playerId, command)

    --g_gameRules.game:SendTextMessage(4, playerId, "myplayerid : " .. tostring(playerId));    
    --Log(">> !viewclan - playerID: " .. tostring(playerId) );  -- example playerID: userdata: 000000000001ED46, every restart server players have different player.id
    local myplayer = System.GetEntity(playerId);  
    local steamid = myplayer.player:GetSteam64Id();
   --[[ REFRESCO CLAN PARA EVITAR TRUCO CON NOMBRES; Difícil y bajada rendimiento.
   --if ( not LastShotThreadUpdateViewClanMembers[playerId] or LastShotThreadUpdateViewClanMembers[playerId] == 0 ) then -- Por si ya existe el Script.SetTimerForFunction
   local playerInfo = {};   
   playerInfo[0] = playerId;    
   playerInfo[1] = myplayer.id;
   Script.SetTimerForFunction(5000, 'LastShotUpdateViewClanMembersAfterDelay', playerInfo ); -- Every 5 min. 
        --LastShotThreadUpdateViewClanMembers[playerId] = 1; --indicamos que ya esta en ejecución
    --end     ]]

    if ( (LastShotActiveEvent == true) and (LastShotEventPlayerJoined[steamid]~=nil) and ( (LastShotActiveTeamDeathMatch == true) or (LastShotActiveFriendlyEvent==true )  )) then
        g_gameRules.game:SendTextMessage(0, playerId, 'You joined an event, you have to leave it before (!exitevent).');
        g_gameRules.game:SendTextMessage(4, playerId, 'You joined an event, you have to leave it before (!exitevent).'); 
    else     
        if (myplayer.player) then
            --g_gameRules.game:SendTextMessage(4, playerId, 'we have player' .. tostring(playerId));        
            local myplayerClanId = myplayer.player:GetClanId();

            if (myplayerClanId and myplayerClanId ~= 0) then
                --g_gameRules.game:SendTextMessage(4, playerId, 'we have clanId');
                --local STR = tostring(playerClanId);            
                --g_gameRules.game:SendTextMessage(4, playerId, STR);   
                
                local players = CryAction.GetPlayerList(); --Only players connected        
                local clanList = {};   
                local index = 0;           
                for key, player in pairs(players) do                               
                    if ( (player.player:GetClanId() == myplayerClanId) and ( player:GetName() ~= myplayer:GetName() ) ) then
                        --g_gameRules.game:SendTextMessage(4, playerId, 'find player: ' .. player:GetName() );           
                        clanList[player:GetName()] = 1;                          -- create elemnt of array with player.id as key.                    
                        index = index + 1;
                    end
                end   
            
                if ( index > 0 ) then    --  getn doesn't work. Notice however that the length operator # does not work with tables that are not arrays, it only counts the number of elements in the array part (with indices 1, 2, 3 etc.).     
                        mSendEvent(
                            playerId,
                            {
                                Type = LastShotViewClan,
                                Data = {                        
                                    clanIds = LastShotJSONLib.stringify(clanList)
                                }
                            },
                            false,
                            false
                        );
                    g_gameRules.game:SendTextMessage(0, playerId, 'View Clan activated successfully. (' .. index .. ' & You).');
                    g_gameRules.game:SendTextMessage(4, playerId, 'View Clan activated successfully. (' .. index .. ' & You).');                
                    --g_gameRules.game:SendTextMessage(4, playerId, 'They have to type !viewclan too.');              

                else
                    g_gameRules.game:SendTextMessage(0, playerId, 'You do not have any clan member on the map.');  
                    g_gameRules.game:SendTextMessage(4, playerId, 'You do not have any clan member on the map.');                 
                end     
            else 
                g_gameRules.game:SendTextMessage(0, playerId, 'You do not have a clan.'); 
                g_gameRules.game:SendTextMessage(4, playerId, 'You do not have a clan.'); 
            end
        else
            g_gameRules.game:SendTextMessage(0, playerId, 'Your player is not Init correctly. You do npt have playerId'); 
            g_gameRules.game:SendTextMessage(4, playerId, 'Your player is not Init correctly. You do npt have playerId');
        end
    end

end

-- !stopviewclan
-- Uses the !stopviewclan command to deactivate the party
ChatCommands["!unviewclan"] = function(playerId, command)    
    local player = System.GetEntity(playerId);
    
    mSendEvent(
        playerId,
        {
            Type = LastShotUnviewClan,
            Data = {
               viewClan = false               
            }
        },
        false,
        false
    );
    
    g_gameRules.game:SendTextMessage(0, playerId, 'View Clan has been deactivated.');
    
    --[[ LastShotThreadUpdateViewClanMembers[playerId] = 0; -- Por si acaso no funcionara la siguiente rutina.
    table.remove( LastShotThreadUpdateViewClanMembers , playerId ); -- remove the call function Script.SetTimerForFunction ]]
end



-- !viewallplayers
-- Uses the !viewallplayers command to activate the party
ChatCommands["!viewallplayers"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
   
    if isAdminUserWithPrivileges(steamid) then
        mSendEvent(
            playerId,
            {
                Type = LastShotViewAllPlayers,
                Data = {
                    viewAllPlayers = true
                }
            },
            false,
            false
        );
        g_gameRules.game:SendTextMessage(0, playerId, 'View All players activated successfully.');  
    end
end

-- !stopviewallplayers
-- Uses the !stopviewallplayers command to activate the party
ChatCommands["!unviewallplayers"] = function(playerId, command)
    local player = System.GetEntity(playerId);
    local steamid = player.player:GetSteam64Id();    
    
  
    if isAdminUserWithPrivileges(steamid) then
        mSendEvent(
            playerId,
            {
                Type = LastShotUnViewAllPlayers,
                Data = {
                    viewAllPlayers = false                   
                }
            },
            false,
            false
        );
        g_gameRules.game:SendTextMessage(0, playerId, 'View All players deactivated successfully.');
    end
end




