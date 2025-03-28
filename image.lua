-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui
screenGui.ResetOnSpawn = false

-- Создаем ImageLabel для отображения изображения
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0, 600, 0, 400) -- Размер изображения
imageLabel.Position = UDim2.new(0.5, -300, 0.5, -200) -- Центрируем
imageLabel.BackgroundTransparency = 1 -- Прозрачный фон
imageLabel.Image = "rbxassetid://109266841290408" -- Новый ID
imageLabel.ImageTransparency = 1 -- Начинаем с полной прозрачности
imageLabel.Parent = screenGui

-- Добавляем отладочный вывод
print("ImageLabel создан с ID: rbxassetid://129465758082117")

-- Анимация появления (1 секунда)
local tweenService = game:GetService("TweenService")
local fadeIn = tweenService:Create(imageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear), {ImageTransparency = 0})

-- Анимация затухания (1 секунда)
local fadeOut = tweenService:Create(imageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear), {ImageTransparency = 1})

-- Запускаем появление
fadeIn:Play()

-- Ждем завершения появления, затем 5 секунд задержки, затем затухание
fadeIn.Completed:Connect(function()
    wait(5) -- Задержка 5 секунд после появления
    fadeOut:Play()
end)

-- Удаляем объект после завершения затухания
fadeOut.Completed:Connect(function()
    screenGui:Destroy()
    print("ImageLabel удален")
end)
