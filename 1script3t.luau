local _Players = game:GetService('Players')
local _TweenService = game:GetService('TweenService')
local _RunService = game:GetService('RunService')
local _UserInputService = game:GetService('UserInputService')
local _LocalPlayer = _Players.LocalPlayer
local _PlayerGui = _LocalPlayer:WaitForChild('PlayerGui')
local _ScreenGui = Instance.new('ScreenGui')

_ScreenGui.Name = 'RNXTechGUI'
_ScreenGui.ResetOnSpawn = false
_ScreenGui.Parent = _PlayerGui

local u8 = {
    ['10503381238'] = true,
    ['13379003796'] = true,
}
local u9 = {
    ['10479335397'] = true,
    ['13380255751'] = true,
}
local u10 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
local u11 = nil
local u12 = nil
local u13 = false
local u14 = 10
local u15 = false
local u16 = nil
local u17 = nil
local u18 = {}
local u19 = false
local u20 = {}

local function u22(p21)
    if p21 and typeof(p21) == 'RBXScriptConnection' then
        p21:Disconnect()
    end
end
local function u29()
    u22(u17)

    u17 = nil

    if u12 then
        local v23 = u12
        local v24, v25, v26 = ipairs(v23:GetChildren())

        while true do
            local v27

            v26, v27 = v24(v25, v26)

            if v26 == nil then
                break
            end
            if v27:IsA('AlignPosition') or v27:IsA('AlignOrientation') then
                v27:Destroy()
            end
            if v27:IsA('Attachment') or v27.Name == 'HasSnapped' then
                v27:Destroy()
            end
        end
    end

    local _KibaFollowPart = workspace:FindFirstChild('KibaFollowPart')

    if _KibaFollowPart then
        _KibaFollowPart:Destroy()
    end
end
local function u39()
    local v30 = nil
    local v31 = u14

    if workspace:FindFirstChild('Live') then
        local v32, v33, v34 = pairs(workspace.Live:GetChildren())

        while true do
            local v35

            v34, v35 = v32(v33, v34)

            if v34 == nil then
                break
            end
            if v35:IsA('Model') and v35 ~= u10 then
                local _HumanoidRootPart = v35:FindFirstChild('HumanoidRootPart')
                local _Humanoid = v35:FindFirstChildOfClass('Humanoid')

                if _HumanoidRootPart and (_Humanoid and _Humanoid.Health > 0) then
                    local _Magnitude = (_HumanoidRootPart.Position - (u12 and u12.Position or Vector3.zero)).Magnitude

                    if _Magnitude <= v31 then
                        if v35.Name == 'Weakest Dummy' then
                            v31 = _Magnitude
                            v30 = _HumanoidRootPart
                        elseif _Players:GetPlayerFromCharacter(v35) then
                            v31 = _Magnitude
                            v30 = _HumanoidRootPart
                        end
                    end
                end
            end
        end
    end

    return v30
