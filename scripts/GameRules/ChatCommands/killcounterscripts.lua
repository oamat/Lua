-- PVP/PVE stats/Kill Counter v1.2.0

-- Using Theros's MisDB
Script.ReloadScript('scripts/MisDB/MisDB.lua');

-- Script.ReloadScript('scripts/Entities/Animals/Animals/BabySpider.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Animals/Bear.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Animals/Deer.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Animals/DeerFemale.lua');
Script.ReloadScript('scripts/Entities/Animals/Animals/Donkey.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Animals/GiantRoach.lua');
Script.ReloadScript('scripts/Entities/Animals/Animals/GiantScorpion.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Animals/GreyFox.lua');
Script.ReloadScript('scripts/Entities/Animals/Animals/TwoHeadDog.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Mutants/BruteMutant.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Mutants/Crazy.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Mutants/HumanSpider.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Mutants/HumanZombie.lua');
Script.ReloadScript('scripts/Entities/Animals/Mutants/Spiker.lua');
-- Script.ReloadScript('scripts/Entities/Animals/Simple/Boar.lua');
Script.ReloadScript('scripts/Entities/Animals/Simple/Pig.lua');
Script.ReloadScript('scripts/Entities/Animals/Animals/Ram.lua');
Script.ReloadScript('scripts/Entities/Animals/Simple/Rooster.lua');

-- Validating if Miscreated:RevivePlayer is set
if not (Miscreated.RevivePlayer) then
  Miscreated.RevivePlayer = function (self, playerId)
    Log('>> Setting a generic Miscreated:RevivePlayer to make it exist');
  end
end


--------------------------------------------------------------------------
---------------------------- LASTSHOT MOD VAR FOR PLACES------------------
--------------------------------------------------------------------------

  LastShotPlacesNames = {"Hospital","Junkyard","Broken Bridge","Radioactive Junkyard","Woodhaven Antena","Turtle Bay",
  "Large Bunker","Junkyard GasStation","CedarPark Antenna","Hayward CargoShip","PoliceStation",
  "Hayward Valley","Hayward Suburbs","CedarPark","Hayward Deposit","Dam Radars","Dam Tunnels",
  "Remote GasStation","CapeBay","CapeBay Shore","Orca Dam","ClydeHill","Dam Storehouse","BrightMoor Shore",
  "Brightmoor Small Bunker","Brightmoor bridge","Brightmoor","Highway MTents","Scaffold Mtents",
  "CedarPark StoreHouse","Minibunker Mtents","Jero base","AirCrash Bunker",
  "CedarPark GasStation","Woodhaven Mtents","Radioactive Mountains","CinePark Antenna Lake",
  "CinePark","Brightmoor Plain","LumberYard","LumberYard Antenna","The Dinner","Pinecrest Derby","PineCrest C.Munch",
  "Pinecrest Plain","Pinecrest GasStation","Sultan Plain","Sultan","Sultan Bridge","Haven Distributors",
  "Sultan Deposit","Airfield Mountains","Airfield","AirField StoreHouses","Hope Memorial","Rocky Ripple",
  "HorseShoe Beach","Culdesac","PineParks","Radioactive PineParks","Pinecrest bridge","Mountain Urbanization", "Sultan WoodHaven bridges", 
  "Podunk Village","Market Dam way","Pinecrest downtown","Woodhaven GasStation","Woodhaven Supermarket"};



    LastShotPlacesPos= { {x=1700,y=7060,z=0},{x=1790,y=6535,z=0},{ x=1208,y=7238,z=0 },{ x=592,y=6240,z=0 },{ x=952,y=3936,z=0 },{ x= 220,y=4192,z=0 },{ x=1528,y=5552,z=0 } ,
    { x=2160,y=5840,z=0 }, { x=3144,y=5240,z=0 },{ x=3964,y=7348,z=0 },{ x=3808,y=6296,z=0 },{ x=3804,y=5820,z=0 },{ x=3860,y=5324,z=0 },{ x=3864,y=4816,z=0 },
    { x=4267,y=5647,5380,y=5684,z=0 },{ x=5400,y=5550,z=0 }, { x=6054,y=5392,z=0 },{ x=6188,y=6076,z=0 },{ x=7328,y=4928,z=0 },{ x=7040,y=4260,z=0 },
    { x=5840,y=4532,z=0 },{ x=4788,y=4736,z=0 },{ x=6084,y=3716,z=0 },{ x=6296,y=2560,z=0 },{ x=5156,y=3304,z=0 },{ x=5252,y=2636,z=0 },
    { x=5412,y=2212,z=0 },{ x=4696,y=3608,z=0 },{ x=4512,y=4184,z=0 },{ x=4112,y=4560,z=0 },{ x=4092,y=3808,z=0 },{ x=4260,y=3272,z=0 },
    { x=3456,y=3700,z=0 },{ x=3498,y=4845,z=0 },{ x=2640,y=4355,z=0 },{ x=3180,y=3388,z=0 },{ x=2768,y=3160,z=0 },{ x=3085,y=2168,z=0 },
    { x=6000,y=2000,z=0 },{ x=5808,y=1276 ,z=0 },{ x=6456,y=988,z=0 },{ x=5140,y=1476,z=0 },{ x=4580,y=1252,z=0 },{ x=3976,y=1444,z=0 },
    { x=3052,y=1500,z=0 },{ x=3672,y=1100,z=0 },{ x=2640,y=1732,z=0 },{ x=2192,y=2128,z=0 },{ x=2512,y=2644,z=0 },{ x=2148,y=2936,z=0 },
    { x=1876,y=1650,z=0 } ,{ x=2550,y=1300,z=0 },{ x=2432,y=644,z=0 },{ x=2256,y=560,z=0 },{ x=1300,y=1100,z=0 },{ x=1028,y=2172,z=0 },
    { x=1260,y=2236,z=0 },{ x=3864,y=2168,z=0 },{ x=4656,y=1900 ,z=0 },{ x=4478,y=2453,z=0 },{ x=3938,y=1810,z=0 },{ x=3832,y=3160,z=0 },
    { x=1598,y=2348,z=0 },{ x=2749,y=7000,z=0 },{ x=5200,y=4450,z=0 },{ x=3655,y=1675,z=0 },{ x=1860,y=3268,z=0 },{ x=1600,y=3630,z=0 }};

 --------------------------------------------------------------------------
