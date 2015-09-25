local robot=require("robot")
local component=require("component")
local sides=require("sides")
local c=component.crafting
local i=component.inventory_control

recipe={{label="Lead Ingot",slots={2},
			label="Gunpowder",slots={6,10}}
chests={input=sides.top, 
			output=sides.bottom}

function find_by_label(label)
	for slot=1,i.getInventorySize(input_chest) do
		item=i.getStackInSlot(input_chest,slot)
		if item.label == label then
			return slot
		end
	end
end

function make_ready()
	for ingredient=1,#recipe do
		for slot=#recipe[ingredient].slots
		if robot.count(recipe[ingredient].
		
	if i.getStackInInternalSlot(lead_slot).label != lead_label then
		