end
local function u49(p40)
    u15 = true

    local _Frame = Instance.new('Frame')

    _Frame.Size = UDim2.new(0, 180, 0, 18)
    _Frame.Position = UDim2.new(0.5, -90, 0.4, 80)
    _Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    _Frame.Transparency = 0.6
    _Frame.BorderSizePixel = 0
    _Frame.Parent = _PlayerGui
    Instance.new('UICorner', _Frame).CornerRadius = UDim.new(0, 10)

    local _Frame2 = Instance.new('Frame')

    _Frame2.Size = UDim2.new(0, 0, 1, 0)
    _Frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _Frame2.BorderSizePixel = 0
    _Frame2.Parent = _Frame
    Instance.new('UICorner', _Frame2).CornerRadius = UDim.new(0, 10)

    local _TextLabel = Instance.new('TextLabel')

    _TextLabel.Size = UDim2.new(1, 0, 1, 0)
    _TextLabel.BackgroundTransparency = 0.6
    _TextLabel.Text = 'Kiba Tech V4'
    _TextLabel.TextColor3 = Color3.new(1, 1, 1)
    _TextLabel.Font = Enum.Font.GothamBold
    _TextLabel.TextScaled = true
    _TextLabel.Parent = _Frame

    local _Highlight = Instance.new('Highlight')

    _Highlight.Parent = u10
    _Highlight.FillTransparency = 0.3
    _Highlight.OutlineTransparency = 0.1

    local u45 = true

    task.spawn(function()
        local v46 = {
            Color3.fromRGB(10, 15, 25),
            Color3.fromRGB(10, 15, 25),
            Color3.fromRGB(10, 15, 25),
        }
        local v47 = 1

        while u45 and _Highlight.Parent do
            _Highlight.FillColor = v46[v47]
            _Highlight.OutlineColor = v46[v47 % #v46 + 1]
            v47 = v47 % #v46 + 1

            task.wait(0.2)
        end
    end)

    local _ParticleEmitter = Instance.new('ParticleEmitter')

    _ParticleEmitter.Texture = 'rbxassetid://243660364'
    _ParticleEmitter.Rate = 6
    _ParticleEmitter.Lifetime = NumberRange.new(1.2, 1.6)
    _ParticleEmitter.Speed = NumberRange.new(0, 0)
    _ParticleEmitter.Rotation = NumberRange.new(0, 360)
    _ParticleEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 2),
        NumberSequenceKeypoint.new(0.5, 6),
        NumberSequenceKeypoint.new(1, 10),
    })
    _ParticleEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 1),
    })
    _ParticleEmitter.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
    })
    _ParticleEmitter.LightEmission = 0.6
    _ParticleEmitter.Parent = u12

    _TweenService:Create(_Frame2, TweenInfo.new(p40, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, 0, 1, 0),
    }):Play()
    task.delay(p40, function()
        u15 = false

        _Frame:Destroy()

        u45 = false

        if _Highlight then
            _Highlight:Destroy()
        end
        if _ParticleEmitter then
            _ParticleEmitter:Destroy()
        end
    end)
end
local function u60(p50)
    u29()

    if p50 and (p50.Parent and u12) then
        local _Part = Instance.new('Part')

        _Part.Size = Vector3.new(0.5, 0.5, 0.5)
        _Part.Transparency = 1
        _Part.Anchored = true
        _Part.CanCollide = false
        _Part.Name = 'RNXFollowPart'
        _Part.Parent = workspace

        local _Attachment = Instance.new('Attachment', u12)
        local _Attachment2 = Instance.new('Attachment', _Part)
        local _Attachment3 = Instance.new('Attachment', u12)
        local _Attachment4 = Instance.new('Attachment', _Part)
        local _AlignPosition = Instance.new('AlignPosition')

        _AlignPosition.Attachment0 = _Attachment
        _AlignPosition.Attachment1 = _Attachment2
        _AlignPosition.RigidityEnabled = true
        _AlignPosition.Responsiveness = 100
        _AlignPosition.MaxForce = math.huge
        _AlignPosition.Parent = u12

        local _AlignOrientation = Instance.new('AlignOrientation')

        _AlignOrientation.Attachment0 = _Attachment3
        _AlignOrientation.Attachment1 = _Attachment4
        _AlignOrientation.RigidityEnabled = true
        _AlignOrientation.Responsiveness = 200
        _AlignOrientation.MaxTorque = math.huge
        _AlignOrientation.Parent = u12
        u17 = _RunService.RenderStepped:Connect(function()
            if p50 and p50.Parent then
                local v58 = p50.CFrame * CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(55), 0, 0)

                _Part.CFrame = v58

                if u12 and (not u12:FindFirstChild('HasSnapped') and u12:IsDescendantOf(workspace)) then
                    u12.CFrame = v58

                    local _BoolValue = Instance.new('BoolValue')

                    _BoolValue.Name = 'HasSnapped'
                    _BoolValue.Parent = u12
                end
            else
                u29()
            end
        end)
    end
