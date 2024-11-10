local Root = script.Parent.Parent
local Components = Root.Components
local Flipper = require(Root.Packages.Flipper)
local Creator = require(Root.Creator)

local Text = {}
Text.__index = Text
Text.__type = "Text"

function Text:New(Config)
	assert(Config.Title, "Text - Missing Title")
	Config.Content = Config.Content or ""

	local Text = require(Components.Element)(Config.Title, Config.Content, Text.Container, false)
	Text.Frame.BackgroundTransparency = 0.92
	Text.Border.Transparency = 0.6

	return Paragraph
end

return Paragraph
