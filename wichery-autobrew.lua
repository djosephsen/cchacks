-- a turtle makes mundatis

mc="minecraft:"
wc="witchery:ingredient"

function findAndDrop(name,itemID)
	while getThingy() do
		n = turtle.getItemDetail().name
		d = turtle.getItemDetail().damage
		print("comparing "..name.." to "..n)
		if name == n then
			print("name match, comparing id "..d.." to "..itemID)
			if itemID == d then
				turtle.dropDown(1)
				putThingy()
			else 
				putThingy()
			end
		else
			putThingy()
		end
	end
end

function findInput()
	if turtle.suck() then
		getThingy=turtle.suck
		putThingy=turtle.dropUp
		turtle.drop()
		print("Input from front chest")
	elseif turtle.suckUp() then
		getThingy=turtle.suckUp
		putThingy=turtle.drop
		turtle.dropUp()
		print("Input from top chest")
	end
end

ingredients={{wc,22},{wc,31},{mc.."egg",0}}
for k,v in pairs(ingredients) do
	findInput()
	findAndDrop(v[1], v[2])
	sleep(0)
end
