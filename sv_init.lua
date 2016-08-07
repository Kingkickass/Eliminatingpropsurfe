AddCSLuaFile("sh_init.lua")
include("sh_init.lua")

local PLUGIN = {}
PLUGIN_SHARED = PLUGIN


function PLUGIN.Physgunuse(ply,ent)
                       if ent:IsValid() && ent:GetCollisionGroup(COLLISION_GROUP_NONE) then
                      ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
                  else 
        return false
     end
end 

function PLUGIN.Physgunndrop(ply,ent)
                            if ent:IsValid() then	
                            ent:SetCollisionGroup(COLLISION_GROUP_NONE)
                             ent:SetPos( ent:GetPos() )
        end
end 

hook.Add( "PhysgunPickup", "Ppickup", PLUGIN.Physgunuse )


hook.Add( "PhysgunDrop", "Pdrop", PLUGIN.Physgunndrop )

cityrp.command.add("propprotection", "a", 2, function(ply , arg)
local target = ply
arg[1] = target
 if arg[2] == "on" then
 	target:SetNWBoll("DisableProppush", false)
 end
 if arg[2] == "off" then
 	target:SetNWBoll("DisableProppush",true)
 end

cityrp.plugin.register(PLUGIN) 