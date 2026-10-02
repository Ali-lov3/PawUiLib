local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ali-lov3/PawUiLib/refs/heads/main/source.lua"))()

local Window = Library:Window({
	Title = "Paw",
	Logo = "paw-print",
	ConfigFolder = "test",
})

local Tab = Window:Tab({ Name = "Example", Icon = "box" })

local Toggles = Tab:SubTab({ Name = "Example Toggle", Icon = "toggle-left" })

local Main = Toggles:Section({ Name = "example toggle", Icon = "toggle-left", Side = "Left" })

Main:Toggle({
	Name = "example toggle",
	Callback = function(state)
		print("example toggle", state)
	end,
})

Main:Toggle({
	Name = "example toggle enabled",
	Default = true,
})

Main:Toggle({
	Name = "example toggle options",
	Callback = function(state)
		print("example toggle options", state)
	end,
	Options = {
		{ Type = "Slider", Name = "slider", Min = 0, Max = 100, Default = 50, Suffix = "%", Callback = function(v) print("slider", v) end },
		{ Type = "Dropdown", Name = "mode", List = { "first", "second", "third" } },
		{ Type = "Keybind" },
	},
})

Main:Separator()
Main:Label("click the dots to open the options")

local Sliders = Toggles:Section({ Name = "example slider", Icon = "sliders-horizontal", Side = "Right" })

Sliders:Slider({ Name = "example slider", Min = 0, Max = 100, Default = 50, Suffix = "%", Callback = function(v) print("slider", v) end })
Sliders:Slider({ Name = "example slider small", Min = 0, Max = 10, Default = 5 })
Sliders:Slider({ Name = "example slider negative", Min = -50, Max = 50, Default = 0 })

local Buttons = Toggles:Section({ Name = "example button", Icon = "mouse-pointer-click", Side = "Right" })

Buttons:Button({
	Name = "example button",
	Callback = function()
		print("button clicked")
	end,
})

Buttons:Button({
	Name = "example notification",
	Callback = function()
		Window:Notify({
			Title = "example notification",
			Info = "this is a preview with title, info, icon and a custom duration",
			Icon = "bell",
			Duration = 4,
		})
	end,
})

local Colors = Tab:SubTab({ Name = "Example ColorPicker", Icon = "palette" })

local Picker = Colors:Section({ Name = "example colorpicker", Icon = "palette", Side = "Left" })

Picker:ColorPicker({
	Name = "example color",
	Callback = function(color)
		print("color", color)
	end,
})

Picker:ColorPicker({ Name = "example color 2", Default = Color3.fromRGB(120, 200, 255) })

Picker:Separator()

Picker:Toggle({
	Name = "example color toggle",
	Options = {
		{ Type = "ColorPicker", Name = "color" },
		{ Type = "Slider", Name = "opacity", Min = 0, Max = 100, Default = 100, Suffix = "%" },
	},
})

local Binds = Colors:Section({ Name = "example keybind", Icon = "keyboard", Side = "Right" })

Binds:Keybind({
	Name = "example keybind",
	Callback = function()
		print("key pressed")
	end,
})

Binds:Toggle({
	Name = "example bound toggle",
	Options = { { Type = "Keybind" } },
})

Binds:Separator()
Binds:Label("keybinds show up in the keybind list")

local Dropdowns = Tab:SubTab({ Name = "Example Dropdown", Icon = "chevron-down" })

local Lists = Dropdowns:Section({ Name = "example dropdown", Icon = "chevron-down", Side = "Left" })

Lists:Dropdown({
	Name = "example dropdown",
	List = { "option one", "option two", "option three" },
	Callback = function(v)
		print("dropdown", v)
	end,
})

Lists:MultiDropdown({
	Name = "example multi dropdown",
	List = { "option one", "option two", "option three", "option four" },
	Default = { "option one" },
	Callback = function(v)
		print("multi", table.concat(v, ", "))
	end,
})

Lists:SearchDropdown({
	Name = "example search dropdown",
	List = { "auto", "us east", "us west", "us central", "brazil", "europe west", "europe east", "uk", "russia", "india", "japan", "singapore", "hong kong", "australia", "south africa" },
})

local Inputs = Dropdowns:Section({ Name = "example input", Icon = "type", Side = "Right" })

Inputs:Input({
	Name = "example input",
	Placeholder = "type here...",
	Callback = function(text)
		print("input", text)
	end,
})

Inputs:Input({ Name = "example input 2", Placeholder = "name..." })

Inputs:Separator()

local Status = Inputs:Label("inputs fire their callback on enter")

Inputs:Button({
	Name = "change label",
	Callback = function()
		Status:SetText("label changed", Color3.fromRGB(140, 235, 150))
	end,
})

Window:CreateConfigSystem()
Window:CreateKeybindList()
Window:CreateSettingSystem()
