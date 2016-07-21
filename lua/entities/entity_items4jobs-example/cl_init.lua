include("shared.lua")

--------- Configuration -----------------------------------------------------------------------------------------------------------------------------

local DelayBeforeNextUse = 5 -- Enter in seconds the time that the player will need to wait before using the item again.

local NotAllowedAlertDelay = 5 -- Delay before the alert desapears from screen.

local MustWaitAlertMessage = "You must wait "..DelayBeforeNextUse.." seconds before using this item again !" -- The message that the player will receive if needs to wait before reusing the item.

local MustWaitAlertDelay = 5 -- Delay before the alert desapears from screen.

local NotAllowedAlertMessage = "Only VIP's can use this item !" -- The message that the player will receive if they haven't got the permission.

local CreateHalos = true -- Enable/disable the creations of halos around the ItemsForJobs entities (true/false)

local HaloColor = Color( 0, 0, 255 ) -- Here change the numbers to the color that fits the best using RGB (Here you can find a nice website to change the color : http://bit.ly/1SpRXIk)

local ItemsForJobs_EntityName = "entity_items4jobs-example" -- Here enter the name of the entity folder that you are editing in (example : entity_items4jobs-police).

-----------------------------------------------------------------------------------------------------------------------------------------------------

function MustWaitAlert()
	notification.AddLegacy( MustWaitAlertMessage, NOTIFY_ERROR, MustWaitAlertDelay )
	surface.PlaySound( "buttons/button10.wav" )	
end

function NotAllowedAlert()
	notification.AddLegacy( NotAllowedAlertMessage, NOTIFY_ERROR, NotAllowedAlertDelay )
	surface.PlaySound( "buttons/button10.wav" )
end

local dis = 512

local dis = 512

hook.Add( "PreDrawHalos", "AddHalos", function()
	local tr = LocalPlayer():GetEyeTrace()
	
	if CreateHalos then
		if (tr.Entity and tr.HitNonWorld and IsValid(tr.Entity) and tr.Entity:GetClass() == ItemsForJobs_EntityName and LocalPlayer():GetPos():DistToSqr(tr.Entity:GetPos()) <= (dis * dis)) then
        	halo.Add({tr.Entity}, HaloColor, 2, 3, 3, false, false )
   		end 
   	end
end)

usermessage.Hook("MustWaitAlert", MustWaitAlert)
usermessage.Hook("NotAllowedAlert", NotAllowedAlert)
