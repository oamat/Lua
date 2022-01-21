AirCrashInvoker = {
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

function AirCrashInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeAirplaneCrashEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function AirCrashInvoker.Server:LastShotInvokeAirplaneCrashEventImplEnt(data, playerId, itemId)
    LastShotInvokeAirplaneCrashEventImpl(data, playerId, itemId);
end

function AirCrashInvoker:OnPropertyChange()
    self:OnReset();
end

function AirCrashInvoker:OnEditorSetGameMode(gameMode)

end

function AirCrashInvoker:OnReset()

end

function AirCrashInvoker.Server:OnShutdown()

end

function AirCrashInvoker:OnShutdown()

end

function AirCrashInvoker:OnDestroy()

end

function AirCrashInvoker:PhysicalizeThis(slot)
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

function AirCrashInvoker.Server:OnHit(hit)

end

function AirCrashInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function AirCrashInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function AirCrashInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function AirCrashInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function AirCrashInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Invoke AirCrash Now');

    return actions;
end

function AirCrashInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Invoke AirCrash Now') then      
    
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
                    Type = 'LastShotInvokeAirplaneCrashEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'AirCrashInvoker') then  
                self.server:LastShotInvokeAirplaneCrashEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function AirCrashInvoker:SaveValue()
	return "";
end

function AirCrashInvoker:RestoreValue(value)

end

function AirCrashInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function AirCrashInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function AirCrashInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(AirCrashInvoker);
AirCrashInvoker:Expose();

local function CreateAirCrashInvokerTable()
    Log('creating table AirCrashInvoker');
    _G['AirCrashInvoker'] = new(AirCrashInvoker);
end

CreateAirCrashInvokerTable();