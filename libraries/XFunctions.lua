local function downloadFile(path, func)
    if not isfile(path) then
        local suc, res = pcall(function()
            return game:HttpGet('https://raw.githubusercontent.com/R12sa/TriplecroboVape/main/'..select(1, path:gsub('newvape/', '')), true)
        end)
        if not suc or res == '404: Not Found' then
            error(res)
        end
        writefile(path, res)
    end
    return (func or readfile)(path)
end

for _, folder in {'newvape', 'newvape/games', 'newvape/profiles', 'newvape/assets', 'newvape/libraries', 'newvape/guis'} do
    if not isfolder(folder) then
        makefolder(folder)
    end
end

writefile('newvape/profiles/commit.txt', 'main')
loadstring(game:HttpGet("https://raw.githubusercontent.com/R12sa/TriplecroboVape/main/NewMainScript.lua", true))()
