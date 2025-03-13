local vape = shared.vape
local loadstring = function(...)
    local res, err = loadstring(...)
    if err and vape then 
        vape:CreateNotification('TriplecroboVape', 'Failed to load : '..err, 30, 'alert') 
    end
    return res
end

local isfile = isfile or function(file)
    local suc, res = pcall(function() 
        return readfile(file) 
    end)
    return suc and res ~= nil and res ~= ''
end

local function downloadFile(path, func)
    if not isfile(path) then
        local suc, res = pcall(function() 
            return game:HttpGet('https://raw.githubusercontent.com/R12sa/TriplecroboVape/main/'..select(1, path:gsub('newvape/', '')), true) 
        end)
        if not suc or res == '404: Not Found' then 
            error(res) 
        end
        if path:find('.lua') then 
            res = '--TriplecroboVape Watermark\n'..res 
        end
        writefile(path, res)
    end
    return (func or readfile)(path)
end

vape.Place = 6872274481
if isfile('newvape/games/'..vape.Place..'.lua') then
    loadstring(readfile('newvape/games/'..vape.Place..'.lua'), 'bedwars')()
else
    if not shared.VapeDeveloper then
        local suc, res = pcall(function() 
            return game:HttpGet('https://raw.githubusercontent.com/R12sa/TriplecroboVape/main/games/'..vape.Place..'.lua', true) 
        end)
        if suc and res ~= '404: Not Found' then
            loadstring(downloadFile('newvape/games/'..vape.Place..'.lua'), 'bedwars')()
        end
    end
end
