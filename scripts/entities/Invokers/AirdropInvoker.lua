AirdropInvoker = {
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

function AirdropInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeAirdropEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function AirdropInvoker.Server:LastShotInvokeAirdropEventImplEnt(data, playerId, itemId)
    LastShotInvokeAirdropEventImpl(data, playerId, itemId);
end

function AirdropInvoker:OnPropertyChange()
    self:OnReset();
end

function AirdropInvoker:OnEditorSetGameMode(gameMode)

end

function AirdropInvoker:OnReset()

end

function AirdropInvoker.Server:OnShutdown()

end

function AirdropInvoker:OnShutdown()

end

function AirdropInvoker:OnDestroy()

end

function AirdropInvoker:PhysicalizeThis(slot)
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

function AirdropInvoker.Server:OnHit(hit)

end

function AirdropInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function AirdropInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function AirdropInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function AirdropInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function AirdropInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Invoke Airdrop Now');

    return actions;
end

function AirdropInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Invoke Airdrop Now') then      
    
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
                    Type = 'LastShotInvokeAirdropEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'AirdropInvoker') then  
                self.server:LastShotInvokeAirdropEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function AirdropInvoker:SaveValue()
	return "";
end

function AirdropInvoker:RestoreValue(value)

end

function AirdropInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function AirdropInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function AirdropInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(AirdropInvoker);
AirdropInvoker:Expose();

local function CreateAirdropInvokerTable()
    Log('creating table AirdropInvoker');
    _G['AirdropInvoker'] = new(AirdropInvoker);
end

CreateAirdropInvokerTable();