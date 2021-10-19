-- Various util functions

local function concat(a, b)
	local c = {}
	for _, v in pairs(a) do
		table.insert(c, v)
	end
	for _, v in pairs(b) do
		table.insert(c, v)
	end
	return c
end


return {
	concat = concat
}