---------------------------- END LASTSHOT MOD VAR FOR PLACES---------------
---------------------------------------------------------------------------

-- Table and array-like tables to store the killcount data and top 10
killScores = {};
topTenTable = {};
mtopTenTable = {};
atopTenTable = {};

-- Manage storage stuff
DB = MisDB:Create('KillCounterDB/', 'KillCounterData');
DBCollection = DB:Collection('PlayersCollection');
ConfigCollection = DB:Collection('ConfigCollection');

-- Config list
-- kc_pvp_pve_toggler
-- kc_global_notifications
-- kc_subtract_kills
-- kc_force_topten_refresh

-- Config Loaders
local gameTypeToggler = nil;
local gNotifications = nil;
local subtractKills = nil;
local forceTopTenRefresh = nil;

-- Mutant classes array
local mutantClasses = {
  'BabySpider',
  'GiantRoach',
  'TwoHeadDog',
  'BruteMutant',
  'Crazy',
  'HumanSpider',
  'HumanZombie',
  'Spiker'
};

-- Animal classes array
local animalClasses = {
  'Bear',
  'Deer',
  'DeerFemale',
  'Donkey',
  'GreyWolf',
  'GiantScorpion',
  'Boar',
  'Pig',
  'Ram',
  'Rooster'
};

-- Callback registering for needed functions
local function KillRegisterCallback(obj, funcname, precb, postcb)
  local rememberOrg = obj[funcname]
  obj[funcname] = function(self, ...)
    if precb ~= nil then precb(self, unpack(arg)) end
    local ret = rememberOrg(self, unpack(arg))
    if postcb ~= nil then postcb(self, unpack(arg)) end
    return ret
  end
end

-- shallowCopy
-- Returns a copied table so the copy is not pointing to the same memory reference
local function shallowCopy(originalTable)
  local copy;

  if type(originalTable) == 'table' then
    copy = {};

    for orig_key, orig_value in pairs(originalTable) do
      copy[orig_key] = orig_value;
    end
  else
    copy = originalTable;
  end
  return copy;
