BaseInfoInvoker = {
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

function BaseInfoInvoker:Expose()
    Net.Expose {
        Class = self,
        ClientMethods = {
        },
        ServerMethods = {
            LastShotInvokeBaseInfoEventImplEnt = { RELIABLE_ORDERED, POST_ATTACH, ENTITYID, ENTITYID }
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

function BaseInfoInvoker.Server:LastShotInvokeBaseInfoEventImplEnt(data, playerId, itemId)
    LastShotInvokeBaseInfoEventImpl(data, playerId, itemId);
end

function BaseInfoInvoker:OnPropertyChange()
    self:OnReset();
end

function BaseInfoInvoker:OnEditorSetGameMode(gameMode)

end

function BaseInfoInvoker:OnReset()

end

function BaseInfoInvoker.Server:OnShutdown()

end

function BaseInfoInvoker:OnShutdown()

end

function BaseInfoInvoker:OnDestroy()

end

function BaseInfoInvoker:PhysicalizeThis(slot)
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

function BaseInfoInvoker.Server:OnHit(hit)

end

function BaseInfoInvoker.Client:OnHit(hit, remote)

end

-- EI Begin

function BaseInfoInvoker:IsActionable(user)
    if (self.item:CanPickUp(user.id) or self.item:CanUse(user.id) or self.item:IsActionable(user.id)) then
		return 1;
	else
		return 0;
	end
end

function BaseInfoInvoker:GetActions(user)
    local actions = {};
	actions = self.item:GetActions(user.id, actions);
    return actions;
end

function BaseInfoInvoker:PerformAction(user, action)
    return self.item:PerformAction(user.id, action);
end

function BaseInfoInvoker:GetContextActions(item2, actions, targetId, targetPartId)
    table.insert(actions, 1, 'Show me the Base Info Now');

    return actions;
end

function BaseInfoInvoker:PerformContextAction(action, targetId, targetPartId)
    
    if (action == 'Show me the Base Info Now') then      
    
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
                    Type = 'LastShotInvokeBaseInfoEventImpl',
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
            if (itemInvoker and itemInvoker.class == 'BaseInfoInvoker') then  
                self.server:LastShotInvokeBaseInfoEventImplEnt(data,g_localActorId,self.id); -- This way it doesn't work.
            end  
        ]]     
             
                         
    else
        local handled = false;
        local keep = true;
        return handled, keep;
    end
    
end

function BaseInfoInvoker:SaveValue()
	return "";
end

function BaseInfoInvoker:RestoreValue(value)

end

function BaseInfoInvoker.Server:OnInit()

end

----------------------------------------------------------------------------------------------------
function BaseInfoInvoker.Client:OnInit()
    if (not self.bInitialized) then
        self:OnReset();
        self.bInitialized = 1;
    end
    self:CacheResources();
end

----------------------------------------------------------------------------------
function BaseInfoInvoker:CacheResources()

end

-- EI End
AddInteractLargeObjectProperty(BaseInfoInvoker);
BaseInfoInvoker:Expose();

local function CreateBaseInfoInvokerTable()
    Log('creating table BaseInfoInvoker');
    _G['BaseInfoInvoker'] = new(BaseInfoInvoker);
end

CreateBaseInfoInvokerTable();