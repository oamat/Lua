AirCrashPlaceInvoker = {
    Properties = {
		bPickable = 1,
		eiPhysicsType = 2, -- not physicalized by default
		bMounted = 0,
		bUsable = 0,
		bSpecialSelect = 0,
		soclasses_SmartObjectClass = "",
        initialSetup = "",
	},
	
	Client = {},
	Server = {},
	
	Editor = {
		Icon = "Item.bmp",
		IconOnTop = 1,
    },
}

function AirCrashPlaceInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeViewLastPlaneCrashEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
        },
        ServerProperties = {
		}
    };
end

local Physics_DX9MP_Simple = {
    bPhysicalize = 1, -- True if object should be physicalized at all.
    bPushableByPlayers = 0,

    Density = -1,
    Mass = -1,
    bStaticInDX9Multiplayer = 1
}

function AirCrashPlaceInvoker.Server:LastShotInvokeViewLastPlaneCrashEventImplEnt(data, playerId, itemId)
    LastShotInvokeViewLastPlaneCrashEventImpl(data, playerId, itemId);
end

function AirCrashPlaceInvoker:OnPropertyChange()
    self:OnReset();
end

function AirCrashPlaceInvoker:OnEditorSetGameMode(gameMode)

end

function AirCrashPlaceInvoker:OnReset()

end

function AirCrashPlaceInvoker.Server:OnShutdown()

end

function AirCrashPlaceInvoker:OnShutdown()

end

function AirCrashPlaceInvoker:OnDestroy()

end

function AirCrashPlaceInvoker:PhysicalizeThis(slot)
    if (self.Properties.Physics.MP.bDontSyncPos == 1) then
        CryAction.DontSyncPhysics(self.id);
    end

    local physics = self.Properties.Physics;
    if (CryAction.IsImmersivenessEnabled() == 0) then
        physics = Physics_DX9MP_Simple;
    end
    EntityCommon.PhysicalizeRigid(self, slot, physics, 1);

    if (physics.Buoyancy) then
        self:SetPhysicParams(PHYSICPARAM_BUOYANCY, physics.Buoyancy);
    end
end

function AirCrashPlaceInvoker.Server:OnHit(hit)

end

function AirCrashPlaceInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function AirCrashPlaceInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function AirCrashPlaceInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function AirCrashPlaceInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function AirCrashPlaceInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Mark place of AirCrash Now');

    return actions;
end

function AirCrashPlaceInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Mark place of AirCrash Now') then      
    
   --[[  mSendEvent( it's a test 
            'Server',
            {
                Type = 'LastShotInvokersEventTest',
                Data = { 
                    message = 'Event works Fine!'
                }
            },
            false,
            false
        );    ]]

     
        mSendEvent(
                'Server',
                {
                    Type = 'LastShotInvokeViewLastPlaneCrashEventImpl',
                    Data = {
                        message = 'ok'
                    }
                },
                self.id,
                false
            ); 
          
            --System.RemoveEntity(self.id);

       --[[ local player = System.GetEntity(g_localActorId);  -- This way it doesn't work.
            local itemInvoker = player.inventory:GetCurrentItem();
            if (itemInvoker and itemInvoker.class == 'AirCrashPlaceInvoker') then  
                self.server:LastShotInvokeViewLastPlaneCrashEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function AirCrashPlaceInvoker:SaveValue()
	return "";
end

function AirCrashPlaceInvoker:RestoreValue(value)

end

function AirCrashPlaceInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function AirCrashPlaceInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function AirCrashPlaceInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(AirCrashPlaceInvoker);
AirCrashPlaceInvoker:Expose();

local function CreateAirCrashPlaceInvokerTable()
    Log('creating table AirCrashPlaceInvoker');
    _G['AirCrashPlaceInvoker'] = new(AirCrashPlaceInvoker);
end

CreateAirCrashPlaceInvokerTable();