end

-- getRank
-- Returns a rank name based on kills
local function getRank(kills)
  if (kills < 0) then
    return 'Black Sheep';
  elseif (kills >= 0 and kills < 15) then
    return 'Noob Soup';
  elseif (kills >= 15 and kills < 50) then
    return 'Mutant Bait';
  elseif (kills >= 50 and kills < 100) then
    return 'Survivor';
  elseif (kills >= 100 and kills < 175) then
    return 'Stalker';
  elseif (kills >= 175 and kills < 275) then
    return 'Shadow';
  elseif (kills >= 275 and kills < 400) then
    return 'Soldier';
  elseif (kills >= 400 and kills < 600) then
    return 'Wasteland Warrior';
  elseif (kills >= 600 and kills < 850) then
    return 'Fanatic';
  elseif (kills >= 850 and kills < 1150) then
    return 'Rocket Surgeon';
  elseif (kills >= 1150 and kills < 1500) then
    return 'Miscreator';
  elseif (kills >= 1500 and kills < 1900) then
    return 'Amalgamated Agent';
  elseif (kills >= 1900 and kills < 2350) then
    return 'Scourge of the Wastes';
  elseif (kills >= 2350 and kills < 2900) then
    return 'Harbinger of destruction';
  elseif (kills >= 2900 and kills < 3500) then
    return 'The Dude';
  elseif (kills >= 3500 and kills < 4500) then
    return 'Atomic Bomb';
  elseif (kills >= 4500 and kills < 6000) then
    return 'Giant Gnome';
  elseif (kills >= 6000) then
    return 'Amalgamated President';
  end
end

-- getConfig
-- Loads the custom configurations for the server
local function getConfig()
  gameTypeToggler = ConfigCollection:GetPage('kc_pvp_pve_toggler');
  gNotifications = ConfigCollection:GetPage('kc_global_notifications');
  subtractKills = ConfigCollection:GetPage('kc_subtract_kills');
  forceTopTenRefresh = ConfigCollection:GetPage('kc_force_topten_refresh');

  if (gameTypeToggler == nil) then
    gameTypeToggler = ConfigCollection:SetPage('kc_pvp_pve_toggler', 1);
    gNotifications = ConfigCollection:SetPage('kc_global_notifications', 1);
    subtractKills = ConfigCollection:SetPage('kc_subtract_kills', 1);
    forceTopTenRefresh = ConfigCollection:SetPage('kc_force_topten_refresh', 0);
  end

  -- Mod compatibility check v1.1.2
  if (subtractKills == nil) then
    typoCollection = ConfigCollection:GetPage('kc_substract_kills');
    if (typoCollection ~= nil) then
      subtractKills = ConfigCollection:SetPage('kc_subtract_kills', typoCollection);
    end

    ConfigCollection:PurgePage('kc_substract_kills');
    DB:Save();
    Log('>> Killcountermod: Forcing compatibility check v1.1.2');
  end
end

-- getTopTen
-- Generates the table with the top 10 on server start
local function getTopTen()
  local count = 0;

  if (DBCollection.parent.db['PlayersCollection'] ~= nil and DBCollection.parent.db['PlayersCollection'] ~= {}) then
    for _ in pairs(DBCollection.parent.db['PlayersCollection']) do
      count = count + 1;
      if (count > 1) then
        break;
      end
    end

    if (count > 0) then
      local needsUpdate = false;

      for _, value in pairs(DBCollection.parent.db['PlayersCollection']) do
        -- Mod compatibility check v1.1
        if (value['mkills'] == nil) then
          value['mkills'] = 0;
          value['akills'] = 0;
          value['mdeaths'] = 0;
          needsUpdate = true;
        end

        if (forceTopTenRefresh == nil or forceTopTenRefresh == 0) then
          table.insert(topTenTable, shallowCopy(value));
          table.insert(mtopTenTable, shallowCopy(value));
          table.insert(atopTenTable, shallowCopy(value));
        else
          table.insert(topTenTable, value);
          table.insert(mtopTenTable, value);
          table.insert(atopTenTable, value);
        end
      end

      if (needsUpdate) then
        Log('>> Killcountermod: Forcing compatibility check v1.1');
        DB:Save();
      end

      table.sort(topTenTable, function(a, b) return a.kills > b.kills end);
      table.sort(mtopTenTable, function(a, b) return a.mkills > b.mkills end);
      table.sort(atopTenTable, function(a, b) return a.akills > b.akills end);
    else
      topTenTable = nil;
      mtopTenTable = nil;
      atopTenTable = nil;
    end
  else
    topTenTable = nil;
    mtopTenTable = nil;
    atopTenTable = nil;
  end
