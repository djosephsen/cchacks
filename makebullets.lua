local robot=require("robot")
local component=require("component")
local sides=require("sides")
local c=component.crafting
local i=component.inventory_control

recipe={{label="Lead Ingot",slots={2},
			label="Gunpowder",slots={6,10}}
chests={input=sides.top, 
			output=sides.bottom}

-- find an empty spot in the output chest
function find_empty_dest()
	for slot=1,i.getInventorySize(output_chest) do
		count=i.getSlotStackSize(output_chest, slot)
		if count == 0 then
			return slot
		end
	end
	return nil
end

-- find an ingredient in the input chest given its description
function find_by_label(label)
	for slot=1,i.getInventorySize(input_chest) do
		item=i.getStackInSlot(input_chest,slot)
		if item.label == label then
			return slot
		end
	end
end

-- prep the ingredients before attempting to craft
function make_ready()
	for ingredient = 1,#recipe do
		for slot = 1,#recipe[ingredient].slots do
			if robot.count(recipe[ingredient][slot]) == 0 then
				stuff=find_by_label(recipe[ingredient].label)
				robot.select(recipe[ingredient][slot])
				i.suckFromSlot(chests.input,stuff)
			end
		end
	end
end

-- Make some bullets and dump them into the destination slot
function make_bullets(dslot)
	make_ready()
	c.craft()
	robot.select(1)
	i.dropIntoSlot(chests.output,dslot)
end

empty_destination_slot = find_empty_dest()
while empty_destination_slot != nil do
	make_bullets(empty_destination_slot)
	empty_destination_slot = find_empty_dest()
end
