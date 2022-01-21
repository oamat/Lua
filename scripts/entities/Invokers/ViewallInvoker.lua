ViewallInvoker = {
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

function ViewallInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeViewAllPlayersEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function ViewallInvoker.Server:LastShotInvokeViewAllPlayersEventImplEnt(data, playerId, itemId)
    LastShotInvokeViewAllPlayersEventImpl(data, playerId, itemId);
end

function ViewallInvoker:OnPropertyChange()
    self:OnReset();
end

function ViewallInvoker:OnEditorSetGameMode(gameMode)

end

function ViewallInvoker:OnReset()

end

function ViewallInvoker.Server:OnShutdown()

end

function ViewallInvoker:OnShutdown()

end

function ViewallInvoker:OnDestroy()

end

function ViewallInvoker:PhysicalizeThis(slot)
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

function ViewallInvoker.Server:OnHit(hit)

end

function ViewallInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function ViewallInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function ViewallInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function ViewallInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function ViewallInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'I want to see all players Now');

    return actions;
end

function ViewallInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'I want to see all players Now') then      
    
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
                    Type = 'LastShotInvokeViewAllPlayersEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'ViewallInvoker') then  
                self.server:LastShotInvokeViewAllPlayersEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function ViewallInvoker:SaveValue()
	return "";
end

function ViewallInvoker:RestoreValue(value)

end

function ViewallInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function ViewallInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function ViewallInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(ViewallInvoker);
ViewallInvoker:Expose();

local function CreateViewallInvokerTable()
    Log('creating table ViewallInvoker');
    _G['ViewallInvoker'] = new(ViewallInvoker);
end

CreateViewallInvokerTable();