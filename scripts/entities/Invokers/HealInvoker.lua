HealInvoker = {
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

function HealInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeHealEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function HealInvoker.Server:LastShotInvokeHealEventImplEnt(data, playerId, itemId)
    LastShotInvokeHealEventImpl(data, playerId, itemId);
end

function HealInvoker:OnPropertyChange()
    self:OnReset();
end

function HealInvoker:OnEditorSetGameMode(gameMode)

end

function HealInvoker:OnReset()

end

function HealInvoker.Server:OnShutdown()

end

function HealInvoker:OnShutdown()

end

function HealInvoker:OnDestroy()

end

function HealInvoker:PhysicalizeThis(slot)
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

function HealInvoker.Server:OnHit(hit)

end

function HealInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function HealInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function HealInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function HealInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function HealInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Heal me now');

    return actions;
end

function HealInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Heal me now') then      
    
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
                    Type = 'LastShotInvokeHealEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'HealInvoker') then  
                self.server:LastShotInvokeHealEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function HealInvoker:SaveValue()
	return "";
end

function HealInvoker:RestoreValue(value)

end

function HealInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function HealInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function HealInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(HealInvoker);
HealInvoker:Expose();

local function CreateHealInvokerTable()
    Log('creating table HealInvoker');
    _G['HealInvoker'] = new(HealInvoker);
end

CreateHealInvokerTable();