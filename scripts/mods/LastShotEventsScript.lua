RegisterCallback(_G,
    'OnInitPreLoaded',
    nil,
    function ()
        Log("LastShot Server >> PreLoading All Event Config");
        LastShotLogoPreInitModules();
        LastShotClanPreInitModules();
        LastShotCorpsePreInitModules();
        LastShotEventPlacePreInitModules();
        LastShotCompassPreInitModules();
        LastShotInvokersPreInitModules();
        LastShotBlindPreInitModules();
        LastShotMessagePreInitModules();        
        SCAAMATPreInitModules();
        SCAAMClanRespawnerPreInitModules();
        LastShotGivePreInitModules();
        Log("LastShot Server >> PreLoaded correctly All Event Config");
    end
);

RegisterCallback(_G,
    'OnInitAllLoaded',
    nil,
    function ()
        Log("LastShot Server >> Loading All Event Config");
        LastShotLogoInitModules();
        LastShotClanInitModules();
        LastShotCorpseInitModules();
        LastShotEventPlaceInitModules();
        LastShotCompassInitModules();
        LastShotInvokersInitModules();
        LastShotBlindInitModules();
        LastShotMessageInitModules();        
        SCAAMATInitModules();
        SCAAMClanRespawnerInitModules();
        LastShotGiveInitModules();
        Log("LastShot Server >> Loaded correctly All Event Config");
    end
);