end

-- isMutantClass
-- Determines if the killed entity is a mutant
local function isMutantClass(class)
  for _, value in pairs(mutantClasses) do
    if (class == value) then
      return true;
    end
  end

  return false;
end

-- isAnimalClass
-- Determines if the killed entity is an animal
local function isAnimalClass(class)
  for _, value in pairs(animalClasses) do
    if (class == value) then
      return true;
    end
  end

  return false;
end

-- function RegisterCallback(obj, funcname, precb, postcb)
--   local rememberOrg = obj[funcname]
--   obj[funcname] = function(self, ...)
--     if precb ~= nil then precb(self, unpack {...}) end
--     local ret = rememberOrg(self, unpack {...})
--     if postcb ~= nil then postcb(self, unpack {...}) end
--     return ret
--   end
-- end

-- Init player and store in array of scores
function KCInitPlayer(playerId)
  local player = System.GetEntity(playerId);
  local steamId = player.player:GetSteam64Id();

  player.KCIsDead = nil;

  --LastShot mod
  if (LastShotKillers[steamId] == nil) then
      local last_playerInfo = {
        ['playerName'] = player:GetName(),
        ['kills'] = 0,
        ['headshots'] = 0        
      }
     
      LastShotKillers[steamId] = last_playerInfo;
    
  end
  --end LastShot mod

  if (killScores[steamId] == nil) then
    local playerInfo = {
      ['playerName'] = player:GetName(),
      ['kills'] = 0,
      ['headshots'] = 0,
      ['deaths'] = 0,
      ['suicides'] = 0,
      ['mkills'] = 0,
      ['akills'] = 0,
      ['mdeaths'] = 0
    }

    killScores[steamId] = playerInfo;
    
  

    local PlayerPersistentData = DBCollection:GetPage(steamId);

    if (PlayerPersistentData == nil) then
      DBCollection:SetPage(steamId, shallowCopy(playerInfo));

      if (forceTopTenRefresh ~= nil and forceTopTenRefresh == 1) then
        table.insert(topTenTable, playerInfo);
        table.insert(mtopTenTable, playerInfo);
        table.insert(atopTenTable, playerInfo);
      end
    else
      if (PlayerPersistentData['playerName'] ~= player:GetName()) then
        PlayerPersistentData['playerName'] = player:GetName();
        DBCollection:SetPage(steamId, PlayerPersistentData);
      end
    end

    Log(">> Registered player - %s", player:GetName());
  end
end

-- Plays a sound for a playerId
-- local function PlaySound(playerId, sound)
--   local soundTriggerID = AudioUtils.LookupTriggerID(sound);

--   if (soundTriggerID ~= nil) then
--     local player = System.GetEntity(playerId);
--     player:ExecuteAudioTrigger(soundTriggerID, player:GetDefaultAuxAudioProxyID());
--   end
-- end

