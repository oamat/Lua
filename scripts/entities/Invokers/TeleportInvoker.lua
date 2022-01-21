TeleportInvoker = {
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

function TeleportInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeTeleportEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function TeleportInvoker.Server:LastShotInvokeTeleportEventImplEnt(data, playerId, itemId)
    LastShotInvokeTeleportEventImpl(data, playerId, itemId);
end

function TeleportInvoker:OnPropertyChange()
    self:OnReset();
end

function TeleportInvoker:OnEditorSetGameMode(gameMode)

end

function TeleportInvoker:OnReset()

end

function TeleportInvoker.Server:OnShutdown()

end

function TeleportInvoker:OnShutdown()

end

function TeleportInvoker:OnDestroy()

end

function TeleportInvoker:PhysicalizeThis(slot)
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

function TeleportInvoker.Server:OnHit(hit)

end

function TeleportInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function TeleportInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function TeleportInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function TeleportInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function TeleportInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Go to my base bed Now');

    return actions;
end

function TeleportInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Go to my base bed Now') then      
    
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
                    Type = 'LastShotInvokeTeleportEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'TeleportInvoker') then  
                self.server:LastShotInvokeTeleportEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function TeleportInvoker:SaveValue()
	return "";
end

function TeleportInvoker:RestoreValue(value)

end

function TeleportInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function TeleportInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function TeleportInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(TeleportInvoker);
TeleportInvoker:Expose();

local function CreateTeleportInvokerTable()
    Log('creating table TeleportInvoker');
    _G['TeleportInvoker'] = new(TeleportInvoker);
end

CreateTeleportInvokerTable();