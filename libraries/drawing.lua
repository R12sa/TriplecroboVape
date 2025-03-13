local DrawingHandler = {}
local httpService = game:GetService('HttpService')
local runService = game:GetService('RunService')

function DrawingHandler:Initialize()
    self.drawings = {}
    self.queue = {}
    
    -- Basic drawing functions
    function self:CreateDrawing(type, properties)
        local drawing = Drawing.new(type)
        for prop, value in pairs(properties) do
            drawing[prop] = value
        end
        return drawing
    end
end

return DrawingHandler
