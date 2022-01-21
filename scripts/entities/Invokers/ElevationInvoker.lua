ElevationInvoker = {
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

function ElevationInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeElevationEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function ElevationInvoker.Server:LastShotInvokeElevationEventImplEnt(data, playerId, itemId)
    LastShotInvokeElevationEventImpl(data, playerId, itemId);
end

function ElevationInvoker:OnPropertyChange()
    self:OnReset();
end

function ElevationInvoker:OnEditorSetGameMode(gameMode)

end

function ElevationInvoker:OnReset()

end

function ElevationInvoker.Server:OnShutdown()

end

function ElevationInvoker:OnShutdown()

end

function ElevationInvoker:OnDestroy()

end

function ElevationInvoker:PhysicalizeThis(slot)
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

function ElevationInvoker.Server:OnHit(hit)

end

function ElevationInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function ElevationInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function ElevationInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function ElevationInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function ElevationInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Ground Elevation everyone Now');

    return actions;
end

function ElevationInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Ground Elevation everyone Now') then      
    
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
                    Type = 'LastShotInvokeElevationEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'ElevationInvoker') then  
                self.server:LastShotInvokeElevationEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function ElevationInvoker:SaveValue()
	return "";
end

function ElevationInvoker:RestoreValue(value)

end

function ElevationInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function ElevationInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function ElevationInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(ElevationInvoker);
ElevationInvoker:Expose();

local function CreateElevationInvokerTable()
    Log('creating table ElevationInvoker');
    _G['ElevationInvoker'] = new(ElevationInvoker);
end

CreateElevationInvokerTable();