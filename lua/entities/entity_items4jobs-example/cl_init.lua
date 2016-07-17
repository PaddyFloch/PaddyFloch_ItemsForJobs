include("shared.lua")

--------- Configuration -----------------------------------------------------------------------------------------------------------------------------

local DelayBeforeNextUse = 5 -- Enter in seconds the time that the player will need to wait before using the item again.

local NotAllowedAlertDelay = 5 -- Delay before the alert desapears from screen.

local MustWaitAlertMessage = "You must wait "..DelayBeforeNextUse.." seconds before using this item again !" -- The message that the player will receive if needs to wait before reusing the item.

local MustWaitAlertDelay = 5 -- Delay before the alert desapears from screen.

local NotAllowedAlertMessage = "Only VIP's can use this item !" -- The message that the player will receive if they haven't got the permission.

-----------------------------------------------------------------------------------------------------------------------------------------------------

function MustWaitAlert()
	notification.AddLegacy( MustWaitAlertMessage, NOTIFY_ERROR, MustWaitAlertDelay )
	surface.PlaySound( "buttons/button10.wav" )
end

function NotAllowedAlert()
	notification.AddLegacy( NotAllowedAlertMessage, NOTIFY_ERROR, NotAllowedAlertDelay )
	surface.PlaySound( "buttons/button10.wav" )
end

usermessage.Hook("MustWaitAlert", MustWaitAlert)
usermessage.Hook("NotAllowedAlert", NotAllowedAlert)