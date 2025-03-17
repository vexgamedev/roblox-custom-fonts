local library = {}
local templateUrl = "https://raw.githubusercontent.com/vexgamedev/roblox-custom-fonts/refs/heads/main/"
local httpService = game:GetService("HttpService")

-- e.g. library:download_from_github("lucon")
-- library:download_from_github("lucon", "your-folder/assets")
function library:download_from_github(name, path, fontName)
	local directory = path and path .. "/" or ""
	if isfile(directory .. name .. ".ttf") then return nil end
	local asset = game:HttpGet(templateUrl .. name .. ".ttf")
	writefile(directory .. name .. ".ttf", asset)
	local tbl = {
        name = fontName,
        faces = {
            {
                name = "Regular",
                weight = 400,
                style = "normal",
                assetId = getcustomasset(name .. ".ttf")
            }
        }
    }

	writefile(directory .. name .. ".ttf", httpService:JSONEncode(tbl))
end

-- e.g. library:new_font("your-folder/assets/lucon.ttf")
function library:new_font(fontpath)
	return Font.new(getcustomasset(fontpath), Enum.FontWeight.Regular)
end

return library
