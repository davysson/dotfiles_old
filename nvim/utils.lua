local v = {}

-- Some util functions
math.randomseed(os.time())

local function make_global_fn(fn)
    local fn_name = '_function_' .. math.random(1000000)
    while true do
        if _G[fn_name] == nil then break end
        fn_name = '_function_' .. math.random(1000000)
    end
    _G[fn_name] = fn
    return fn_name
end

local function table_to_str(array, split)
    str = ''
    for _, value in ipairs(array) do
        str = str .. value .. split
    end
    return str:sub(1, #str - #split)
end

-- Wrapper for vim options

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
    if type(value) == 'table' then
        value = table_to_str(value, ',')
    end

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

-- Commands
v.cmd = {}
local __cmd_index = function(table, key)
    local t = {}
    setmetatable(t, {
        __tostring = function() return key end,
        __call = function() vim.cmd(':' .. key) end,
    })
    return t
end

local __cmd_newindex = function(table, key, fn)
    local nargs = debug.getinfo(fn).nparams
    if nargs > 1 then nargs = '*' end
    local fn_name = make_global_fn(fn)
    vim.cmd(':command -nargs=' .. nargs .. ' ' .. key .. ' call v:lua.' .. fn_name .. '(<f-args>)')
end

setmetatable(v.cmd, {__index = __cmd_index, __newindex = __cmd_newindex})

-- Autocmd
v.autocmd = function(events, pattern, cmd)
    if type(events) == 'table' then
        events = table_to_str(events, ',')
    end

    if type(cmd) == 'string' then
        vim.cmd(':autocmd ' .. events .. ' ' .. pattern ..' '.. cmd)
    else
        fn_name = make_global_fn(cmd)
        vim.cmd(':autocmd ' .. events .. ' ' .. pattern .. ' call v:lua.' .. fn_name .. '()')
    end
end

-- Keymaps
local mappings = {
    'map', 'noremap', 'unmap',
    'nmap', 'nnoremap', 'nunmap',
    'vmap', 'vnoremap', 'vunmap',
    'smap', 'snoremap', 'sunmap',
    'xmap', 'xnoremap', 'xunmap',
    'cmap', 'cnoremap', 'cunmap',
    'omap', 'onoremap', 'ounmap',
    'imap', 'inoremap', 'iunmap',
    'tmap', 'tnoremap', 'tunmap'
}

for _, map in ipairs(mappings) do
    v[map] = function(key, cmd)
        if type(key) == 'table' then
            key = table_to_str(key, '')
        end

        if type(cmd) == 'string' then
            vim.cmd(':' .. map .. ' ' .. key .. ' '.. cmd)
        elseif type(cmd) == 'table' then
            vim.cmd(':' .. map .. ' ' .. key .. ' :'.. tostring(cmd) .. '<CR>')
        else
            local fn_name = make_global_fn(cmd)
            vim.cmd(':' .. map .. ' ' .. key .. ' :call v:lua.' .. fn_name .. '()<CR>')
        end
    end
end

setmetatable(v, {__index = __index, __newindex = __newindex})
return v