end
local function u65(p61)
    if u13 and not u15 then
        if p61 and p61.Animation then
            local v62 = tostring(string.match(p61.Animation.AnimationId or '', '%d+'))

            if v62 ~= '' then
                if u9[v62] then
                    u15 = true

                    task.delay(0.8, function()
                        u49(4.6)
                    end)
                elseif u8[v62] then
                    u15 = true

                    task.delay(0.32, function()
                        local u63 = {
                            {
                                Dash = Enum.KeyCode.W,
                                Key = Enum.KeyCode.Q,
                                Goal = 'KeyPress',
                            },
                        }

                        pcall(function()
                            if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('Communicate') then
                                _LocalPlayer.Character:WaitForChild('Communicate'):FireServer(unpack(u63))
                            end
                        end)

                        local v64 = u39()

                        if v64 then
                            u60(v64)
                            task.delay(0.5, u29)
                        end
                    end)
                    task.delay(0.8, function()
                        u49(4.6)
                    end)
                end
            end
        else
            return
        end
    else
        return
    end
end
local function u66()
    u29()
    u22(u16)

    u16 = nil
    u10 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
    u11 = u10:WaitForChild('Humanoid')
    u12 = u10:WaitForChild('HumanoidRootPart')
    u16 = u11.AnimationPlayed:Connect(u65)
end

u66()
_LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.1)
    u66()

    if not _PlayerGui:FindFirstChild(_ScreenGui.Name) then
        _ScreenGui.Parent = _PlayerGui
    end
end)
_LocalPlayer.CharacterRemoving:Connect(function()
    u29()
    u22(u16)

    u16 = nil
end)

local v67 = _ScreenGui

v67.Name = 'RNXToggleUI'

local u68 = _PlayerGui:FindFirstChild('RNXToggle') or Instance.new('TextButton')

u68.Name = 'RNXToggle'
u68.Size = UDim2.new(0, 100, 0, 30)
u68.Position = UDim2.new(0.45, 0, 0.45, 0)
u68.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
u68.Text = 'RNX Tech V4'
u68.TextColor3 = Color3.fromRGB(180, 20, 40)
u68.TextSize = 12
u68.Font = Enum.Font.GothamBold
u68.AutoButtonColor = false
u68.BackgroundTransparency = 0.1
u68.Parent = v67
u68.ZIndex = 5
Instance.new('UICorner', u68).CornerRadius = UDim.new(0.2, 0)

local v69, v70, v71 = ipairs({
    '\u{7b26}',
    '\u{5492}',
    '\u{708e}',
    '\u{7075}',
    '\u{529b}',
    '\u{795e}',
    '\u{9635}',
    '\u{7206}',
})
local u72 = u13

while true do
    local v73

    v71, v73 = v69(v70, v71)

    if v71 == nil then
        break
    end

    local _TextLabel2 = Instance.new('TextLabel')

    _TextLabel2.Text = v73
    _TextLabel2.TextColor3 = Color3.fromRGB(255, 235, 180)
    _TextLabel2.Font = Enum.Font.GothamBold
    _TextLabel2.TextSize = 20
    _TextLabel2.BackgroundTransparency = 1
    _TextLabel2.Visible = false
    _TextLabel2.Parent = v67

    table.insert(u18, _TextLabel2)
end

local u75 = {
    Color3.fromRGB(10, 10, 10),
    Color3.fromRGB(20, 20, 20),
    Color3.fromRGB(30, 30, 30),
    Color3.fromRGB(40, 40, 40),
    Color3.fromRGB(50, 50, 50),
    Color3.fromRGB(60, 60, 60),
}

