--------- Configuration -----------------------------------------------------------------------------------------------------------------------------

local JobName = "Police" -- The name of the job that you are using (Example : Police), use this fucntion if you have multiple items for jobs

-------------------------------------------------------------------------------------------------------------------------------------------------------

ENT.Type = "anim"
ENT.Base = "base_gmodentity"


ENT.PrintName = "Items For Job "..JobName
ENT.Instructions = "Press E or USE to use !"
ENT.Author = "PaddyFloch"
ENT.Contact = "PaddyFlochPROMessages@Outlook.fr"

ENT.Category = "PaddyFloch"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:Draw()
	self:DrawModel()
end