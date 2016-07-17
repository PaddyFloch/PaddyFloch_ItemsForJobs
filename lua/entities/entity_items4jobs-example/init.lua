AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

--------------------- Configuration -------------------------------------------------------------------------------------------------------------------------------------------

local JobCommand = "cp" -- The command that you gave to the job you wanna use (For example : Police command is /police so, insert police between these "" --> "police").

local RemoveOnUse = true -- This command allows you to use the item only once when turned on (true/false).

local ObjectModel = "models/props_junk/PopCan01a.mdl" -- The model that you wanna attribute to the object (Here, a coffee maker).

local GroupRestriction = false -- If you want that only certain groups use it (true/false).

local DelayBeforeNextUse = 5 -- Enter in seconds the time that the player will need to wait before using the item again.

local NotAllowedAlert = true -- Will warn the player that he hasn't got the permission to use the object (true/false).

local MustWaitAlert = true -- Will warn the player that he needs to wait a certain amount of time before reusing the item (true/false).

local GroupsAllowed = { -- Insert here, the groups that you want to be able to use the object (Useless if GroupRestriction isn't equal to true).
	"superadmin",
	"admin",
	"operator",
	"vip"
} 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local CanUse = true

local DateInSeconds = 0

function ENT:Initialize()
 
	self:SetModel( ObjectModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 
function ENT:Use( activator, caller )
	return
end
 
function ENT:Use( ply )
	if CanUse then
		if ( ply:IsPlayer() ) then
			if GroupRestriction then
				if table.HasValue(GroupsAllowed, ply:GetUserGroup()) then
					RunConsoleCommand("rp_".. JobCommand, ply:Name() )
					CanUse = false
					DateInSeconds = os.time()
					if RemoveOnUse then
						self:Remove()
					end
				else if NotAllowedAlert then
					CanUse = false
					DateInSeconds = os.time()
					umsg.Start("NotAllowedAlert", ply)
					umsg.End()
				else
					CanUse = false
					DateInSeconds = os.time()
				end
				end
			else
				RunConsoleCommand("rp_".. JobCommand, ply:Name() )
				CanUse = false
				DateInSeconds = os.time()
				if RemoveOnUse then
					self:Remove()
				end
			end
		end
	else if os.time() >= DateInSeconds + DelayBeforeNextUse then
		CanUse = true
	else if MustWaitAlert then
		umsg.Start("MustWaitAlert", ply)
		umsg.End()
	end
	end
	end
end
 
function ENT:Think()
end
