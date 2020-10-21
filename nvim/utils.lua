math.randomseed( os.time() )

local function make_global_fn(fn)
    local fn_name = '_function_' .. math.random(1000000)
    while true do
        if _G[fn_name] == nil then break end
        fn_name = '_function_' .. math.random(1000000)
    end
    _G[fn_name] = fn
    return fn_name
end

-- Better wrapper for vim table
local v = {}

local function has_global_opt(key)
    local status, result = pcall(vim.api.nvim_get_option, key)
    return status
end

local function has_buffer_opt(key)
    local status, result = pcall(vim.api.nvim_buf_get_option, 0, key)
    return status
end

local function has_window_opt(key)
    local status, result = pcall(vim.api.nvim_win_get_option, 0, key)
    return status
end

-- Options
local __index = function(table, key)
    if key == 'leader' then
        return vim.g.mapleader
    elseif has_buffer_opt(key) then
        return vim.bo[key]
    elseif has_window_opt(key) then
        return vim.wo[key]
    elseif has_global_opt(key) then
        return vim.o[key]
    end

    error(string.format("Invalid option name '%s'\n", key))
end

local __newindex = function(table, key, value)
    if key == 'leader' then
        vim.g.mapleader = value
        return nil
    end

    local found_option = false
    if has_buffer_opt(key) then
        vim.bo[key] = value
        found_option = true
    end

    if has_window_opt(key) then
        vim.wo[key] = value
        found_option = true
    end

    if has_global_opt(key) then
        vim.o[key] = value
        found_option = true
    end

    assert(found_option, string.format("Invalid option name '%s'", key))
end

-- Autocmd
v.autocmd = function(events, pattern, cmd)
    if type(cmd) == 'string' then
        vim.cmd(':autocmd ' .. events .. ' ' .. pattern ..' '.. cmd)
    else
        fn_name = make_global_fn(cmd)
        vim.cmd(':autocmd ' .. events .. ' ' .. pattern .. ' :call v:lua.' .. fn_name .. '()')
    end
end

-- Keymaps
local mappings = {
    'map', 'noremap', 'unmap',
    'nmap', 'nnoremap', 'nunmap',
    'xmap', 'xnoremap', 'xunmap',
    'cmap', 'cnoremap', 'cunmap',
    'omap', 'onoremap', 'ounmap',
    'imap', 'inoremap', 'iunmap'
}

for _, map in ipairs(mappings) do
    v[map] = function(key, cmd)
        if type(cmd) == 'string' then
            vim.cmd(':' .. map .. ' ' .. key .. ' '.. cmd)
        else
            local fn_name = make_global_fn(cmd)
            vim.cmd(':' .. map .. ' ' .. key .. ' :call v:lua.' .. fn_name .. '()<CR>')
        end
    end
end

setmetatable(v, {__index = __index, __newindex = __newindex})
return v