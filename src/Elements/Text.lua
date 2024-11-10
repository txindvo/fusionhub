local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Text"

function Element:New(Config)
	assert(Config.Title, "Text - Missing Title")
	Config.Callback = Config.Callback or function() end

	-- สร้าง TextFrame สำหรับแสดงข้อความ
	local TextFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, false)

	-- สร้าง TextLabel และวางไว้ที่มุมบนซ้ายของ TextFrame
	local TextLabel = New("TextLabel", {
		Text = Config.Title,
		Size = UDim2.new(1, -10, 0, 20), -- ขนาดของ TextLabel (ความกว้างเต็มกรอบ ยกเว้นระยะขอบ 10)
		AnchorPoint = Vector2.new(0, 0), -- จัดแนวที่มุมบนซ้าย
		Position = UDim2.new(0, 10, 0, 10), -- ระยะขอบซ้าย 10 และบน 10
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Parent = TextFrame.Frame,
		ThemeTag = {
			TextColor3 = "Text",
		},
	})

	-- หากต้องการให้มี Callback เมื่อผู้ใช้คลิกที่ข้อความ
	TextLabel.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			self.Library:SafeCallback(Config.Callback)
		end
	end)

	return TextFrame
end

return Element
