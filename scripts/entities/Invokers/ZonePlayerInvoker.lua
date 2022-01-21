ZonePlayerInvoker = {
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

function ZonePlayerInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeZonePlayerEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function ZonePlayerInvoker.Server:LastShotInvokeZonePlayerEventImplEnt(data, playerId, itemId)
    LastShotInvokeZonePlayerEventImpl(data, playerId, itemId);
end

function ZonePlayerInvoker:OnPropertyChange()
    self:OnReset();
end

function ZonePlayerInvoker:OnEditorSetGameMode(gameMode)

end

function ZonePlayerInvoker:OnReset()

end

function ZonePlayerInvoker.Server:OnShutdown()

end

function ZonePlayerInvoker:OnShutdown()

end

function ZonePlayerInvoker:OnDestroy()

end

function ZonePlayerInvoker:PhysicalizeThis(slot)
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

function ZonePlayerInvoker.Server:OnHit(hit)

end

function ZonePlayerInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function ZonePlayerInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function ZonePlayerInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function ZonePlayerInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function ZonePlayerInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Give me player pos Now');

    return actions;
end

function ZonePlayerInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Give me player pos Now') then      
    
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
                    Type = 'LastShotInvokeZonePlayerEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'ZonePlayerInvoker') then  
                self.server:LastShotInvokeZonePlayerEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function ZonePlayerInvoker:SaveValue()
	return "";
end

function ZonePlayerInvoker:RestoreValue(value)

end

function ZonePlayerInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function ZonePlayerInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function ZonePlayerInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(ZonePlayerInvoker);
ZonePlayerInvoker:Expose();

local function CreateZonePlayerInvokerTable()
    Log('creating table ZonePlayerInvoker');
    _G['ZonePlayerInvoker'] = new(ZonePlayerInvoker);
end

CreateZonePlayerInvokerTable();