AirdropPlaceInvoker = {
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

function AirdropPlaceInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeViewLastAirdropEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function AirdropPlaceInvoker.Server:LastShotInvokeViewLastAirdropEventImplEnt(data, playerId, itemId)
    LastShotInvokeViewLastAirdropEventImpl(data, playerId, itemId);
end

function AirdropPlaceInvoker:OnPropertyChange()
    self:OnReset();
end

function AirdropPlaceInvoker:OnEditorSetGameMode(gameMode)

end

function AirdropPlaceInvoker:OnReset()

end

function AirdropPlaceInvoker.Server:OnShutdown()

end

function AirdropPlaceInvoker:OnShutdown()

end

function AirdropPlaceInvoker:OnDestroy()

end

function AirdropPlaceInvoker:PhysicalizeThis(slot)
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

function AirdropPlaceInvoker.Server:OnHit(hit)

end

function AirdropPlaceInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function AirdropPlaceInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function AirdropPlaceInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function AirdropPlaceInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function AirdropPlaceInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Mark place of Airdrop Now');

    return actions;
end

function AirdropPlaceInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Mark place of Airdrop Now') then      
    
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
                    Type = 'LastShotInvokeViewLastAirdropEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'AirdropPlaceInvoker') then  
                self.server:LastShotInvokeViewLastAirdropEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function AirdropPlaceInvoker:SaveValue()
	return "";
end

function AirdropPlaceInvoker:RestoreValue(value)

end

function AirdropPlaceInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function AirdropPlaceInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function AirdropPlaceInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(AirdropPlaceInvoker);
AirdropPlaceInvoker:Expose();

local function CreateAirdropPlaceInvokerTable()
    Log('creating table AirdropPlaceInvoker');
    _G['AirdropPlaceInvoker'] = new(AirdropPlaceInvoker);
end

CreateAirdropPlaceInvokerTable();