-- KCRegisterPlayerScore
-- Register scores and stats for player
function KCRegisterPlayerScore(hit)
  local playerKilled = hit.target;
  local playerKiller = hit.shooter;


      --------------------------------------------------------------------------
      ---------------------------- LASTSHOT MOD VAR FOR PLACES------------------
      ---------------------------------------------------------------------------
  if (playerKilled and playerKilled.player and not playerKilled.KCIsDead and (gameTypeToggler == nil or gameTypeToggler == 1 or gameTypeToggler == 3)) then
    if (playerKilled.lastHealth <= 0) then
                   -- Place Name search
                   local indexLoop = 0;
                   local indexPlace = 0;
                   local minDistance = 10000;
                   local distance = 0;       
                   local KilledPos = playerKilled:GetWorldPos();       
                   KilledPos.z=0;        
                   for key, position in pairs(LastShotPlacesPos) do                
                       indexLoop = indexLoop + 1;   
                       distance = DistanceVectors(position,KilledPos);                         
                       if (distance < minDistance) then
                         minDistance = distance;
                         indexPlace = indexLoop;
                       end
                   end                         
                   if (minDistance > 450) then --normalize distance less than 450m
                    minDistance = 400 + random(4, 49);
                   end

                   local deathPlace = ''; 
                   local time = os.date("*t")                  
                   local deathTime = ("%02d:%02d"):format(time.hour, time.min) .. ' ';
                   if (playerKiller and playerKiller.player and playerKiller:GetName() and playerKiller:GetWorldPos() and (hit.shooterId ~= hit.targetId) ) then                                
                    deathPlace = string.sub(playerKiller:GetName(),1,10) .. ' killed ' .. string.sub(playerKilled:GetName(),1,10) .. ' at ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm. ' .. tostring(math.floor(minDistance)) ..  'm from ' .. LastShotPlacesNames[indexPlace] ..  ' (#' .. indexPlace .. ')';                   
                   else 
                    deathPlace = playerKilled:GetName() .. " died " .. tostring(math.floor(minDistance)) .. 'm from ' .. LastShotPlacesNames[indexPlace] ..  ' (#' .. indexPlace .. ')';                                             
                   end
                 g_gameRules.game:SendTextMessage(4, 0, deathPlace);
                 g_gameRules.game:SendTextMessage(0, 0, deathPlace);
                 --table.insert(LastShotDeathPlaces,1, string.sub(deathPlace, 1, 20));       
                 --deathPlace =' died ' ..  playerKilled:GetName() .. deathPlace  
                 table.insert(LastShotDeathPlaces,1,deathTime .. deathPlace);                        
                if (LastShotDeathPlaces[4]) then
                  table.remove(LastShotDeathPlaces, 4);                                                                                    
                end 
                LastShotLogoRankToSend = true;               
    end
  end
      --------------------------------------------------------------------------
      ---------------------------- LASTSHOT MOD VAR FOR PLACES------------------
      ---------------------------------------------------------------------------

  if (playerKiller and playerKiller.player and playerKilled and playerKilled.player and not playerKilled.KCIsDead and (gameTypeToggler == nil or gameTypeToggler == 1 or gameTypeToggler == 3)) then
    if (playerKilled.lastHealth <= 0) then
      if (hit.shooterId ~= hit.targetId) then
        local killerSteamId = playerKiller.player:GetSteam64Id();
        local killedSteamId = playerKilled.player:GetSteam64Id();
        local message = '';

        killScores[killerSteamId]['kills'] = killScores[killerSteamId]['kills'] + 1;
        
         --LastShot mod
        LastShotKillers[killerSteamId]['kills'] = LastShotKillers[killerSteamId]['kills'] + 1;
        LastShotKillCounter = LastShotKillCounter + 1;
        LastShotLoadLogoRankUI = true;
        --End LastShot mod

        killScores[killedSteamId]['deaths'] = killScores[killedSteamId]['deaths'] + 1;

        local PlayerKillerPersistentData = DBCollection:GetPage(killerSteamId);
        local PlayerKilledPersistentData = DBCollection:GetPage(killedSteamId);

        PlayerKillerPersistentData['kills'] = PlayerKillerPersistentData['kills'] + 1;
        PlayerKilledPersistentData['deaths'] = PlayerKilledPersistentData['deaths'] + 1;

        if (hit.material_type == 'head') then
          killScores[killerSteamId]['headshots'] = killScores[killerSteamId]['headshots'] + 1;
           --LastShot mod
           LastShotKillers[killerSteamId]['headshots'] = LastShotKillers[killerSteamId]['headshots'] + 1;          
          --End LastShot mod

          PlayerKillerPersistentData['headshots'] = PlayerKillerPersistentData['headshots'] + 1;
          if (gNotifications == nil or gNotifications == 1) then
            message = playerKiller:GetName() .. ' HEADSHOTTED ' .. playerKilled:GetName() .. ', Dist: ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm.';
            g_gameRules.game:SendTextMessage(0, 0, message);
          else
            message = 'You HEADSHOTTED ' .. playerKilled:GetName() .. ', Dist: ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm.';
            g_gameRules.game:SendTextMessage(0, hit.shooterId, message);
            message = playerKiller:GetName() .. ' HEADSHOTTED you, Dist: ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm.';
            g_gameRules.game:SendTextMessage(0, hit.targetId, message);
          end
        else
          if (gNotifications == nil or gNotifications == 1) then
            message = playerKiller:GetName() .. ' Killed ' .. playerKilled:GetName() .. ', Dist: ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm.';
            g_gameRules.game:SendTextMessage(0, 0, message);            
          else
            message = 'You Killed ' .. playerKilled:GetName() .. ', Dist: ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm.';
            g_gameRules.game:SendTextMessage(0, hit.shooterId, message);
            message = playerKiller:GetName() .. ' killed you, Dist: ' .. tostring(math.floor(DistanceVectors(hit.pos, playerKiller:GetWorldPos()))) .. 'm.';
            g_gameRules.game:SendTextMessage(0, hit.targetId, message);
          end
        end
                        
        DBCollection:SetPage(killerSteamId, PlayerKillerPersistentData);
        DBCollection:SetPage(killedSteamId, PlayerKilledPersistentData);
      else
        local killerSteamId = playerKiller.player:GetSteam64Id();
        local PlayerKillerPersistentData = DBCollection:GetPage(killerSteamId);

        if (subtractKills == nil or subtractKills == 1) then
          killScores[killerSteamId]['kills'] = killScores[killerSteamId]['kills'] - 1;
          PlayerKillerPersistentData['kills'] = PlayerKillerPersistentData['kills'] - 1;
        end

        killScores[killerSteamId]['suicides'] = killScores[killerSteamId]['suicides'] + 1;
        PlayerKillerPersistentData['suicides'] = PlayerKillerPersistentData['suicides'] + 1;

        DBCollection:SetPage(killerSteamId, PlayerKillerPersistentData);

        if (gNotifications == nil or gNotifications == 1) then
          message = playerKiller:GetName() .. ' just Killed himself, what a shame.';
          g_gameRules.game:SendTextMessage(0, 0, message);
        else
          message = 'You just Killed yourself, what a shame.';
          g_gameRules.game:SendTextMessage(0, hit.shooterId, message);
        end
      end
  

       playerKilled.KCIsDead = true;
    end

  elseif (playerKiller and not playerKiller.player and playerKilled and playerKilled.player and not playerKilled.KCIsDead and (gameTypeToggler == nil or gameTypeToggler == 2 or gameTypeToggler == 3)) then
    if (isMutantClass(hit.shooter.class) or isAnimalClass(hit.shooter.class)) then
      if(playerKilled.lastHealth <= 0) then
        local killedSteamId = playerKilled.player:GetSteam64Id();
        local PlayerKilledPersistentData = DBCollection:GetPage(killedSteamId);

        killScores[killedSteamId]['mdeaths'] = killScores[killedSteamId]['mdeaths'] + 1;
        PlayerKilledPersistentData['mdeaths'] = PlayerKilledPersistentData['mdeaths'] + 1;

        DBCollection:SetPage(killedSteamId, PlayerKilledPersistentData);        

      playerKilled.KCIsDead = true;
        
      end
    end
  end


 

  


         


