-- a turtle makes mundatis

mc="minecraft:"
wc="witchery:ingredient"

-- add new recipes here
recipes["mutandis"]={{wc,22},{wc,31},{mc.."egg",0}}

function findAndDrop(name,itemID)
	found=false
	while getThingy() do
		n = turtle.getItemDetail().name
		d = turtle.getItemDetail().damage
		--print("comparing "..name.." to "..n)
		if name == n then
			print("name match, comparing id "..d.." to "..itemID)
			if itemID == d then
				print("dropping in "..name)
				found=true
				turtle.dropDown(1)
				putThingy()
			else 
				putThingy()
			end
		else
			putThingy()
		end
	end
	if not found then
		print("Missing ingredient: "..name..":"..itemID)
		os.exit()
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

function brew 
	for k,recipe in pairs(recipes) do
		for k,ingredient in pairs(recipe) do
			name=ingredient[1]
			itemID=ingredient[2]
			findInput()
			findAndDrop(v[1], v[2])
			sleep(0)
		end
	end
end

