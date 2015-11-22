AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

--------------------- Configuration -------------------------------------------------------------------------------------------------------------------------------------------

JobCommand = "adp" -- The command that you gave to the job you wanna use (For example : Police command is /police so, insert police between these "" --> "police").

ObjectModel = "models/props_interiors/coffee_maker.mdl" -- The model that you wanna attribute to the object (Here, a coffee maker).

GroupRestriction = false -- If you want that only certain groups use it (true/false).

NotAllowedAlert = true -- Will tel the player that he hasn't got the permission to use the object with a message (true/false).

NotAllowedAlertMessage = "Only VIP's can use this item !" -- The message that the player will receive if they haven't got the permission.

NotAllowedAlertDelay = 5 -- Delay before the alert desapears from screen.

GroupsAllowed = { -- Insert here, the groups that you wanna be able to use the object (Useless if GroupRestriction isn't equal to true).
	"superadmin",
	"admin",
	"operator",
	"vip"
} 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function ENT:Initialize()
 
	self:SetModel( ObjectModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 
function ENT:Use( activator, caller )
	return
end
 
function ENT:Use( ply )
	if ( ply:IsPlayer() ) then
		if GroupRestriction then
			if table.HasValue(GroupsAllowed, ply:GetUserGroup()) then
				RunConsoleCommand("rp_".. JobCommand, ply:Name() )
				if RemoveOnUse then
				self:Remove()
				end
			else
			notification.AddLegacy( NotAllowedAlertMessage, NOTIFY_ERROR, NotAllowedAlertDelay )
			surface.PlaySound( "buttons/button1.wav" )
			end
		else
			RunConsoleCommand("rp_".. JobCommand, ply:Name() )
			if RemoveOnUse then
			self:Remove()
			end
		end
	end
end
 
function ENT:Think()
end
