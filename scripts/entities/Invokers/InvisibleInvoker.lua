InvisibleInvoker = {
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

function InvisibleInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeInvisibleEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function InvisibleInvoker.Server:LastShotInvokeInvisibleEventImplEnt(data, playerId, itemId)
    LastShotInvokeInvisibleEventImpl(data, playerId, itemId);
end

function InvisibleInvoker:OnPropertyChange()
    self:OnReset();
end

function InvisibleInvoker:OnEditorSetGameMode(gameMode)

end

function InvisibleInvoker:OnReset()

end

function InvisibleInvoker.Server:OnShutdown()

end

function InvisibleInvoker:OnShutdown()

end

function InvisibleInvoker:OnDestroy()

end

function InvisibleInvoker:PhysicalizeThis(slot)
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

function InvisibleInvoker.Server:OnHit(hit)

end

function InvisibleInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function InvisibleInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function InvisibleInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function InvisibleInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function InvisibleInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'I want Invisibility Now');

    return actions;
end

function InvisibleInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'I want Invisibility Now') then      
    
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
                    Type = 'LastShotInvokeInvisibleEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'InvisibleInvoker') then  
                self.server:LastShotInvokeInvisibleEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function InvisibleInvoker:SaveValue()
	return "";
end

function InvisibleInvoker:RestoreValue(value)

end

function InvisibleInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function InvisibleInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function InvisibleInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(InvisibleInvoker);
InvisibleInvoker:Expose();

local function CreateInvisibleInvokerTable()
    Log('creating table InvisibleInvoker');
    _G['InvisibleInvoker'] = new(InvisibleInvoker);
end

CreateInvisibleInvokerTable();