end

-- PrepareRegister
-- Forces a sleep in order to guarantee the AI entity is dead
local function KCPrepareAIRegister(hit)
  Script.SetTimerForFunction(10, 'KCRegisterAIScore', hit);
end

-- KCRegisterAIScore
-- Register scores and stats for AI
function KCRegisterAIScore(hit)
  local AIKilled = hit.target;
  local playerKiller = hit.shooter;

  if (AIKilled:IsDead() == 1 and not AIKilled.KCIsDead and (gameTypeToggler == nil or gameTypeToggler == 2 or gameTypeToggler == 3)) then
    if (playerKiller and playerKiller.player) then
      local killerSteamId = playerKiller.player:GetSteam64Id();
      local PlayerKillerPersistentData = DBCollection:GetPage(killerSteamId);

      if (isMutantClass(AIKilled.class)) then
        killScores[killerSteamId]['mkills'] = killScores[killerSteamId]['mkills'] + 1;
        PlayerKillerPersistentData['mkills'] = PlayerKillerPersistentData['mkills'] + 1;
      elseif (isAnimalClass(AIKilled.class)) then            
        killScores[killerSteamId]['akills'] = killScores[killerSteamId]['akills'] + 1;
        PlayerKillerPersistentData['akills'] = PlayerKillerPersistentData['akills'] + 1;
      end

      DBCollection:SetPage(killerSteamId, PlayerKillerPersistentData);
    end

    AIKilled.KCIsDead = true;
  end