local function u79(p76)
    task.spawn(function()
        while u19 and p76.Visible do
            local v77 = _TweenService
            local v78 = {
                TextColor3 = u75[math.random(1, #u75)],
            }

            v77:Create(p76, TweenInfo.new(2.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v78):Play()
            task.wait(2.8)
        end
    end)
end

for v80 = 1, #u18 do
    local v81 = v80

    u20[v81] = {
        angle = v81 * math.pi / 4,
    }
end

local function u98(p82)
    local v83 = u68.AbsolutePosition + u68.AbsoluteSize / 2
    local v84 = u68.AbsoluteSize.X / 2 + 8
    local v85 = u68.AbsoluteSize.Y / 2 + 8
    local v86, v87, v88 = ipairs(u18)
    local v89 = 0.5

    while true do
        local v90

        v88, v90 = v86(v87, v88)

        if v88 == nil then
            break
        end

        local v91 = u20[v88]

        v91.angle = (v91.angle + p82 * v89) % (2 * math.pi)

        local v92 = math.cos(v91.angle)
        local v93 = math.sin(v91.angle)
        local v94, v95

        if math.abs(v92) <= math.abs(v93) then
            v94 = v92 * v84
            v95 = math.sign(v93) * v85
        else
            v94 = math.sign(v92) * v84
            v95 = v93 * v85
        end

        local v96 = Vector2.new(v83.X + v94 - v90.AbsoluteSize.X / 2, v83.Y + v95 - v90.AbsoluteSize.Y / 2)
        local v97 = Vector2.new(v90.Position.X.Offset, v90.Position.Y.Offset):Lerp(v96, 0.15)

        v90.Position = UDim2.fromOffset(v97.X, v97.Y)
    end
end
local function u109(p99)
    if p99 then
        u19 = true

        local v100, v101, v102 = ipairs(u18)

        while true do
            local v103

            v102, v103 = v100(v101, v102)

            if v102 == nil then
                break
            end

            v103.Visible = true
            v103.TextTransparency = 1
            v103.Position = UDim2.fromOffset(math.random(0, 800), math.random(0, 400))

            _TweenService:Create(v103, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                Position = u68.Position,
            }):Play()
            u79(v103)
            task.wait(0.05)
        end
    else
        u19 = false

        local v104, v105, v106 = ipairs(u18)

        while true do
            local u107

            v106, u107 = v104(v105, v106)

            if v106 == nil then
                break
            end

            local v108 = _TweenService:Create(u107, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0.15,
                Size = UDim2.new(0, u107.AbsoluteSize.X + 8, 0, u107.AbsoluteSize.Y + 8),
            })

            v108:Play()
            v108.Completed:Connect(function()
                _TweenService:Create(u107, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    TextTransparency = 1,
                    Size = UDim2.new(0, 4, 0, 4),
                    Position = UDim2.fromOffset(u107.Position.X.Offset + math.random(-40, 40), u107.Position.Y.Offset + math.random(-40, 40)),
                }):Play()
                task.delay(0.45, function()
                    u107.Visible = false
                    u107.TextTransparency = 0
                    u107.TextColor3 = Color3.fromRGB(255, 235, 180)

                    pcall(function()
                        u107.Size = UDim2.new(0, 20, 0, 20)
                    end)
                end)
            end)
        end
    end
end

local u110 = false

u68.MouseButton1Click:Connect(function()
    u110 = not u110

    if u110 then
        _TweenService:Create(u68, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        }):Play()
        u109(true)

        u72 = true
        u68.Text = 'RNX Tech V4'
    else
        _TweenService:Create(u68, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }):Play()
        u109(false)

        u72 = false
        u68.Text = 'RNX Tech V4'
    end
end)

local u111 = nil
local u112 = nil
local u113 = nil

u68.InputBegan:Connect(function(p114)
    if p114.UserInputType == Enum.UserInputType.Touch or p114.UserInputType == Enum.UserInputType.MouseButton1 then
        u111 = true
        u112 = p114.Position
        u113 = u68.Position
    end
end)
_UserInputService.InputChanged:Connect(function(p115)
    if u111 and (p115.UserInputType == Enum.UserInputType.Touch or p115.UserInputType == Enum.UserInputType.MouseMovement) then
        local v116 = p115.Position - u112

        u68.Position = UDim2.new(u113.X.Scale, u113.X.Offset + v116.X, u113.Y.Scale, u113.Y.Offset + v116.Y)
    end
end)
_UserInputService.InputEnded:Connect(function(p117)
    if p117.UserInputType == Enum.UserInputType.Touch or p117.UserInputType == Enum.UserInputType.MouseButton1 then
        u111 = false
    end
end)
_RunService.RenderStepped:Connect(function(p118)
    if u19 then
        u98(p118)
    end
end)

if not _PlayerGui:FindFirstChild(_ScreenGui.Name) then
    _ScreenGui.Parent = _PlayerGui
end
