-- a turtle script that checks an items durability and
-- spits it up if it's repaired or out (to front) if it's still damaged

while true do
	for slot = 1, 16, 1 do
		if turtle.getItemCount(slot) > 0 then
			if turtle.getItemDetail(slot).damage >0 then
				turtle.dropUp(slot)
			else
				turtle.drop(slot)
			end
		end
	end
end