end

-- checkScore
-- Checks the player's current score
local function checkScore(playerId, class)
  local player = System.GetEntity(playerId);
  local steamId = player.player:GetSteam64Id();
  local message = 'Current session ' .. class .. ' score\n';

  if (class == 'PVP') then
    if (gameTypeToggler == nil or gameTypeToggler == 1 or gameTypeToggler == 3) then
      message = message .. 'Kills: ' .. tostring(killScores[steamId]['kills']) .. '\n';
      message = message .. 'Headshots: ' .. tostring(killScores[steamId]['headshots']) .. '\n';
      message = message .. 'Deaths: ' .. tostring(killScores[steamId]['deaths']) .. '\n';
      message = message .. 'Suicides: ' .. tostring(killScores[steamId]['suicides']);
    else
      message = 'PVP Stats are disabled in this server.';
    end
  else
    if (gameTypeToggler == nil or gameTypeToggler == 2 or gameTypeToggler == 3) then
      message = message .. 'Mutant Kills: ' .. tostring(killScores[steamId]['mkills']) .. '\n';
      message = message .. 'Wildlife Kills: ' .. tostring(killScores[steamId]['akills']) .. '\n';
      message = message .. 'Deaths by mutants and wildlife: ' .. tostring(killScores[steamId]['mdeaths']);
    else
      message = 'PVE Stats are disabled in this server.';
    end
  end

  g_gameRules.game:SendTextMessage(4, playerId, message);
end

-- checkStats
-- Checks the player's global score
local function checkStats(playerId, class)
  local player = System.GetEntity(playerId);
  local steamId = player.player:GetSteam64Id();
  local PlayerPersistentData = DBCollection:GetPage(steamId);
  local message = 'Global ' .. class .. ' stats\n';

  if (class == 'PVP') then
    if (gameTypeToggler == nil or gameTypeToggler == 1 or gameTypeToggler == 3) then
      message = message .. 'Kills: ' .. tostring(PlayerPersistentData['kills']) .. '\n';
      message = message .. 'Headshots: ' .. tostring(PlayerPersistentData['headshots']) .. '\n';
      message = message .. 'Deaths: ' .. tostring(PlayerPersistentData['deaths']) .. '\n';
      message = message .. 'Suicides: ' .. tostring(PlayerPersistentData['suicides']) .. '\n';
      message = message .. 'Rank: ' .. getRank(PlayerPersistentData['kills']);
    else
      message = 'PVP Stats are disabled in this server.';
    end
  else
    if (gameTypeToggler == nil or gameTypeToggler == 2 or gameTypeToggler == 3) then
      message = message .. 'Mutant Kills: ' .. tostring(PlayerPersistentData['mkills']) .. '\n';
      message = message .. 'Wildlife Kills: ' .. tostring(PlayerPersistentData['akills']) .. '\n';
      message = message .. 'Deaths by mutants and wildlife: ' .. tostring(PlayerPersistentData['mdeaths']);
    else
      message = 'PVE Stats are disabled in this server.';
    end
  end

  g_gameRules.game:SendTextMessage(4, playerId, message);
end

