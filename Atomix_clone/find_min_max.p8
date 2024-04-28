pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- programme de test
-- d'evaluation du motif 
-- actuel fait par le joueur

-- par francois crevola

actuel = 
{
			{x=3, y=7, sp=4},
			{x=1, y=6, sp=5},
			{x=8, y=7, sp=6}	
}

function find_min_max(t)
	local xmin = 99
	local xmax = 1
	local ymin = 99
	local ymax = 1
	for i,v in ipairs(t) do
		if (v.x < xmin) then xmin = v.x end
		if (v.x > xmax) then xmax = v.x end
		if (v.y < ymin) then ymin = v.y end
		if (v.y > ymax) then ymax = v.y end
	end
	return xmin,xmax,ymin,ymax
end

function create_table(nblignes, nbcols, initvalue)
	local t = {}
	for i = 1,nblignes,1 do
		t[i] = {}
		for j = 1,nbcols,1 do
			t[i][j] = initvalue
		end
	end
	return t
end

function place_atoms_in_table(t, atoms, xmin, ymin)
	for i,v in ipairs(atoms) do
		t[v.y-ymin+1][v.x-xmin+1] = v.sp
	end
end

xmin,xmax,ymin,ymax = find_min_max(actuel)
print("xmin = "..xmin)
print("xmax = "..xmax)
print("ymin = "..ymin)
print("ymax = "..ymax)

nblignes = (ymax-ymin)+1
nbcols = (xmax-xmin)+1

t = create_table(nblignes,nbcols,0)
place_atoms_in_table(t, actuel, xmin, ymin)

for i,v in ipairs(t) do
 line = ""
	for j, k in ipairs(v) do
		line = line..k
	end
	print(line)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
