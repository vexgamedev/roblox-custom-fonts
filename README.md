<div align="center">
  <h1>Custom Fonts Library</h1>
  <img src="https://raw.githubusercontent.com/vexgamedev/roblox-custom-fonts/refs/heads/main/custom-font-screenshot.png" />
  <p>This library focuses on improving your development by using custom fonts for your GUI.</p>
</div>

---
## 📥 Requiring the Library
Firstly, you should load the library in your script to even begin using it:
```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vexgamedev/roblox-custom-fonts/refs/heads/main/library.luau"))()
```

### 🔍 Key functions:
- **`download_from_github(name, path, alias)`** - Will download the font of the name from this github repository (in this case: "lucon").
- **`new_font(name)`** - Loads the font ready for usage in your UI.

---

## 📦 Downloading fonts
Here's an example for downloading fonts:
```lua
library:download_from_github("lucon", nil, "Lucida Console")
library:download_from_github("lucon", "your-script-folder/assets")
```
The first line downloads the **Lucida Console** font, while the second saves it in your assets folder.

---

## 🎨 Converting to a usable font
Once the font is downloaded, we will convert it so you can apply it to `TextLabel`s:
```lua
local LucidaConsole = library:new_font("lucon")
```
> ⚠️ Ensure `lucon.ttf` is in your workspace (there's no need to include `.ttf`).

Now, apply it to a `TextLabel`:
```lua
TextLabel.FontFace = LucidaConsole
```
This allows custom fonts without relying on images, reducing detection risks.

---

## 📝 Full example code
```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vexgamedev/roblox-custom-fonts/refs/heads/main/library.luau"))()
library:download_from_github("lucon", nil, "lucida-console")

local screenGui = Instance.new("ScreenGui", gethui())
local label = Instance.new("TextLabel", screenGui)
label.Text = "Hello world! This is a custom font called 'lucon' (Lucida Console)!"
label.Position = UDim2.fromScale(0.5, 0.8)
label.AnchorPoint = Vector2.new(0.5, 0.5)
label.FontFace = library:new_font("lucon")
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 18

local uiStroke = Instance.new("UIStroke", label)
task.delay(8, screenGui.Destroy, screenGui)
```
This script creates a `TextLabel` using **Lucida Console**, then removes it after 8 seconds.

---

Enjoy loading fonts that aren't even integrated into Roblox!
