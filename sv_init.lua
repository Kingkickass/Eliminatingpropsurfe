AddCSLuaFile("sh_init.lua")
include("sh_init.lua")

local PLUGIN = {}
PLUGIN_SHARED = PLUGIN


function PLUGIN.Physgunuse(ply,ent)
  if ply:GetNWBool("DisableProppush") == false or nil then
    if ent:IsValid() && ent:GetCollisionGroup(COLLISION_GROUP_NONE) then
      ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
    else 
       return false
    end
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

cityrp.command.add("propprotection", "a", 2, function(ply, arg)
	target, more = cityrp.player.get( arg[1] );
	if target then
    if arg[2] == "on" then
    	target:SetNWBool("DisableProppush", false)
    end
    if arg[2] == "off" then
    	target:SetNWBool("DisableProppush",true)
    end
  elseif more then
		local names = cityrp.player.playerstostring( more );
		ply:Notify( arg[1].." matches multiple users ("..names..")", 1 );
	else
		ply:Notify( arg[1].." is not a valid player!", 1 );
	end
  
end, "Admin Commands", "<player> <on|off>", "Disable/Enable someone's Proppush Protection.")

cityrp.plugin.register(PLUGIN) 
