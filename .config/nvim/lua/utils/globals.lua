local function starts_with(str, start) return str:sub(1, #start) == start end

_G.reload = function()
    local counter = 0
    for moduleName in pairs(package.loaded) do
        if starts_with(moduleName, 'plugins.') or
            starts_with(moduleName, 'plugins.') then
            package.loaded[moduleName] = nil
            require(moduleName)
            counter = counter + 1
        end
    end
    print('Reloaded ' .. counter .. ' modules!')
end
