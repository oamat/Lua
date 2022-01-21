CorpseInvoker = {
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

function CorpseInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeCorpseEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function CorpseInvoker.Server:LastShotInvokeCorpseEventImplEnt(data, playerId, itemId)
    LastShotInvokeCorpseEventImpl(data, playerId, itemId);
end

function CorpseInvoker:OnPropertyChange()
    self:OnReset();
end

function CorpseInvoker:OnEditorSetGameMode(gameMode)

end

function CorpseInvoker:OnReset()

end

function CorpseInvoker.Server:OnShutdown()

end

function CorpseInvoker:OnShutdown()

end

function CorpseInvoker:OnDestroy()

end

function CorpseInvoker:PhysicalizeThis(slot)
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

function CorpseInvoker.Server:OnHit(hit)

end

function CorpseInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function CorpseInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function CorpseInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function CorpseInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function CorpseInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Go to my Corpse Now');

    return actions;
end

function CorpseInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Go to my Corpse Now') then      
    
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
                    Type = 'LastShotInvokeCorpseEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'CorpseInvoker') then  
                self.server:LastShotInvokeCorpseEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function CorpseInvoker:SaveValue()
	return "";
end

function CorpseInvoker:RestoreValue(value)

end

function CorpseInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function CorpseInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function CorpseInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(CorpseInvoker);
CorpseInvoker:Expose();

local function CreateCorpseInvokerTable()
    Log('creating table CorpseInvoker');
    _G['CorpseInvoker'] = new(CorpseInvoker);
end

CreateCorpseInvokerTable();