-- checkTopTen
-- Checks the top 10 killers in the server
local function checkTopTen(playerId, class)
  local whichKills = '';
  local indexLimit = 1;
  local message = '';
  local note = '';
  local localTopTenTable = {};

  if (forceTopTenRefresh == nil or forceTopTenRefresh == 0) then
    note = 'Note: The stats for this server session are not being accounted for the top 10 until next server restart.';
  end

  if (class == 'PVP') then
    if (gameTypeToggler == nil or gameTypeToggler == 1 or gameTypeToggler == 3) then
      if (topTenTable ~= nil) then
        message = 'Top 10 player killers\n';
        whichKills = 'kills';
        localTopTenTable = topTenTable;
      end
    else
      message = 'PVP Stats are disabled in this server.';
    end
  elseif (class == 'PVM') then
    if (gameTypeToggler == nil or gameTypeToggler == 2 or gameTypeToggler == 3) then
      if (mtopTenTable ~= nil) then
        message = 'Top 10 mutant killers\n';
        whichKills = 'mkills';
        localTopTenTable = mtopTenTable;
      end
    else
      message = 'PVE Stats are disabled in this server.';
    end
  else
    if (gameTypeToggler == nil or gameTypeToggler == 2 or gameTypeToggler == 3) then
      if (atopTenTable ~= nil) then
        message = 'Top 10 wildlife hunters\n';
        whichKills = 'akills';
        localTopTenTable = atopTenTable;
      end
    else
      message = 'PVE Stats are disabled in this server.';
    end
  end

  if (localTopTenTable ~= nil) then
    if (forceTopTenRefresh ~= nil and forceTopTenRefresh == 1) then
      table.sort(localTopTenTable, function(a, b) return a[whichKills] > b[whichKills] end);
    end

    for key, value in pairs(localTopTenTable) do
      if (class == 'PVP') then
        message = message .. tostring(indexLimit) .. ') ' .. value['playerName'] .. ': ' .. tostring(value[whichKills]) .. ' kills, ' .. tostring(value['headshots']) .. ' headshots\n';
      else
        message = message .. tostring(indexLimit) .. ') ' .. value['playerName'] .. ': ' .. tostring(value[whichKills]) .. ' kills\n';
      end
      indexLimit = indexLimit + 1;

      if (indexLimit > 10) then
        break;
      end
    end
    message = message .. note;
  else
    message = 'There is no data to share yet, wait for the next restart.';
  end

  g_gameRules.game:SendTextMessage(4, playerId, message);
end

-- Calling the Player Kill function to register kills function on Server init
KillRegisterCallback(Player.Server, 'OnHit', nil, function (player, hit) KCRegisterPlayerScore(hit) end);

-- Calling the Miscreated Revive player function to register the init params
RegisterCallbackReturnAware(  --called after 'OnHit' function. 
  Miscreated,
  'RevivePlayer',
  function (self, ret, playerId)
    KCInitPlayer(playerId);
    return ret;
  end,
  nil
);

-- Calling the AI Kill function to register kills function on Server init
KillRegisterCallback(BabySpider.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Bear.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Deer.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(DeerFemale.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Donkey.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(GiantRoach.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(GiantScorpion.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(GreyWolf.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Ram.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(TwoHeadDog.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(BruteMutant.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Crazy.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(HumanSpider.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(HumanZombie.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Spiker.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Boar.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Pig.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);
KillRegisterCallback(Rooster.Server, 'OnHit', nil, function (self, hit) KCPrepareAIRegister(hit) end);

-- Calling the config function
getConfig();
-- Calling the ranking function
getTopTen();

-- !kc <subcommand_and_id_or_number>
-- Uses the !kc command with a subcommand to perform different functions
ChatCommands["!kc"] = function(playerId, command)
  Log(">> !kc - %s", command);

  local pattern = '%a+%s*%a*';

  if (string.match(command, pattern)) then
    if (command == 'score') then
      checkScore(playerId, 'PVP');
    elseif (command == 'stats') then
      checkStats(playerId, 'PVP');
    elseif (command == 'top10') then
      checkTopTen(playerId, 'PVP');
    elseif (command == 'mscore') then
      checkScore(playerId, 'PVE');
    elseif (command == 'mstats') then
      checkStats(playerId, 'PVE');
    elseif (command == 'mtop10') then
      checkTopTen(playerId, 'PVM');
    elseif (command == 'atop10') then
      checkTopTen(playerId, 'PVA'); 
    else
      g_gameRules.game:SendTextMessage(4, playerId, 'Invalid command, check the mod steam page to see all the valid commands.');
    end
  else
    g_gameRules.game:SendTextMessage(4, playerId, 'Invalid command format, check the mod steam page to see all the valid commands.');
  end
end

