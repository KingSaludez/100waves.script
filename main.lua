-- 100 Waves Later | Complete Mini UI Script
-- Executor: Delta
-- UI: Small, toggleable, draggable

-- =========================
-- SERVICES
-- =========================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local LP = Players.LocalPlayer
local Character = LP.Character or LP.CharacterAdded:Wait()

-- =========================
-- GLOBAL TOGGLES
-- =========================
_G.AutoKill = false
_G.AutoFarm = false
_G.AutoCollect = false
_G.InfiniteAmmo = false
_G.AntiDeath = false

-- =========================
-- CLEAN OLD UI
-- =========================
pcall(function()
    if CoreGui:FindFirstChild("MiniUI") then
            CoreGui.MiniUI:Destroy()
                end
                end)

                -- =========================
                -- UI CREATION
                -- =========================
                local UI = Instance.new("ScreenGui", CoreGui)
                UI.Name = "MiniUI"
                UI.ResetOnSpawn = false

                -- Open / Close Button
                local OpenBtn = Instance.new("TextButton", UI)
                OpenBtn.Size = UDim2.new(0, 38, 0, 38)
                OpenBtn.Position = UDim2.new(0, 12, 0.5, -19)
                OpenBtn.Text = "≡"
                OpenBtn.TextSize = 20
                OpenBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
                OpenBtn.TextColor3 = Color3.new(1,1,1)
                OpenBtn.BorderSizePixel = 0
                OpenBtn.Active = true
                OpenBtn.Draggable = true

                local btnCorner = Instance.new("UICorner", OpenBtn)
                btnCorner.CornerRadius = UDim.new(0, 8)

                -- Main Panel
                local Frame = Instance.new("Frame", UI)
                Frame.Size = UDim2.new(0, 165, 0, 190)
                Frame.Position = UDim2.new(0, 60, 0.5, -95)
                Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
                Frame.BorderSizePixel = 0
                Frame.Visible = false
                Frame.Active = true
                Frame.Draggable = true

                local frameCorner = Instance.new("UICorner", Frame)
                frameCorner.CornerRadius = UDim.new(0, 10)

                -- Title
                local Title = Instance.new("TextLabel", Frame)
                Title.Size = UDim2.new(1, 0, 0, 28)
                Title.Text = "100 Waves Later"
                Title.TextSize = 13
                Title.Font = Enum.Font.GothamBold
                Title.TextColor3 = Color3.new(1,1,1)
                Title.BackgroundTransparency = 1

                -- =========================
                -- TOGGLE BUTTON FUNCTION
                -- =========================
                local function CreateToggle(text, y, callback)
                    local Toggle = Instance.new("TextButton", Frame)
                        Toggle.Size = UDim2.new(1, -20, 0, 26)
                            Toggle.Position = UDim2.new(0, 10, 0, y)
                                Toggle.Text = text .. " : OFF"
                                    Toggle.TextSize = 12
                                        Toggle.Font = Enum.Font.Gotham
                                            Toggle.TextColor3 = Color3.new(1,1,1)
                                                Toggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
                                                    Toggle.BorderSizePixel = 0

                                                        local c = Instance.new("UICorner", Toggle)
                                                            c.CornerRadius = UDim.new(0, 6)

                                                                local state = false
                                                                    Toggle.MouseButton1Click:Connect(function()
                                                                            state = not state
                                                                                    Toggle.Text = text .. (state and " : ON" or " : OFF")
                                                                                            Toggle.BackgroundColor3 = state and Color3.fromRGB(70,120,70) or Color3.fromRGB(40,40,40)
                                                                                                    callback(state)
                                                                                                        end)
                                                                                                        end

                                                                                                        -- Toggles
                                                                                                        CreateToggle("Auto Kill", 32, function(v) _G.AutoKill = v end)
                                                                                                        CreateToggle("Auto Farm", 60, function(v) _G.AutoFarm = v end)
                                                                                                        CreateToggle("Auto Collect", 88, function(v) _G.AutoCollect = v end)
                                                                                                        CreateToggle("Infinite Ammo", 116, function(v) _G.InfiniteAmmo = v end)
                                                                                                        CreateToggle("Anti Death", 144, function(v) _G.AntiDeath = v end)

                                                                                                        -- Open / Close UI
                                                                                                        OpenBtn.MouseButton1Click:Connect(function()
                                                                                                            Frame.Visible = not Frame.Visible
                                                                                                            end)

                                                                                                            -- =========================
                                                                                                            -- FEATURES
                                                                                                            -- =========================

                                                                                                            -- Anti Death
                                                                                                            task.spawn(function()
                                                                                                                while task.wait(0.2) do
                                                                                                                        if _G.AntiDeath then
                                                                                                                                    local hum = Character:FindFirstChildOfClass("Humanoid")
                                                                                                                                                if hum then
                                                                                                                                                                hum.Health = hum.MaxHealth
                                                                                                                                                                            end
                                                                                                                                                                                    end
                                                                                                                                                                                        end
                                                                                                                                                                                        end)

                                                                                                                                                                                        -- Infinite Ammo
                                                                                                                                                                                        task.spawn(function()
                                                                                                                                                                                            while task.wait(0.1) do
                                                                                                                                                                                                    if _G.InfiniteAmmo then
                                                                                                                                                                                                                for _,tool in pairs(LP.Backpack:GetChildren()) do
                                                                                                                                                                                                                                for _,v in pairs(tool:GetDescendants()) do
                                                                                                                                                                                                                                                    if v:IsA("IntValue") and v.Name:lower():find("ammo") then
                                                                                                                                                                                                                                                                            v.Value = 999999
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        end)

                                                                                                                                                                                                                                                                                                                                        -- Auto Collect
                                                                                                                                                                                                                                                                                                                                        task.spawn(function()
                                                                                                                                                                                                                                                                                                                                            while task.wait(0.3) do
                                                                                                                                                                                                                                                                                                                                                    if _G.AutoCollect and Character:FindFirstChild("HumanoidRootPart") then
                                                                                                                                                                                                                                                                                                                                                                for _,v in pairs(Workspace:GetDescendants()) do
                                                                                                                                                                                                                                                                                                                                                                                if v:IsA("TouchTransmitter") and v.Parent then
                                                                                                                                                                                                                                                                                                                                                                                                    firetouchinterest(Character.HumanoidRootPart, v.Parent, 0)
                                                                                                                                                                                                                                                                                                                                                                                                                        firetouchinterest(Character.HumanoidRootPart, v.Parent, 1)
                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                end)

                                                                                                                                                                                                                                                                                                                                                                                                                                                                -- Auto Kill / Farm
                                                                                                                                                                                                                                                                                                                                                                                                                                                                task.spawn(function()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    while task.wait(0.2) do
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoKill then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        for _,mob in pairs(Workspace:GetChildren()) do
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if mob:FindFirstChild("Humanoid") and mob.Name ~= LP.Name then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            pcall(function()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    mob.Humanoid.Health = 0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoFarm and mob:FindFirstChild("HumanoidRootPart") then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Character.HumanoidRootPart.CFrame =
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        mob.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end)

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            -- Notification
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            game.StarterGui:SetCore("SendNotification", {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Title = "Script Loaded",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Text = "Tap ≡ to open / close menu",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Duration = 4
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        })