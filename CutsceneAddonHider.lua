_addon.name = 'CutsceneAddonHider'
_addon.author = 'Ghosty'
_addon.version = '0.1'

local LOGIN_ZONE_PACKET = 0x0A
local STATUS_ID_CUTSCENES = 0x04
--local wait_for_pos = true
local hidden = false

-- hide the addons
local function hide()
    windower.send_command('unload ffxidb')
    windower.send_command('wm icon off')
end

-- show the addons
local function show()
    windower.send_command('load ffxidb')
    windower.send_command('wm icon on')
end

-- Bind Events
-- ON LOAD
windower.register_event('load', function()
    if windower.ffxi.get_info().logged_in then
        show()
    end
end)

-- ON LOGIN
windower.register_event('login', function()
    show()
end)

-- ON LOGOUT
windower.register_event('logout', function()
    hide()
end)

-- ON ZONE CHANGE
windower.register_event('incoming chunk',function(id,org,_modi,_is_injected,_is_blocked)
    if (id == LOGIN_ZONE_PACKET) then
        if windower.ffxi.get_info().mog_house then
            hide()
        end
    end
end)

-- BEFORE EACH RENDER
--[[
windower.register_event('prerender', function()
    local pos = windower.ffxi.get_position()
    if pos == '(?-?)' then
        hide()
        wait_for_pos = true
    elseif wait_for_pos and not windower.ffxi.get_info().mog_house then
        show()
        wait_for_pos = false
    end
end)
]]

-- ENTER/EXIT CUTSCENES
windower.register_event('status change', function(new_status_id)
    if not hidden and (new_status_id == STATUS_ID_CUTSCENES) then
        hidden = true
        hide()
    elseif hidden and new_status_id ~= STATUS_ID_CUTSCENES then
        hidden = false
        show()
    end
end)