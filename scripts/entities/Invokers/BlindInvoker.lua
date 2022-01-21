BlindInvoker = {
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

function BlindInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeBlindEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function BlindInvoker.Server:LastShotInvokeBlindEventImplEnt(data, playerId, itemId)
    LastShotInvokeBlindEventImpl(data, playerId, itemId);
end

function BlindInvoker:OnPropertyChange()
    self:OnReset();
end

function BlindInvoker:OnEditorSetGameMode(gameMode)

end

function BlindInvoker:OnReset()

end

function BlindInvoker.Server:OnShutdown()

end

function BlindInvoker:OnShutdown()

end

function BlindInvoker:OnDestroy()

end

function BlindInvoker:PhysicalizeThis(slot)
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

function BlindInvoker.Server:OnHit(hit)

end

function BlindInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function BlindInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function BlindInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function BlindInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function BlindInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Blind everyone Now');

    return actions;
end

function BlindInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Blind everyone Now') then      
    
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
                    Type = 'LastShotInvokeBlindEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'BlindInvoker') then  
                self.server:LastShotInvokeBlindEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function BlindInvoker:SaveValue()
	return "";
end

function BlindInvoker:RestoreValue(value)

end

function BlindInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function BlindInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function BlindInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(BlindInvoker);
BlindInvoker:Expose();

local function CreateBlindInvokerTable()
    Log('creating table BlindInvoker');
    _G['BlindInvoker'] = new(BlindInvoker);
end

CreateBlindInvokerTable();