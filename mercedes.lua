local mercedes                          = {}
asssssert = mercedes
local me                                = LocalPlayer()

if not ded then require("vrmod") end
local function lby(ind)
    if true then return 0 end
    return ded.GetCurrentLowerBodyYaw(ind)
end
local function setlby(ind)
    if true then return 0 end
    return ded.SetCurrentLowerBodyYaw(ind)
end
local function lby_target(ind)
    if true then return 0 end
    return ded.GetTargetLowerBodyYaw(ind)
end
local function setlby_target(ind)
    if true then return 0 end
    return ded.SetTargetLowerBodyYaw(ind)
end

jit.flush()



local global 		                    = _G 

local gRunCmd                           = global.RunConsoleCommand

local Angle                             = Angle 
local Material                          = Material 
local Vector                            = Vector 
local Color                             = Color
local pairs                             = pairs
local ipairs                            = ipairs 
local IsValid                           = IsValid
local tostring                          = tostring 
local tonumber                          = tonumber
local CurTime                           = CurTime
local IsFirstTimePredicted              = IsFirstTimePredicted
local Lerp                              = Lerp 
local LerpAngle                         = LerpAngle

local gFindMeta                         = global.FindMetaTable

local MetaPly                           = gFindMeta("Player")

local gVgui                             = global.vgui 
local gGui                              = global.gui
local gString                           = global.string
local gTable                            = global.table
local gUtil                             = global.util
local gHttp                             = global.http
local gFile                             = global.file
local gSurface                          = global.surface
local gDraw                             = global.draw
local gRender                           = global.render
local gCam                              = global.cam
local gInput                            = global.input
local gHook                             = global.hook
local gNet                              = global.net
local gMath                             = global.math
local gBit                              = global.bit
local gEnts                             = global.ents
local gPlys                             = global.player
local gGame                             = global.game
local gEngine                           = global.engine
local gTeam                             = global.team

local gPlayer                            = global.Player
local gEntity                            = global.Entity

local team_GetColor                     = gTeam.GetColor 
local team_GetName                      = gTeam.GetName

local surface_DrawLine                  = gSurface.DrawLine
local surface_DrawOutlinedRect          = gSurface.DrawOutlinedRect
local surface_DrawPoly                  = gSurface.DrawPoly
local surface_DrawRect                  = gSurface.DrawRect
local surface_DrawText                  = gSurface.DrawText
local surface_DrawTexturedRect          = gSurface.DrawTexturedRect
local surface_DrawTexturedRectRotated   = gSurface.DrawTexturedRectRotated
local surface_GetTextSize               = gSurface.GetTextSize
local surface_PlaySound                 = gSurface.PlaySound
local surface_SetAlphaMultiplier        = gSurface.SetAlphaMultiplier
local surface_SetDrawColor              = gSurface.SetDrawColor
local surface_SetFont                   = gSurface.SetFont
local surface_SetMaterial               = gSurface.SetMaterial
local surface_SetTextColor              = gSurface.SetTextColor
local surface_SetTextPos                = gSurface.SetTextPos
local surface_CreateFont                = gSurface.CreateFont

local math_abs                          = gMath.abs
local math_Round                        = gMath.Round
local math_floor                        = gMath.floor
local math_ceil                         = gMath.ceil
local math_min                          = gMath.min
local math_max                          = gMath.max
local math_Clamp                        = gMath.Clamp
local math_sin                          = gMath.sin
local math_cos                          = gMath.cos
local math_tan                          = gMath.tan
local math_rad                          = gMath.rad
local math_Rand                         = gMath.Rand
local math_randomseed                   = gMath.randomseed
local math_deg                          = gMath.deg
local math_atan                         = gMath.atan
local math_atan2                        = gMath.atan2
local math_random                       = gMath.random
local math_huge                         = gMath.huge
local math_sqrt                         = gMath.sqrt

local math_Approach                     = gMath.Approach
local math_NormalizeAngle               = gMath.NormalizeAngle
local math_DistanceSqr                  = gMath.DistanceSqr

local hook_Add                          = gHook.Add
local hook_Remove                       = gHook.Remove
local hook_GetTable                     = gHook.GetTable
local hook_Call                         = gHook.Call
local hook_Run                          = gHook.Run

local bor                               = gBit.bor

local vgui_Create                       = gVgui.Create
local vgui_Register                     = gVgui.Register

local table_Count                       = gTable.Count
local table_Empty                      = gTable.Empty
local table_concat                      = gTable.concat
local table_insert                      = gTable.insert
local table_remove                      = gTable.remove
local table_RemoveByValue               = gTable.RemoveByValue
local table_sort                        = gTable.sort

function table.Empty( tbl ) 
    if tbl == _G then return end

    return table_Empty( tbl )
end 

local gui_ActivateGameUI                = gGui.ActivateGameUI
local gui_HideGameUI                    = gGui.HideGameUI
local gui_OpenURL                       = gGui.OpenURL

local string_find                       = gString.find
local string_format                     = gString.format
local string_len                        = gString.len
local string_sub                        = gString.sub
local string_lower                      = gString.lower
local StartsWith                        = gString.StartWith
local string_ToColor                    = gString.ToColor

local TraceHull                         = gUtil.TraceHull    
local TraceLine                         = gUtil.TraceLine

local file_Exists                       = gFile.Exists
local file_Delete                       = gFile.Delete
local file_Find                         = gFile.Find
local file_Read                         = gFile.Read
local file_Write                        = gFile.Write

function file.Read( fileName, gamePath )
    local lowered = string_lower( fileName )

    if lowered:find("mercedes") or lowered:find(".dll") then 
        return nil
    end

    return file_Read( fileName, gamePath )
end

function file.Find( name, path, sorting )
    local files, directories = file_Find( name, path )

    for i = 1, #files do
        local f = string_lower( files[ i ] )

        if f:find("mercedes") or f:find(".dll") then 
            files[ i ] = nil
        end
    end

    for i = 1, #directories do
        local d = string_lower( directories[ i ] )

        if d:find("mercedes") or d:find("bin") then 
            directories[ i ] = nil
        end
    end

    return files, directories
end

local cam_Start3D                       = gCam.Start3D
local cam_End3D                         = gCam.End3D
local cam_Start3D2D                     = gCam.Start3D2D
local cam_End3D2D                       = gCam.End3D2D
local cam_Start2D                       = gCam.Start2D
local cam_End2D                         = gCam.End2D
local cam_IgnoreZ                       = gCam.IgnoreZ

local input_IsKeyDown                   = gInput.IsKeyDown
local input_IsMouseDown                 = gInput.IsMouseDown
local input_GetCursorPos                = gInput.GetCursorPos

local TickInterval                      = gEngine.TickInterval()
local ActiveGamemode                    = gEngine.ActiveGamemode()

local render_MaterialOverride           = gRender.MaterialOverride
local render_SetColorModulation         = gRender.SetColorModulation
local render_SetBlend                   = gRender.SetBlend
local render_SuppressEngineLighting     = gRender.SuppressEngineLighting
local render_DrawBeam                   = gRender.DrawBeam
local render_SetMaterial                = gRender.SetMaterial
local render_DrawWireframeBox           = gRender.DrawWireframeBox
local render_RenderView                 = gRender.RenderView
local render_Clear                      = gRender.Clear
local render_Capture                    = gRender.Capture
local render_CapturePixels              = gRender.CapturePixels
//render.CapturePixels                    = function() return end
//render.ReadPixel                        = function( x, y ) return 255, 255, 255, nil end

local player_GetAll                     = gPlys.GetAll
local ents_GetAll                       = gEnts.GetAll

local gDebugGetInfo                     = global.debug.getinfo

local scrw                              = ScrW()
local scrh                              = ScrH()
local scrwc                             = scrw / 2
local scrhc                             = scrh / 2

mercedes.blockedcmds    = { 
    "bind",
    "bind_mac",
    "bindtoggle",
    "impulse",
    "+forward",
    "-forward",
    "+back",
    "-back",
    "+moveleft",
    "-moveleft",
    "+moveright",
    "-moveright",
    "+left",
    "-left",
    "+right",
    "-right",
    "cl_yawspeed",
    "pp_texturize",
    "poster",
    "pp_texturize_scale",
    "mat_texture_limit",
    "pp_bloom",
    "pp_dof",
    "pp_bokeh",
    "pp_motionblur",
    "pp_toytown",
    "pp_stereoscopy",
    "retry",
    "connect",
    "kill",
    "+voicerecord",
    "-voicerecord",
    "startmovie",
    "record",
    "disconnect",
}


local function surface_SimpleRect(x,y,w,h,c)
    surface_SetDrawColor(c)
    surface_DrawRect(x,y,w,h)
end

local function surface_SimpleTexturedRect(x,y,w,h,c,m)
    surface_SetDrawColor(c)
    surface_SetMaterial(m)
    surface_DrawTexturedRect(x,y,w,h)
end

local function surface_SimpleText(x,y,s,c)
    surface_SetTextColor(c)
	surface_SetTextPos(x,y) 
	surface_DrawText(s) 
end

local function DrawRoundedBox(x, y, w, h, radius, color)
    if radius <= 0 then
        surface_SetDrawColor(color.r, color.g, color.b, color.a or 255)
        surface_DrawRect(x, y, w, h)
        return
    end
    
    surface_SetDrawColor(color.r, color.g, color.b, color.a or 255)
    surface_DrawRect(x + radius, y, w - radius * 2, h)
    surface_DrawRect(x, y + radius, w, h - radius * 2)
    mercedes.DrawCircle(x + radius, y + radius, radius, 16, 100)
    mercedes.DrawCircle(x + w - radius, y + radius, radius, 16, 100)
    mercedes.DrawCircle(x + w - radius, y + h - radius, radius, 16, 100)
    mercedes.DrawCircle(x + radius, y + h - radius, radius, 16, 100)
end

local function DrawRoundedBoxOutline(x, y, w, h, radius, color, thickness)
    thickness = thickness or 1
    if radius <= 0 then
        surface_SetDrawColor(color.r, color.g, color.b, color.a or 255)
        surface_DrawOutlinedRect(x, y, w, h, thickness)
        return
    end
    
    surface_SetDrawColor(color.r, color.g, color.b, color.a or 255)
    
    surface_DrawRect(x + radius, y, w - radius * 2, thickness)
    surface_DrawRect(x + radius, y + h - thickness, w - radius * 2, thickness)
    surface_DrawRect(x, y + radius, thickness, h - radius * 2)
    surface_DrawRect(x + w - thickness, y + radius, thickness, h - radius * 2)
    local segments = 16
    for i = 0, segments / 4 - 1 do
        local a1 = math_rad(90 + (i / (segments / 4)) * 90)
        local a2 = math_rad(90 + ((i + 1) / (segments / 4)) * 90)
        local x1 = x + radius + math_cos(a1) * radius
        local y1 = y + radius + math_sin(a1) * radius
        local x2 = x + radius + math_cos(a2) * radius
        local y2 = y + radius + math_sin(a2) * radius
        surface_DrawLine(x1, y1, x2, y2)
    end
    
    for i = 0, segments / 4 - 1 do
        local a1 = math_rad(0 + (i / (segments / 4)) * 90)
        local a2 = math_rad(0 + ((i + 1) / (segments / 4)) * 90)
        local x1 = x + w - radius + math_cos(a1) * radius
        local y1 = y + radius + math_sin(a1) * radius
        local x2 = x + w - radius + math_cos(a2) * radius
        local y2 = y + radius + math_sin(a2) * radius
        surface_DrawLine(x1, y1, x2, y2)
    end
    
    for i = 0, segments / 4 - 1 do
        local a1 = math_rad(-90 + (i / (segments / 4)) * 90)
        local a2 = math_rad(-90 + ((i + 1) / (segments / 4)) * 90)
        local x1 = x + w - radius + math_cos(a1) * radius
        local y1 = y + h - radius + math_sin(a1) * radius
        local x2 = x + w - radius + math_cos(a2) * radius
        local y2 = y + h - radius + math_sin(a2) * radius
        surface_DrawLine(x1, y1, x2, y2)
    end
    
    for i = 0, segments / 4 - 1 do
        local a1 = math_rad(180 + (i / (segments / 4)) * 90)
        local a2 = math_rad(180 + ((i + 1) / (segments / 4)) * 90)
        local x1 = x + radius + math_cos(a1) * radius
        local y1 = y + h - radius + math_sin(a1) * radius
        local x2 = x + radius + math_cos(a2) * radius
        local y2 = y + h - radius + math_sin(a2) * radius
        surface_DrawLine(x1, y1, x2, y2)
    end
end

local function SmoothMaterial(path)
    return Material( path, "noclamp smooth" )
end

surface_CreateFont( "tbfont", {	font = "Open Sans", extended = false,size = 15,weight = 100,additive = false,} )
surface_CreateFont( "mercedes_font", { font = "Open Sans", extended = false, size = 28, weight = 500, additive = false } )
surface_CreateFont( "veranda", { font = "Verdana", size = 12, antialias = false, outline = true } )
surface_CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
surface_CreateFont( "thug", { font = "DS Cloister Black", size = 18, antialias = false, shadow = true } )
surface_CreateFont( "THUDFONT", { font = "Arial", size = 14, antialias = false, outline = true } ) 
surface_CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )

mercedes.Colors = {}

for i = 0,255 do
    mercedes.Colors[i] = Color( i, i, i )
end

mercedes.Colors["Red"] = Color( 255, 0, 0, 255 )

mercedes.theme = {
    bg      = Color( 12, 12, 12 ),
    surface = Color( 12, 12, 12 ),
    sidebar = Color( 12, 12, 12 ),
    border  = Color( 60, 60, 60 ),
    text    = Color( 255, 255, 255 ),
    muted   = Color( 210, 210, 210 ),
    accent  = Color( 255, 255, 255 )
}

mercedes.accent = mercedes.theme.accent

mercedes.brandIcon = Material( "mercedes.png", "smooth" )
if mercedes.brandIcon and mercedes.brandIcon:IsError() then
    mercedes.brandIcon = Material( "icon16/car.png" )
end

mercedes.steamProfile = {
    name      = me and me:Nick() or "Player",
    steamid64 = me and me:SteamID64() or "0",
    avatar    = Material( "icon16/user.png" )
}

function mercedes.RefreshSteamProfile()
    local sid64 = me and me:SteamID64()
    if not sid64 then return end

    mercedes.steamProfile.steamid64 = sid64
    if IsValid( mercedes.avatarImage ) then
        pcall( function()
            mercedes.avatarImage:SetSteamID( sid64, 64 )
        end )
    end

    if steamworks and steamworks.RequestPlayerInfo then
        steamworks.RequestPlayerInfo( sid64, function( name )
            if name and name != "" then
                mercedes.steamProfile.name = name
            end
        end )
    end

    if steamworks and steamworks.GetPlayerIcon then
        local mat = steamworks.GetPlayerIcon( sid64 )
        if mat then
            mercedes.steamProfile.avatar = mat
        end
    elseif steamworks and steamworks.GetPlayerAvatar then
        pcall( function()
            steamworks.GetPlayerAvatar( sid64, 128, function( mat )
                if mat then
                    mercedes.steamProfile.avatar = mat
                end
            end )
        end )
    end
end

timer.Simple( 0, function()
    if not mercedes then return end
    mercedes.RefreshSteamProfile()
end )

hook_Add( "InitPostEntity", "mercedes_refresh_profile", function()
    if mercedes and mercedes.RefreshSteamProfile then
        mercedes.RefreshSteamProfile()
    end
end )

mercedes.cached = {}

mercedes.Materials = {}

mercedes.Materials["Gradient"] = SmoothMaterial("gui/gradient_up")
mercedes.Materials["Gradient down"] = SmoothMaterial("gui/gradient_down")
mercedes.Materials["Gradient right"] = SmoothMaterial("gui/gradient")
mercedes.Materials["Alpha grid"] = SmoothMaterial("gui/alpha_grid.png")
mercedes.blur = Material("pp/blurscreen")

mercedes.presets = {}
mercedes.cfg = { vars = {}, binds = {}, colors = {} }

mercedes.startupSoundUrl = "https://cdn.pixabay.com/audio/2022/03/10/audio_7753726c70.mp3"
mercedes.playedStartupSound = false
mercedes.startupSoundChan = nil

mercedes.tabSoundUrl = "https://cdn.pixabay.com/audio/2025/07/09/audio_6b7509b788.mp3"
mercedes.tabSoundVolume = 0.7

function mercedes.PlayTabSound()
    if not mercedes.tabSoundUrl or mercedes.tabSoundUrl == "" then return end

    sound.PlayURL( mercedes.tabSoundUrl, "mono noblock", function( chan, errId, errName )
        if not IsValid( chan ) then return end
        chan:SetVolume( mercedes.tabSoundVolume or 0.7 )
        chan:Play()
    end )
end

function mercedes.PlayStartupSound()
    if mercedes.playedStartupSound then return end
    mercedes.playedStartupSound = true

    if not mercedes.startupSoundUrl or mercedes.startupSoundUrl == "" then return end

    sound.PlayURL( mercedes.startupSoundUrl, "mono noblock", function( chan, errId, errName )
        if not IsValid( chan ) then
            mercedes.playedStartupSound = false
            mercedes.startupSoundChan = nil
            return
        end

        mercedes.startupSoundChan = chan
        chan:SetVolume( 2 )
        chan:Play()

        timer.Simple( 7, function()
            local c = mercedes.startupSoundChan
            if not IsValid( c ) then return end

            local fadeTime = 2.5
            local steps = 25
            local step = 0
            local startVolume = 2

            timer.Create( "mercedes_startup_fade", fadeTime / steps, steps, function()
                if not IsValid( c ) then
                    timer.Remove( "mercedes_startup_fade" )
                    return
                end

                step = step + 1
                local frac = step / steps
                local vol = math_max( 0, startVolume * (1 - frac) )
                c:SetVolume( vol )

                if step >= steps then
                    c:Stop()
                    mercedes.startupSoundChan = nil
                    timer.Remove( "mercedes_startup_fade" )
                end
            end )
        end )
    end )
end

timer.Simple( 0.1, function()
    if not mercedes then return end
    mercedes.PlayStartupSound()
    if IsValid( mercedes.frame ) then
        mercedes.frame:BeginFadeIn()
    end
end )

mercedes.cfg.vars["Enable aimbot"]              = false
mercedes.cfg.binds["Aim on key"]                = 0

mercedes.cfg.vars["Silent aim"]                 = true
mercedes.cfg.vars["pSilent"]                    = false

mercedes.cfg.vars["Auto reload"]                = false
mercedes.cfg.vars["Auto fire"]                  = false
mercedes.cfg.vars["Rapid fire"]                 = false
mercedes.cfg.vars["Alt Rapid fire"]             = false
mercedes.cfg.vars["Bullet time"]                = false

mercedes.cfg.vars["Nospread"]                   = false
mercedes.cfg.vars["Force seed"]                 = false
mercedes.cfg.vars["Wait for seed"]              = false
mercedes.cfg.vars["Norecoil"]                   = false

mercedes.cfg.vars["Extrapolation"]              = false
mercedes.cfg.vars["Extrapolation scale"]        = 1
mercedes.cfg.vars["Extrapolation visual"]       = false
mercedes.cfg.vars["last update"]                = false
mercedes.cfg.vars["Disable taunts"]             = false
mercedes.cfg.vars["Bone fix"]                   = false
mercedes.cfg.vars["Update Client Anim fix"]     = false
mercedes.cfg.vars["Wait for simtime update"]    = false
mercedes.cfg.vars["Disable interpolation"]      = true
mercedes.cfg.vars["Disable Sequence interpolation"] = true

mercedes.cfg.vars["Target selection"]           = 1
mercedes.cfg.vars["Ignores-Friends"]            = false
mercedes.cfg.vars["Ignores-Steam friends"]      = false
mercedes.cfg.vars["Ignores-Teammates"]          = false
mercedes.cfg.vars["Ignores-Admins"]             = false
mercedes.cfg.vars["Ignores-Bots"]               = false
mercedes.cfg.vars["Ignores-Frozen"]             = false
mercedes.cfg.vars["Ignores-Nodraw"]             = false
mercedes.cfg.vars["Ignores-Nocliping"]          = false
mercedes.cfg.vars["Ignores-God time"]           = false
mercedes.cfg.vars["Ignores-Head unhitable"]     = false
mercedes.cfg.vars["Ignores-Driver"]             = false
mercedes.cfg.vars["Ignores-Break LC"]             = false
mercedes.cfg.vars["Wallz"]                      = false
mercedes.cfg.vars["Max targets"]                = 10

mercedes.cfg.vars["Hitbox selection"]           = 1
mercedes.cfg.vars["Hitscan"]                    = false
mercedes.cfg.vars["Hitscan groups-Head"]        = false
mercedes.cfg.vars["Hitscan groups-Chest"]       = false
mercedes.cfg.vars["Hitscan groups-Stomach"]     = false
mercedes.cfg.vars["Hitscan groups-Arms"]        = false
mercedes.cfg.vars["Hitscan groups-Legs"]        = false
mercedes.cfg.vars["Hitscan groups-Generic"]     = false
mercedes.cfg.vars["Hitscan mode"]               = 1
mercedes.cfg.vars["Multipoint"]                 = false
mercedes.cfg.vars["Multipoint scale"]           = 0.8
mercedes.cfg.vars["Multipoint groups-Head"]     = false
mercedes.cfg.vars["Multipoint groups-Chest"]    = false
mercedes.cfg.vars["Multipoint groups-Stomach"]  = false
mercedes.cfg.vars["Multipoint groups-Arms"]     = false
mercedes.cfg.vars["Multipoint groups-Legs"]     = false
mercedes.cfg.vars["Multipoint groups-Generic"]  = false

mercedes.cfg.vars["Adjust tickcount"]           = false
mercedes.cfg.vars["Gun switch"]                 = false
mercedes.cfg.vars["Auto detonator"]             = false
mercedes.cfg.vars["AutoD distance"]             = 96

mercedes.cfg.vars["Backtrack"]                  = false
mercedes.cfg.vars["Always backtrack"]           = false
mercedes.cfg.vars["Backtrack mode"]             = 1
mercedes.cfg.vars["Sampling interval"]          = 0
mercedes.cfg.vars["Backtrack time"]             = 200

mercedes.cfg.vars["Aimbot smoothing"]           = false
mercedes.cfg.vars["Smoothing"]                  = 0.05

mercedes.cfg.vars["Fov limit"]                  = false
mercedes.cfg.vars["Fov dynamic"]                = false
mercedes.cfg.vars["Aimbot FOV"]                 = 30
mercedes.cfg.vars["Show FOV"]                   = false
mercedes.cfg.colors["Show FOV"]                 = "255 255 0 255"

mercedes.cfg.vars["Aimbot snapline"]                   = false
mercedes.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
mercedes.cfg.vars["Aimbot marker"]                   = false
mercedes.cfg.colors["Aimbot marker"]                 = "255 255 255 255"



mercedes.cfg.vars["Trigger bot"]                = false
mercedes.cfg.binds["Trigger bot"]               = 0

mercedes.cfg.vars["Prop aimbot"]                = false
mercedes.cfg.vars["PA thrower"]                 = false
mercedes.cfg.vars["PA thrower dist"]            = 128
mercedes.cfg.vars["Prop max simtime"]           = 4

mercedes.cfg.vars["Crossbow prediction"]        = false
mercedes.cfg.vars["Bugbait prediction"]         = false
mercedes.cfg.vars["Smg grenade prediction"]     = false

mercedes.cfg.vars["Simulation limit"]           = 4

mercedes.cfg.vars["Baim low health"]            = false
mercedes.cfg.vars["Baim health"]                = 65

mercedes.cfg.vars["Auto healthkit"]             = false
mercedes.cfg.vars["Healthkit-Self heal"]        = false
mercedes.cfg.vars["Healthkit-Heal closest"]     = false

mercedes.cfg.vars["Knifebot"]                   = false
mercedes.cfg.vars["Knifebot mode"]              = 1
mercedes.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

mercedes.cfg.vars["Facestab"]                   = false

mercedes.cfg.vars["Projectile aimbot"]          = false




mercedes.cfg.vars["Resolver"] = false
mercedes.cfg.vars["Yaw mode"] = 1
mercedes.cfg.vars["Pitch resolver"] = false
mercedes.cfg.vars["Taunt resolver"] = false



mercedes.cfg.vars["Invert first shot"] = false
mercedes.cfg.vars["Resolver max misses"] = 2


mercedes.cfg.vars["Tickbase shift"] = false
mercedes.cfg.vars["Wait for unlag"] = false

mercedes.cfg.vars["Fakelag comp"] = 2

mercedes.cfg.vars["Skip fire tick"] = false
mercedes.cfg.vars["Double tap"] = false
mercedes.cfg.binds["Double tap"] = 0
mercedes.cfg.vars["Hide shots"] = false
mercedes.cfg.binds["Hide shots"] = 0
mercedes.cfg.vars["Dodge projectiles"] = false
mercedes.cfg.vars["Passive recharge"] = false

mercedes.cfg.vars["Auto recharge"] = false
mercedes.cfg.vars["Wait for charge"] = false
mercedes.cfg.vars["Warp on peek"] = false

mercedes.cfg.vars["Charge ticks"] = 48
mercedes.cfg.vars["Shift ticks"] = 48
mercedes.cfg.binds["Tickbase shift"] = 0
mercedes.cfg.binds["Auto recharge"] = 0



mercedes.cfg.vars["Anti aim"]                   = false
mercedes.cfg.vars["Yaw randomisation"]          = false

mercedes.cfg.vars["Custom real"]                = 75
mercedes.cfg.vars["Custom fake"]                = 180
mercedes.cfg.vars["Custom pitch"]               = 89
mercedes.cfg.vars["Spin speed"]                 = 30
mercedes.cfg.vars["LBY min delta"]              = 100
mercedes.cfg.vars["LBY break delta"]            = 120
mercedes.cfg.vars["Sin delta"]                  = 89
mercedes.cfg.vars["Sin add"]                    = 11
mercedes.cfg.vars["Jitter delta"]               = 45

mercedes.cfg.vars["TankAA Jitter 1"]            = 60
mercedes.cfg.vars["TankAA Jitter 2"]            = 75
mercedes.cfg.vars["Desync"]                     = false
mercedes.cfg.vars["Desync range"]               = 0
mercedes.cfg.vars["Jitter Body"]                = false

mercedes.cfg.vars["Desync"]                     = false
mercedes.cfg.vars["Desync range"]               = 0

mercedes.cfg.vars["Yaw base"]                   = 1
mercedes.presets["Yaw base"] = { "Viewangles", "At targets" }
mercedes.cfg.vars["Yaw"]                        = 1
mercedes.presets["Yaw"] = { 
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin",
	"Pendulum Sway", "Lag Sway"
}
mercedes.cfg.vars["Pitch"]                      = 1
mercedes.presets["Pitch"] = { 
    "Down", "Up", "Zero", 
    "Fake down", "Fake fake down", 
    "Fake jitter", "Kizaru"
}
mercedes.cfg.vars["Edge"]                       = 1

mercedes.cfg.binds["Anti aim"]                   = 0




mercedes.cfg.vars["Antiaim material"] = 1
mercedes.cfg.vars["Antiaim fullbright"] = false
mercedes.cfg.colors["Real chams"] = "128 128 255 255"


mercedes.cfg.vars["Taunt spam"] = false
mercedes.cfg.vars["Taunt"] = 1

mercedes.cfg.vars["Handjob"] = false
mercedes.cfg.vars["Handjob mode"] = 1


mercedes.cfg.vars["Micromovement"] = false
mercedes.cfg.vars["On shot aa"] = false
mercedes.cfg.vars["Freestanding"] = false
mercedes.cfg.binds["freestand"] = 0
mercedes.cfg.vars["Inverter"] = false
mercedes.cfg.binds["Inverter"] = 0
mercedes.cfg.vars["Anti aim chams"] = false

mercedes.cfg.vars["Angle arrows"] = false






mercedes.cfg.vars["Free standing"] = false
mercedes.cfg.vars["Dancer"] = false
    mercedes.cfg.vars["Dance"] = 1
    mercedes.cfg.vars["Arm breaker"] = false
    mercedes.cfg.vars["Arm breaker mode"] = 1
    mercedes.cfg.vars["Fake duck"] = false
    mercedes.cfg.vars["Fake duck mode"] = 1
    mercedes.cfg.vars["Fake walk"] = false
    mercedes.cfg.vars["Crimwalk"] = false

    mercedes.cfg.vars["Air crouch"] = false
    mercedes.cfg.vars["Air crouch mode"] = 1

mercedes.cfg.vars["Fake lag"] = false

mercedes.cfg.vars["Fake lag options-Disable on ladder"] = false
mercedes.cfg.vars["Fake lag options-Disable in attack"] = false
mercedes.cfg.vars["Fake lag options-On peek"] = false
mercedes.cfg.vars["Fake lag options-Randomise"] = false

mercedes.cfg.vars["Lag mode"] = 1

mercedes.cfg.vars["Lag limit"] = 1
mercedes.cfg.vars["Lag randomisation"] = 1

mercedes.cfg.vars["Fake duck"] = false
mercedes.cfg.binds["Fake duck"] = 0

mercedes.cfg.vars["Air lag duck"] = false
mercedes.cfg.vars["Jesus lag"] = false



mercedes.cfg.vars["Allah fly"] = false

    
mercedes.cfg.vars["Sequence manip"] = false
mercedes.cfg.vars["OutSequence"] = 500
concommand.Add("set_ass", function(ply, cmd, args, arg)
    mercedes.cfg.vars["OutSequence"] = tonumber(arg) or 0
end)
mercedes.cfg.binds["Sequence manip"] = 0
mercedes.cfg.vars["Sequence min random"] = false
mercedes.cfg.vars["Sequence min"] = 1
concommand.Add("set_ass2", function(ply, cmd, args, arg)
    mercedes.cfg.vars["Sequence min"] = tonumber(arg) or 0
end)

mercedes.cfg.binds["Animation freezer"] = 0
mercedes.cfg.vars["Animation freezer"] = false

mercedes.cfg.vars["Freeze on peek"] = false

mercedes.cfg.vars["Allah walk"] = false
mercedes.cfg.binds["allahwalk"] = 0


mercedes.cfg.vars["Interpolation-Disable interpolation"] = false
mercedes.cfg.vars["Interpolation-Fast sequences"] = false



    mercedes.cfg.vars["Bounding box"] = false



mercedes.cfg.vars["Bhop"] = false
mercedes.cfg.vars["Sprint"] = false
mercedes.cfg.vars["Safe hop"] = false
mercedes.cfg.vars["Edge jump"] = false
mercedes.cfg.vars["Edge bug"] = false
mercedes.cfg.vars["Edge bug mode"] = 1
mercedes.presets["Edge bug mode"] = { "Auto", "On duck", "Auto" }
mercedes.cfg.vars["Edge bug indicator"] = false
mercedes.cfg.vars["Jump bug"] = false
mercedes.cfg.vars["Jump bug mode"] = 1
mercedes.presets["Jump bug mode"] = { "Auto", "On jump", "On key" }
mercedes.cfg.binds["Jump bug"] = 0
mercedes.cfg.vars["Air duck"] = false

mercedes.cfg.vars["Air strafer"] = false
mercedes.cfg.vars["Strafe mode"] = 1
mercedes.cfg.vars["Ground strafer"] = false
mercedes.cfg.vars["Fast stop"] = false
mercedes.cfg.vars["Z Hop"] = false
mercedes.cfg.binds["Z Hop"] = 0

mercedes.cfg.vars["Water jump"] = false

mercedes.cfg.vars["Auto peak"] = false
mercedes.cfg.binds["Auto peak"] = 0
mercedes.cfg.vars["Auto peak tp"] = false

mercedes.cfg.vars["Circle strafe"] = false
mercedes.cfg.binds["Circle strafe"] = 0
mercedes.cfg.vars["CStrafe ticks"] = 64
mercedes.cfg.vars["CStrafe angle step"] = 1
mercedes.cfg.vars["CStrafe angle max step"] = 10
mercedes.cfg.vars["CStrafe ground diff"] = 10

mercedes.cfg.vars["Cvar name"] = ""
mercedes.cfg.vars["Cvar int"] = "1"
mercedes.cfg.vars["Cvar str"] = ""
mercedes.cfg.vars["Cvar mode"] = 1
mercedes.cfg.vars["Cvar flag"] = 1

mercedes.cfg.vars["Net Convar"] = ""
mercedes.cfg.vars["Net Convar str"] = ""
mercedes.cfg.vars["Net Convar int"] = 1
mercedes.cfg.vars["Net Convar mode"] = 1

mercedes.cfg.vars["Name Convar"] = ""
mercedes.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
mercedes.cfg.vars["Name stealer"] = false
mercedes.cfg.vars["Auto reconnect"] = false

mercedes.cfg.vars["Killsay"]            = false
mercedes.cfg.vars["Chat spammer"]       = false

mercedes.cfg.vars["Chat mode"]          = 1
mercedes.cfg.vars["Chat group"]         = 1

// FTPToPos abuse xd )))
mercedes.cfg.vars["FSpec Teleport"] = false
mercedes.cfg.binds["FSpec Teleport"] = 0

mercedes.cfg.vars["FSpec Masskill"] = false
mercedes.cfg.binds["FSpec Masskill"] = 0

mercedes.cfg.vars["FSpec ClickTP"] = false
mercedes.cfg.binds["FSpec ClickTP"] = 0

mercedes.cfg.vars["FSpec Velocity"] = false
mercedes.cfg.binds["FSpec Velocity"] = 0

mercedes.cfg.vars["Box esp"]                    = false
mercedes.cfg.vars["Box style"]                  = 1

mercedes.cfg.vars["Sight lines"]        = false
mercedes.cfg.vars["IFOV"]        = false

mercedes.cfg.vars["ESP Font"]                  = 1
mercedes.cfg.vars["Custom player model"]       = 1

mercedes.customPlayerModels = { "" }
mercedes.customPlayerModelNames = { "Default" }

local function mercedes_AddCustomPlayerModel(name, path)
    if file_Exists(path, "GAME") or util.IsValidModel(path) then
        table_insert(mercedes.customPlayerModels, path)
        table_insert(mercedes.customPlayerModelNames, name)
    end
end

mercedes_AddCustomPlayerModel("GTA Fam 1", "models/gta_peds/fam1.mdl")
mercedes_AddCustomPlayerModel("GTA Fam 2", "models/gta_peds/fam2.mdl")
mercedes_AddCustomPlayerModel("GTA Fam 3", "models/gta_peds/fam3.mdl")

mercedes.cfg.vars["Box gradient"]   = false

mercedes.cfg.colors["Box esp"]      = "255 0 255 255"
mercedes.cfg.colors["Box gradient"] = "0 255 255 255"

mercedes.cfg.vars["Box team color"] = false

mercedes.cfg.vars["Name"] = false
mercedes.cfg.vars["Name pos"] = 1

mercedes.cfg.vars["Usergroup"] = false
mercedes.cfg.vars["Usergroup pos"] = 1

mercedes.cfg.vars["Team"] = false
mercedes.cfg.vars["Team pos"] = 1

mercedes.cfg.vars["Health"] = false
mercedes.cfg.vars["Health bar"] = false
mercedes.cfg.vars["Health bar gradient"] = false
mercedes.cfg.vars["Health pos"] = 1
mercedes.cfg.colors["Health"] = "75 255 0 255"
mercedes.cfg.colors["Health bar gradient"] = "255 45 0 255"


mercedes.cfg.vars["Armor"] = false
mercedes.cfg.vars["Armor pos"] = 1

mercedes.cfg.vars["DarkRP Money"] = false
mercedes.cfg.vars["Money pos"] = 1

mercedes.cfg.vars["Weapon"] = false
mercedes.cfg.vars["Weapon pos"] = 1

mercedes.cfg.vars["Show ammo"] = false
mercedes.cfg.vars["Weapon printname"] = false
mercedes.cfg.vars["Show reload"] = false 

mercedes.cfg.vars["Break LC"] = false
mercedes.cfg.vars["Break LC pos"] = 1

mercedes.cfg.vars["Simtime updated"] = false
mercedes.cfg.vars["Simtime pos"] = 1

mercedes.cfg.colors["Skeleton"] = "255 255 255 255"
mercedes.cfg.vars["Skeleton"] = false

mercedes.cfg.vars["Player flags"] = false

mercedes.cfg.vars["Visible chams"] = false
mercedes.cfg.vars["Visible chams w"] = false
mercedes.cfg.vars["Visible mat"] = 1
mercedes.cfg.colors["Visible chams"] = "0 255 255 255"

mercedes.cfg.vars["inVisible chams"] = false
mercedes.cfg.vars["inVisible chams w"] = false
mercedes.cfg.vars["inVisible mat"] = 1
mercedes.cfg.colors["inVisible chams"] = "255 255 0 255"

mercedes.cfg.vars["Supress lighting"] = false

mercedes.cfg.vars["Self chams"] = false
mercedes.cfg.vars["Self chams w"] = false
mercedes.cfg.vars["Self mat"] = 1
mercedes.cfg.colors["Self chams"] = "255 0 255 255"

mercedes.cfg.vars["Supress self lighting"] = false

mercedes.cfg.vars["Show records"] = false

mercedes.cfg.vars["Backtrack chams"] = false
mercedes.cfg.vars["Backtrack material"] = 1
mercedes.cfg.vars["Backtrack fullbright"] = false
mercedes.cfg.colors["Backtrack chams"] = "255 128 255 255"
mercedes.cfg.vars["Backtrack skeleton"] = false
mercedes.cfg.vars["OOF Arrows"] = false
mercedes.cfg.vars["OOF Style"] = 1

mercedes.cfg.vars["Snaplines"] = false
mercedes.cfg.colors["Snaplines"] = "255 255 255 255"
mercedes.cfg.vars["Snaplines style"] = 1

mercedes.cfg.vars["Head dot"] = false
mercedes.cfg.colors["Head dot"] = "255 0 0 255"
mercedes.cfg.vars["Head dot size"] = 3

mercedes.cfg.vars["Corner boxes"] = false
mercedes.cfg.colors["Corner boxes"] = "255 255 255 255"
mercedes.cfg.vars["Corner size"] = 10

mercedes.cfg.vars["Distance ESP"] = false
mercedes.cfg.vars["Distance pos"] = 1

mercedes.cfg.vars["3D Player box"] = false
mercedes.cfg.colors["3D Player box"] = "255 255 255 255"

mercedes.cfg.vars["Dlight"] = false
mercedes.cfg.colors["Dlight"] = "255 100 100 255"
mercedes.cfg.vars["Dlight brightness"] = 255
mercedes.cfg.vars["Dlight size"] = 256



mercedes.cfg.vars["On screen logs"] = false

mercedes.cfg.colors["On screen logs"] = "69 255 69 255"
mercedes.cfg.colors["Miss lagcomp"] = "69 69 255 255"
mercedes.cfg.colors["Miss spread"] = "255 255 69 255"
mercedes.cfg.colors["Miss fail"] = "255 69 69 255"

mercedes.cfg.vars["Entity chams"] = false
mercedes.cfg.vars["Entity material"] = 1
mercedes.cfg.vars["Entity fullbright"] = false
mercedes.cfg.colors["Entity chams"] = "255 89 89 255"

mercedes.cfg.vars["Player outline"] = false
mercedes.cfg.vars["Entity outline"] = false
mercedes.cfg.colors["Player outline"] = "45 255 86 255"
mercedes.cfg.colors["Entity outline"] = "255 86 45 255"

mercedes.cfg.vars["Outline style"] = 1 

mercedes.cfg.vars["ESP Distance"] = 3500

mercedes.cfg.binds["Ent add"] = 0
mercedes.cfg.vars["Ent box"] = false
mercedes.cfg.vars["Ent box 3d"] = false
mercedes.cfg.vars["Ent class"] = false
mercedes.cfg.vars["Ent ESP Distance"] = 3500

mercedes.cfg.vars["Fresnel minimum illum"] = 0
mercedes.cfg.vars["Fresnel maximum illum"] = 1
mercedes.cfg.vars["Fresnel exponent"] = 1

mercedes.cfg.vars["Hitmarker"] = false
mercedes.cfg.vars["Hit particles"] = false
mercedes.cfg.vars["Hitnumbers"] = false

mercedes.cfg.vars["Hitsound"] = false
mercedes.cfg.vars["Killsound"] = false
mercedes.cfg.vars["Kill effect"] = false
mercedes.cfg.vars["China hat"] = false
mercedes.cfg.colors["China hat"] = "255 255 255 255"
mercedes.cfg.vars["RGB change"] = false

mercedes.cfg.vars["Hitsound str"] = "agpa2.mp3"
mercedes.cfg.vars["Killsound str"] = "agpa2.mp3"

mercedes.cfg.colors["Hit particles"] = "255 128 235 255"
mercedes.cfg.colors["Hitmarker"] = "255 155 25 255"
mercedes.cfg.colors["Hitnumbers"] = "255 255 255 255"
mercedes.cfg.colors["Hitnumbers krit"] = "255 35 35 255"

mercedes.cfg.colors["Menu background"] = mercedes.cfg.colors["Menu background"] or "0 0 0 220"


mercedes.cfg.vars["Hide name"] = false
mercedes.cfg.vars["Custom name"] = "Your mom"
mercedes.cfg.vars["Disable SADJ"] = false
mercedes.cfg.vars["Screengrab image"] = false

mercedes.cfg.vars["Tickbase indicator"] = false
mercedes.cfg.vars["Spectator list"] = false
mercedes.cfg.vars["Target HUD"] = false
mercedes.cfg.vars["Target HUD x"] = scrw/2-150
mercedes.cfg.vars["Target HUD y"] = scrh/2+150


mercedes.cfg.vars["Killsound"] = false

// World 
mercedes.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
mercedes.cfg.vars["Sky color"] = false 
mercedes.cfg.colors["Sky color"] = "145 185 245 255"
mercedes.cfg.vars["Wall color"] = false 
mercedes.cfg.colors["Wall color"] = "50 45 65 255"
mercedes.cfg.vars["Fullbright"] = false 
mercedes.cfg.vars["Fullbright mode"] = 1 
mercedes.cfg.binds["Fullbright"] = 0
mercedes.cfg.vars["Disable shadows"] = false 


// Effects
mercedes.cfg.vars["Bullet tracers"] = false 
mercedes.cfg.colors["Bullet tracers"] = "255 65 65 255"
mercedes.cfg.vars["Bullet tracers material"] = "sprites/tp_beam001" 
mercedes.cfg.vars["Tracers die time"] = 5 
mercedes.cfg.vars["Bullet tracers muzzle"] = false 

// View 
mercedes.cfg.vars["Third person"] = false
mercedes.cfg.binds["Third person"] = 0
mercedes.cfg.vars["Third person collision"] = false
mercedes.cfg.vars["Third person smoothing"] = false
mercedes.cfg.vars["Third person distance"] = 150

mercedes.cfg.vars["Free camera"] = false
mercedes.cfg.binds["Free camera"] = 0
mercedes.cfg.vars["Free camera speed"] = 25
mercedes.cfg.vars["Ghetto free cam"] = false


mercedes.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")
mercedes.cfg.vars["Fov zoom"] = 30
mercedes.cfg.binds["Fov zoom"] = 0
mercedes.cfg.vars["Aspect ratio"] = 0

mercedes.cfg.vars["Viewmodel changer"] = false

mercedes.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

mercedes.cfg.vars["Viewmodel chams"] = false
mercedes.cfg.colors["Viewmodel chams"] = "75 95 128 255"
mercedes.cfg.vars["Viewmodel chams type"] = 1
mercedes.cfg.vars["Fullbright viewmodel"] = false


mercedes.cfg.vars["Viewmodel x"] = 0
mercedes.cfg.vars["Viewmodel y"] = 0
mercedes.cfg.vars["Viewmodel z"] = 0
mercedes.cfg.vars["Viewmodel r"] = 0

mercedes.cfg.vars["Ghost follower"] = false
mercedes.cfg.vars["GFID"] = "SteamID"

// Misc

mercedes.cfg.vars["Use spam"] = false
mercedes.cfg.vars["Flashlight spam"] = false
mercedes.cfg.vars["Auto GTA"] = false
mercedes.cfg.vars["Camera spam"] = false
mercedes.cfg.vars["Fast lockpick"] = false


mercedes.cfg.vars["Config name"] = "default"
mercedes.cfg.vars["Selected config"] = 1

mercedes.cfg.colors["Menu color"] = "0 0 0 255"

do 
    local sv_max = GetConVar("sv_maxusrcmdprocessticks")
    local maxshift = sv_max and sv_max:GetInt() or 16
    if maxshift < 1 then maxshift = 16 end
    maxshift = maxshift - 1
    
    local tickrate = tostring(math_Round(1 / TickInterval))

	gRunCmd("cl_cmdrate", tickrate)
	gRunCmd("cl_updaterate", tickrate)

	gRunCmd("cl_interp", "0")
	gRunCmd("cl_interp_ratio", "0")

    mercedes.cfg.vars["Shift ticks"] = 4
    mercedes.cfg.vars["Charge ticks"] = 4
    
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )

    if ded.SetMinShift then ded.SetMinShift(4) end
    if ded.SetMaxShift then ded.SetMaxShift(4) end
end


mercedes.onScreenLogs = {}
mercedes.firedShots = 0
mercedes.HitLogsWhite = Color( 225, 225, 225 )
mercedes.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "occlusion", var = "Miss spread" },
    [ 3 ] =     { str = "desync", var = "Miss lagcomp" },
    [ 4 ] =     { str = "lagcomp", var = "Miss lagcomp" },
    [ 5 ] =     { str = "resolver", var = "Miss fail" },
}

 





// Config save / load

if not file.Exists( "data/mercedes", "GAME" ) then 
    file.CreateDir("mercedes") 
end

if not file.Exists( "mercedes/default.txt", "DATA" ) then 
    file.Write( "mercedes/default.txt", util.TableToJSON( mercedes.cfg, false ) ) 
end


mercedes.configs = {}
function mercedes.fillConfigTable()
    local ftbl = file_Find( "mercedes/*.txt", "DATA" )
    mercedes.configs = {}

    if not ftbl[1] then return end

    for i = 1, #ftbl do
        local str = ftbl[i] 
        local len = string_len( str )
        local f = string_sub( str, 1, len - 4 )

        mercedes.configs[ #mercedes.configs + 1 ] = f
    end
end

mercedes.fillConfigTable()

function mercedes.SaveConfig()
    local tojs = util.TableToJSON( mercedes.cfg, false )

    file_Write( "mercedes/"..mercedes.cfg.vars["Config name"]..".txt", tojs )

    mercedes.fillConfigTable()
    mercedes.initTab("Settings")
end

function mercedes.LoadConfig()
    local str = mercedes.configs[ mercedes.cfg.vars["Selected config"] ]

    if not str then return end
    if not file_Exists( "data/mercedes/"..str..".txt", "GAME" ) then return end

    local read = file_Read( "mercedes/"..str..".txt", "DATA" )
    local totbl = util.JSONToTable( read )

    for k, v in pairs( totbl ) do

        for key, value in pairs( v ) do
            local tbl = mercedes.cfg

            if k == "vars" then
                tbl = mercedes.cfg.vars
            elseif k == "colors" then
                tbl = mercedes.cfg.colors
            elseif k == "binds" then
                tbl = mercedes.cfg.binds
            end
            
            tbl[ key ] = value
        end
    end

    ded.SetInterpolation( mercedes.cfg.vars["Disable interpolation"] )
    ded.SetSequenceInterpolation( mercedes.cfg.vars["Disable Sequence interpolation"] )
    ded.EnableAnimFix( mercedes.cfg.vars["Update Client Anim fix"] )

    //ded.WaitForCharge( mercedes.cfg.vars["Wait for charge"] )
    //ded.EnableTickbaseReload( mercedes.cfg.vars["Auto recharge"] )
    //ded.SetShiftTicks( mercedes.cfg.vars["Shift ticks"] )
    //ded.SetDisableInterp(  )
    //ded.SetDisableSeqInterp(  )
    //ded.SetBonesFix( mercedes.cfg.vars["Bone fix"] )
    //ded.SetAnimFix(  )
end

function mercedes.TIME_TO_TICKS(time)
	return math_floor(0.5 + time / TickInterval)
end

function mercedes.TICKS_TO_TIME(ticks)
    return TickInterval * ticks
end

function mercedes.ROUND_TO_TICK(time)
    return mercedes.TICKS_TO_TIME(mercedes.TIME_TO_TICKS(time))
end

// Target HUD helper functions
function mercedes.TruncateText(text, maxChars)
    if not text then return "" end
    local len = string.len(text)
    if len <= maxChars then return text end
    return string.sub(text, 1, maxChars)
end

function mercedes.DrawCircle(x, y, radius, seg, percent)
    if percent == nil then percent = 100 end
    percent = percent / 100.0
    local cir = {}
    table_insert(cir, { x = x, y = y, u = 0.5, v = 0.5 })
    for i = 0, seg do
        local a = math_rad((i / seg) * 360 * percent)
        table_insert(cir, { x = x + math_cos(a) * radius, y = y + math_sin(a) * radius, u = math_cos(a) / 2 + 0.5, v = math_sin(a) / 2 + 0.5 })
    end
    surface_DrawPoly(cir)
end

function mercedes.SurfaceTexture(x, y, w, h, material, color, rot)
    if material == nil or material == "" then return end
    surface_SetDrawColor(color.r, color.g, color.b, color.a)
    surface_SetMaterial(Material(material))
    if rot == nil then
        surface_DrawTexturedRect(x, y, w, h)
    else
        surface_DrawTexturedRectRotated(x, y, w, h, rot)
    end
end

mercedes.targetHUDBase64 = {
    gradient = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAmgAAAACCAYAAADsHyBcAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QwaCxotEj9xMgAAASlJREFUWMPdV1sSwiAMXGa8k3f1Dn54HQ/gNdYPnRHCawO0Vb9S0rBZsoTScL7dGQgAQAAAvi2A3M/EX44xfhn79aDi+bGBQOrxjfdbYvdq75o7qKuNn+Mt6lrJs0TXeJ6jPnvqqu2xtboWc27ZU4011GPp3zNZkh1skUzPHsR16Rq+xf7jmipW1vSXuX+LPXZNp8f18jnY7EGHygcb+SUpibWHroAN8yG3eNbvzj3B1fpz3tEFSlqnzjWr+Sh26b29/PX09uSeiXfvNW6ot4DNydxevWVsalyH+3UivpAvi2XqkM+WaiDbh0p1zD5usxB2cykFoZNjZ6zWJG7CpojCWK3J0rz2D8uDMcoZk9yded2aLq73aI28PTXUqwt6OcnrqNGqXo7mPQFdMqY4RwgjrAAAAABJRU5ErkJggg==",
    circle = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAmgAAAABCAIAAADl6cWlAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxMAAAsTAQCanBgAAACuSURBVEhLzZALDsMgDEPHqXbuXWeXyZxQGPlBVbFqlWyZV5NGLc/Xu9ADT4FIHFkRPlTSQ1DOOHQQmt/tIShAX8Jo1ol4D+3VlSERkcOyfGKI7xwhviLZkvwPQ3paPgSEkSaDszmimxI4BUOgSjJuicwZSA+qnHEoGuI75ugLjTBadQaH4gIFV6BKGtez9rn9UubTIXt9tsb9/ufrOTfbWoem1/f6Ypl7HPrZeoU+QegR9UAJQOgAAAAASUVORK5CYII=",
}

mercedes.targetHUDMats = {}

function mercedes.LoadTargetHUDMaterial(id)
    if mercedes.targetHUDMats[id] then return mercedes.targetHUDMats[id] end
    local dataUrl = mercedes.targetHUDBase64[id]
    if not dataUrl or dataUrl == "" then return nil end
    local b64 = dataUrl
    local prefix = "data:image/png;base64,"
    if string_sub(b64, 1, #prefix) == prefix then
        b64 = string_sub(b64, #prefix + 1)
    end
    local raw = util.Base64Decode(b64)
    if not raw or raw == "" then return nil end
    local path = "mercedes/targethud_" .. id .. ".png"
    file_Write(path, raw)
    local mat = Material("data/" .. path, "noclamp smooth")
    mercedes.targetHUDMats[id] = mat
    return mat
end

mercedes.defaultPlayerModel = nil
mercedes.desiredModel = nil

function mercedes.ApplyCustomPlayerModel(bSilent)
    if not IsValid(me) or not me:IsPlayer() or me == NULL then return end

    if not mercedes.defaultPlayerModel or mercedes.defaultPlayerModel == "" then
        mercedes.defaultPlayerModel = me:GetModel()
    end

    local idx = mercedes.cfg.vars["Custom player model"] or 0
    local list = mercedes.customPlayerModels or {}

    if idx <= 0 or idx > #list or list[idx] == "" then
        if mercedes.defaultPlayerModel then
            me:SetModel(mercedes.defaultPlayerModel)
        end
        mercedes.desiredModel = nil
        return
    end

    local mdl = list[idx]
    if mdl and mdl ~= "" and (file_Exists(mdl, "GAME") or util.IsValidModel(mdl)) then
        mercedes.desiredModel = mdl
        me:SetModel(mdl)
    end
end

/*
    Materials 
*/

mercedes.chamsMaterials = {
    "Flat", "Textured", "Selfillum", 
    "Selfillum additive", "Wireframe", "Metallic", 
    "Glass", "Glowing glass"
}



























do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if mercedes.cfg.vars["Hide name"] and self == me then
            return mercedes.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if mercedes.cfg.vars["Hide name"] and self == me then
            return mercedes.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if mercedes.cfg.vars["Hide name"] and self == me then
            return mercedes.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end









mercedes.ui = {}

mercedes.validsnd = false 

mercedes.activetab = "Aimbot"
mercedes.multicombo = false


mercedes.hint = false
mercedes.hintText = ""
mercedes.hintX = 0
mercedes.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input_GetCursorPos()

        if ( x == 0 and y == 0 ) then return end

        StoredCursorPos.x, StoredCursorPos.y = x, y

    end

    function RestoreCursorPosition()

        if ( not StoredCursorPos.x or not StoredCursorPos.y ) then return end
        input.SetCursorPos( StoredCursorPos.x, StoredCursorPos.y )

    end
end

do
    local PANEL = {}

    PANEL.FadeTime = 0
    PANEL.FadeAlpha = 0
    PANEL.FadeStart = 0
    PANEL.FadeDelay = 7
    PANEL.FadeDuration = 0.8

    function PANEL:Init()
        self:SetFocusTopLevel( true )
        
        self:SetSize( 1320, 620 )

        self:SetPaintBackgroundEnabled( false )
        self:SetPaintBorderEnabled( false )
        self:DockPadding( 0, 0, 0, 0 )
        self:MakePopup()

        self:SetAlpha( 0 )

        self.LeftPanel = self:Add( "DPanel" )
        self.LeftPanel:Dock( LEFT )
        self.LeftPanel:SetWide( 190 )
        self.LeftPanel:DockMargin( 0, 0, 10, 0 )
        function self.LeftPanel:Paint( w, h )
            DrawRoundedBox( 0, 0, w, h, 8, mercedes.theme.sidebar )
            surface_SetDrawColor( mercedes.theme.border )
            surface_DrawRect( w - 1, 0, 1, h )
        end

        self.BrandPanel = self.LeftPanel:Add( "DPanel" )
        self.BrandPanel:Dock( TOP )
        self.BrandPanel:SetTall( 84 )
        self.BrandPanel:DockMargin( 10, 10, 10, 6 )
        function self.BrandPanel:Paint( w, h )
            DrawRoundedBox( 0, 0, w, h, 6, mercedes.theme.surface )

            local icon = mercedes.brandIcon
            if icon then
                surface_SetMaterial( icon )
                surface_SetDrawColor( mercedes.theme.text )
                
                surface_DrawTexturedRect( 8, 8, 42, 42 )
            end

            surface_SetFont( "mercedes_font" )
            surface_SetTextColor( mercedes.theme.text.r, mercedes.theme.text.g, mercedes.theme.text.b, mercedes.theme.text.a or 255 )
            
            surface_SetTextPos( 56, 16 )
            surface_DrawText( "Mercedes" )
        end

        self.UserPanel = self.LeftPanel:Add( "DPanel" )
        self.UserPanel:Dock( BOTTOM )
        self.UserPanel:SetTall( 92 )
        self.UserPanel:DockMargin( 12, 8, 12, 12 )
        self.UserAvatar = self.UserPanel:Add( "AvatarImage" )
        self.UserAvatar:SetSize( 40, 40 )
        self.UserAvatar:SetSteamID( me and me:SteamID64() or "0", 64 )
        mercedes.avatarImage = self.UserAvatar
        
       
        
        
        function self.UserPanel:Paint( w, h )
            DrawRoundedBox( 0, 0, w, h, 6, mercedes.theme.surface )

            if IsValid( self:GetParent().UserAvatar ) then
                local ax = 10
                local ay = h - 35
                self:GetParent().UserAvatar:SetPos( ax, ay )
            end

            local name = mercedes.steamProfile and mercedes.steamProfile.name or "Unknown"

            surface_SetFont( "tbfont" )
            surface_SetTextColor( mercedes.theme.text.r, mercedes.theme.text.g, mercedes.theme.text.b, mercedes.theme.text.a or 255 )
            
            surface_SetTextPos( 60, h - 32 )
            surface_DrawText( name )

            surface_SetTextColor( mercedes.theme.muted.r, mercedes.theme.muted.g, mercedes.theme.muted.b, mercedes.theme.muted.a or 255 )
            surface_SetTextPos( 60, h - 16 )
            surface_DrawText( "Maybach-class" )
        end

        self.NavPanel = self.LeftPanel:Add( "DPanel" )
        self.NavPanel:Dock( FILL )
       
        self.NavPanel:DockMargin( 6, 0, 4, 0 )
        self.NavPanel:DockPadding( 2, 0, 2, 0 )
        function self.NavPanel:Paint( w, h ) end

        self.ContentPanel = self:Add( "DPanel" )
        self.ContentPanel:Dock( FILL )
        
        self.ContentPanel:DockMargin( 0, 12, 6, 12 )
        function self.ContentPanel:InitBackground()
            
            local gifURL = "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExand2dWIyYTVheTRrcWx3Ymh1dnFmN2hrdnBlaDM4MzJxOHVnZ3RjNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/FYZUV8JfHFJTO/giphy.gif"

            if not IsValid( self.BgHTML ) then
                self.BgHTML = vgui_Create( "DHTML", self )
                self.BgHTML:Dock( FILL )
                self.BgHTML:SetZPos( -10 )
                self.BgHTML:SetMouseInputEnabled( false )
                self.BgHTML:SetKeyboardInputEnabled( false )
                self.BgHTML:SetHTML([[
                    <html>
                    <head>
                        <style>
                            html, body {
                                margin: 0;
                                padding: 0;
                                overflow: hidden;
                                background: black;
                                width: 100%;
                                height: 100%;
                            }
                            img {
                                width: 100%;
                                height: 100%;
                                object-fit: cover;
                            }
                        </style>
                    </head>
                    <body>
                        <img src="]] .. gifURL .. [[" />
                    </body>
                    </html>
                ]])
            end

            if not IsValid( self.BgOverlay ) then
                self.BgOverlay = vgui_Create( "DPanel", self )
                self.BgOverlay:Dock( FILL )
                self.BgOverlay:SetZPos( -5 )
                self.BgOverlay:SetMouseInputEnabled( false )

                function self.BgOverlay:Paint( w, h )
                    -- Цвет и прозрачность можно будет менять через настройки
                    local colStr = mercedes.cfg.colors["Menu background"] or "0 0 0 220"
                    local col = string_ToColor( colStr ) or Color( 0, 0, 0, 220 )
                    surface_SetDrawColor( col.r, col.g, col.b, col.a )
                    surface_DrawRect( 0, 0, w, h )
                end
            end
        end

        -- Инициализируем фон сразу
        self.ContentPanel:InitBackground()

        PANEL.TopPanel = self.NavPanel
    end

    function PANEL:Think()
        local x,y = input_GetCursorPos()
        local mousex = math_Clamp( x, 1, scrw - 1 )
        local mousey = math_Clamp( y, 1, scrh - 1 )

        if ( self.Dragging ) then

            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]

            self:SetPos( x, y )

        end

        self:SetCursor( "arrow" )

        mercedes.accent = mercedes.theme.accent

        // handle fade-in
        if self.FadeStart > 0 then
            local t = CurTime() - self.FadeStart
            local frac = math_Clamp( (t - self.FadeDelay) / self.FadeDuration, 0, 1 )
            local alpha = math_floor( frac * 255 )
            self:SetAlpha( alpha )
        end
    end

    function PANEL:BeginFadeIn()
        self.FadeStart = CurTime()
        self:SetAlpha( 0 )
    end

    function PANEL:IsActive()

        if ( self:HasFocus() ) then return true end
        if ( vgui.FocusedHasParent( self ) ) then return true end
    
        return false
    
    end
    

    function PANEL:OnMousePressed()
        local x,y = input_GetCursorPos()
        local screenX, screenY = self:LocalToScreen( 0, 0 )

        if (  y < ( screenY + self:GetTall() ) ) then
            self.Dragging = { x - self.x, y - self.y }
            self:MouseCapture( true )
            return
        end

    end

    function PANEL:OnMouseReleased()

        self.Dragging = nil
        self.Sizing = nil
        self:MouseCapture( false )

    end

    function PANEL:Paint(w, h)
        DrawRoundedBox( 0, 0, w, h, 8, mercedes.theme.bg )
        DrawRoundedBoxOutline( 0, 0, w, h, 8, mercedes.theme.border, 1 )
    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui_Register( "UFrame", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )

        local vbar = self.VBar
        vbar:SetWide(3)
    
        vbar.Paint = nil
        vbar.btnUp.Paint = nil
        vbar.btnDown.Paint = nil
    
        function vbar.btnGrip:Paint( w, h ) 
            local hovered = self:IsHovered()
            local time = CurTime()
            local pulse = math_sin(time * 3) * 0.2 + 0.8
            
            // Черно-белый градиентный фон
            for i = 0, h do
                local progress = i / h
                local gray = 255 * (1 - progress * 0.4)
                surface_SetDrawColor(gray, gray, gray, (hovered and 255 or 200) * pulse)
                surface_DrawRect(0, i, w, 1)
            end
            
            // Эффект свечения при hover (белый)
            if hovered then
                for i = 1, 2 do
                    local glowAlpha = 40 - i * 15
                    surface_SetDrawColor(255, 255, 255, glowAlpha)
                    surface_DrawRect(-i, -i, w + i * 2, h + i * 2)
                end
            end
            
            // Рамка (серая)
            surface_SetDrawColor(128, 128, 128, 255)
            surface_DrawOutlinedRect(0, 0, w, h, 1)
        end
    end

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        mercedes.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        mercedes.frame:OnMouseReleased()
    end

    vgui_Register( "UScroll", PANEL, "DScrollPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui_Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 23, 3, 3 )

        self.ItemPanel.Paint = nil

        function self.ItemPanel:OnMousePressed()
            mercedes.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            mercedes.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        local time = CurTime()
        local pulse = math_sin(time * 2) * 0.15 + 0.85
        
        
        surface_SetDrawColor(mercedes.Colors[24].r, mercedes.Colors[24].g, mercedes.Colors[24].b, 255)
        surface_DrawRect(0, 0, w, 20)
        
        
        surface_SetDrawColor(mercedes.Colors[54].r, mercedes.Colors[54].g, mercedes.Colors[54].b, 255)
        surface_DrawOutlinedRect(0, 0, w, h, 1)
        
        
        surface_SetDrawColor(mercedes.Colors[54].r, mercedes.Colors[54].g, mercedes.Colors[54].b, 150)
        surface_DrawOutlinedRect(1, 1, w - 2, h - 2, 1)
   
        
        surface_SetFont( "tbfont" )
        
      
        surface_SetTextColor(0, 0, 0, 150)
        surface_SetTextPos(9, 3)
        surface_DrawText(self.txt)
        
        
        surface_SetTextColor(mercedes.theme.text.r, mercedes.theme.text.g, mercedes.theme.text.b, 255)
        surface_SetTextPos(8, 2)
        surface_DrawText(self.txt)

        
        surface_SetDrawColor(mercedes.Colors[54].r, mercedes.Colors[54].g, mercedes.Colors[54].b, 255)
        surface_DrawRect(6, 20, w-12, 1)
    end

    function PANEL:OnMousePressed()
        mercedes.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        mercedes.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end
    
    vgui_Register( "UPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )
        -- панель под чекбокс/лейбл, можно без отрисовки
    end

    vgui_Register( "UPaintedPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )
        -- контейнер под чекбокс и текст
    end

    vgui_Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("tbfont")
        self.Label:SetTextColor(mercedes.Colors[165])

        self.Button:SetSize( 18, 18 )

        
        function self.Button:Paint(w,h)
            local v = self:GetChecked()
            local hovered = self:IsHovered()
            local time = CurTime()
            local pulse = math_sin(time * 4) * 0.3 + 0.7
            
            
            if hovered then
                for i = 1, 2 do
                    local alpha = 30 - i * 10
                    surface_SetDrawColor(255, 255, 255, alpha)
                    surface_DrawOutlinedRect(-i, -i, w + i * 2, h + i * 2, 1)
                end
            end
            
            -- Основная рамка (белая при hover, серая иначе)
            local borderColor = hovered and Color(255, 255, 255) or mercedes.Colors[54]
            surface_SetDrawColor(borderColor.r, borderColor.g, borderColor.b, 255)
            surface_DrawOutlinedRect(0,0,w,h,1)
            
            -- Внутренняя рамка
            surface_SetDrawColor(borderColor.r * 0.3, borderColor.g * 0.3, borderColor.b * 0.3, 100)
            surface_DrawOutlinedRect(1,1,w-2,h-2,1)

            if not v and not hovered then return end

            -- Черно-белый фон при активации
            if v then
                -- Белый фон с градиентом к серому
                local gradientAlpha = pulse * 0.5 + 0.5
                for i = 0, h - 6 do
                    local progress = i / (h - 6)
                    local gray = 255 * (1 - progress * 0.3)
                    surface_SetDrawColor(gray, gray, gray, 255 * gradientAlpha)
                    surface_DrawRect(3, 3 + i, w - 6, 1)
                end
                
                -- Эффект свечения (белый)
                for i = 1, 2 do
                    local glowAlpha = 40 - i * 15
                    surface_SetDrawColor(255, 255, 255, glowAlpha)
                    surface_DrawRect(3 - i, 3 - i, w - 6 + i * 2, h - 6 + i * 2)
                end
                
                -- Галочка (черная)
                surface_SetDrawColor(0, 0, 0, 255)
                surface_DrawLine(5, h/2, w/2 - 1, h - 5)
                surface_DrawLine(w/2 - 1, h - 5, w - 5, 3)
            else
                -- Hover эффект (светло-серый)
                surface_SetDrawColor(100, 100, 100, 100)
                surface_DrawRect(3,3,w-6,h-6)
            end
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent or 0
    
        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math_floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )
    
        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math_floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
    
    end
    
    vgui_Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
end

do
    local PANEL = {}
    AccessorFunc(PANEL, "Value", "Value")
    AccessorFunc(PANEL, "SlideX", "SlideX")
    AccessorFunc(PANEL, "Min", "Min")
    AccessorFunc(PANEL, "Decimals", "Decimals")
    AccessorFunc(PANEL, "Max", "Max")
    AccessorFunc(PANEL, "Dragging", "Dragging")
    
    function PANEL:Init()
        self:SetMouseInputEnabled(true)
    
        self.Min = 0
        self.Max = 1
        self.SlideX = 0
        self.Decimals = 0
    
        self:SetValue(self.Min)
        self:SetSlideX(0)

        self:SetTall(15)
    end
    
    function PANEL:OnCursorMoved(x, y)
        if not self.Dragging then return end
    
        local w, h = self:GetSize()
    
        x = math_Clamp(x, 0, w) / w
        y = math_Clamp(y, 0, h) / h
    
        local value = self.Min + (self.Max - self.Min) * x
        value = math_Round(value, self:GetDecimals())
    
        self:SetValue(value)
        self:SetSlideX(x)
    
        self:OnValueChanged(value)
    
        self:InvalidateLayout()
    end
    
    function PANEL:OnMousePressed(mcode)
        self:SetDragging(true)
        self:MouseCapture(true)
    
        local x, y = self:CursorPos()
        self:OnCursorMoved(x, y)
    end
    
    function PANEL:OnMouseReleased(mcode)
        self:SetDragging(false)
        self:MouseCapture(false)
    end
    
    function PANEL:OnValueChanged(value)
    
    end

    function PANEL:Paint(w,h)
        local min, max = self:GetMin(), self:GetMax()
        local hovered = self:IsHovered()
        local dragging = self:GetDragging()
        local slideX = self:GetSlideX()
        
        // Темный фон
        surface_SetDrawColor(mercedes.Colors[24].r, mercedes.Colors[24].g, mercedes.Colors[24].b, 255)
        surface_DrawRect(0, 0, w, h)
        
        // Рамка
        surface_SetDrawColor(mercedes.Colors[54].r, mercedes.Colors[54].g, mercedes.Colors[54].b, 255)
        surface_DrawOutlinedRect(0, 0, w, h, 1)
        
        // Прогресс бар (заполненная часть) - убираем салатовый цвет
        local progressW = slideX * w
        if progressW > 0 then
            surface_SetDrawColor(mercedes.Colors[200].r, mercedes.Colors[200].g, mercedes.Colors[200].b, 255)
            surface_DrawRect(0, 0, progressW, h)
        end
        
        // Индикатор позиции (белая вертикальная линия)
        local indicatorX = slideX * w
        surface_SetDrawColor(255, 255, 255, 255)
        surface_DrawRect(indicatorX - 1, 0, 2, h)
    end
    
    vgui_Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4,4,4,0)

        self:SetTextColor(mercedes.Colors[165])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        // Только текст, без рамок и фона
        // Можно добавить легкое подсвечивание при hover
    end

    vgui_Register( "UButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(1,1,1,0)

        self:SetTextColor(mercedes.Colors[245])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        local hovered = self:IsHovered()
        local time = CurTime()
        local pulse = math_sin(time * 3) * 0.2 + 0.8
        
        if hovered then
            // Черно-белый градиентный фон
            for i = 0, h do
                local progress = i / h
                local gray = 255 * (1 - progress * 0.6)
                surface_SetDrawColor(gray, gray, gray, 180 * pulse)
                surface_DrawRect(0, i, w, 1)
            end
            
            // Эффект свечения (белый)
            for i = 1, 2 do
                local glowAlpha = 25 - i * 8
                surface_SetDrawColor(255, 255, 255, glowAlpha)
                surface_DrawOutlinedRect(-i, -i, w + i * 2, h + i * 2, 1)
            end
        end
    end

    vgui_Register( "UESPPButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
    end

    function PANEL:Paint(w,h)
        local hovered = self:IsHovered()
        local time = CurTime()
        local pulse = math_sin(time * 2) * 0.15 + 0.85
        
        // Градиентный фон
        for i = 0, h do
            local progress = i / h
            local r = mercedes.Colors[25].r * (1 - progress * 0.3)
            local g = mercedes.Colors[25].g * (1 - progress * 0.3)
            local b = mercedes.Colors[25].b * (1 - progress * 0.3)
            surface_SetDrawColor(r, g, b, 255)
            surface_DrawRect(0, i, w, 1)
        end
        
        // Кнопка выпадающего списка с градиентом
        for i = 0, h do
            local progress = i / h
            local r = mercedes.accent.r * (1 - progress * 0.5)
            local g = mercedes.accent.g * (1 - progress * 0.5)
            local b = mercedes.accent.b * (1 - progress * 0.5)
            surface_SetDrawColor(r, g, b, (hovered and 255 or 200) * pulse)
            surface_DrawRect(w-25, i, 25, 1)
        end
        
        // Эффект свечения на кнопке
        if hovered then
            for i = 1, 2 do
                local glowAlpha = 30 - i * 10
                surface_SetDrawColor(mercedes.accent.r, mercedes.accent.g, mercedes.accent.b, glowAlpha)
                surface_DrawRect(w-25-i, -i, 25+i*2, h+i*2)
            end
        end
    
        // Иконка стрелки
        surface_SetTextColor(255, 255, 255, 255)
        surface_SetTextPos(w-20,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText("▼")

        // Рамка
        local borderColor = hovered and mercedes.accent or mercedes.Colors[54]
        surface_SetDrawColor(borderColor.r, borderColor.g, borderColor.b, 255)
        surface_DrawOutlinedRect(0,0,w,h,1)
        
        // Внутренняя рамка
        if hovered then
            surface_SetDrawColor(borderColor.r * 0.3, borderColor.g * 0.3, borderColor.b * 0.3, 100)
            surface_DrawOutlinedRect(1,1,w-2,h-2,1)
        end
    end

    function PANEL:OpenMenu( pControlOpener )

        if ( pControlOpener and pControlOpener == self.TextEntry ) then
            return
        end
    
        -- Don't do anything if there aren't any options..
        if ( #self.Choices == 0 ) then return end
    
        -- If the menu still exists and hasn't been deleted
        -- then just close it and don't open a new one.
        if ( IsValid( self.Menu ) ) then
            self.Menu:Remove()
            self.Menu = nil
        end
    
        -- If we have a modal parent at some level, we gotta parent to that or our menu items are not gonna be selectable
        local parent = self
        while ( IsValid( parent ) and not parent:IsModal() ) do
            parent = parent:GetParent()
        end
        if ( not IsValid( parent ) ) then parent = self end
    
        self.Menu = DermaMenu( false, parent )

        function self.Menu:Paint(w,h)
            surface_SetDrawColor(mercedes.Colors[24])
            surface_DrawRect(0,0,w,h)
            surface_SetDrawColor(mercedes.Colors[54])
            surface_DrawOutlinedRect(0,-1,w,h+1)
        end

        for k, v in pairs( self.Choices ) do
            local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
            option.txt = option:GetText()
            option:SetText("")

            function option:Paint(w,h)
                if self:IsHovered() then 
                    surface_SimpleRect(1,1,w-2,h-2,mercedes.Colors[32])
                end

                surface_SetTextColor(mercedes.Colors[165])
                surface_SimpleText(10,4,option.txt,mercedes.Colors[165])
            end   

            if ( self.Spacers[ k ] ) then
                self.Menu:AddSpacer()
            end
        end

    
        local x, y = self:LocalToScreen( 0, self:GetTall() )
    
        self.Menu:SetMinimumWidth( self:GetWide() )
        self.Menu:Open( x, y, false, self )
    
        self:OnMenuOpened( self.Menu )
    
    end
    
    function PANEL:PerformLayout(s)
        self:SetTextColor(mercedes.Colors[165])
        self:SetFont("tbfont")
    end

    vgui_Register( "UComboBox", PANEL, "DComboBox" )
end




do
    local PANEL = {}

    AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

    function PANEL:Init()

        self:SetSelectedNumber( 0 )
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 75 )

    end

    function PANEL:UpdateText()

        local str = input.GetKeyName( self:GetSelectedNumber() )
        if ( not str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(mercedes.Colors[165])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        surface_SetDrawColor(mercedes.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
    end

    function PANEL:DoClick()

        self:SetText( "PRESS A KEY" )
        input.StartKeyTrapping()
        self.Trapping = true

    end

    function PANEL:DoRightClick()

        self:SetText( "[]" )
        self:SetValue( 0 )

    end

    function PANEL:SetSelectedNumber( iNum )

        self.m_iSelectedNumber = iNum
        self:UpdateText()
        self:OnChange( iNum )

    end

    function PANEL:Think()

        if ( input.IsKeyTrapping() and self.Trapping ) then

            local code = input.CheckKeyTrapping()
            if ( code ) then

                if ( code == KEY_ESCAPE ) then

                    self:SetValue( self:GetSelectedNumber() )

                else

                    self:SetValue( code )

                end

                self.Trapping = false

            end

        end

    end

    function PANEL:SetValue( iNumValue )

        self:SetSelectedNumber( iNumValue )

    end

    function PANEL:GetValue()

        return self:GetSelectedNumber()

    end

    function PANEL:OnChange()
    end

    vgui_Register( "UBinder", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.Color = Color(255,255,255,255)

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall(18)
        self:SetWide(18)
        
        self:SetText("")
    end

    function PANEL:Paint(w,h)
        if self.Color.a < 255 then
            surface_SimpleTexturedRect(0,0,w,h,mercedes.Colors[255],mercedes.Materials["Alpha grid"])  
        end

        // Apply RGB change if enabled
        local drawColor = self.Color
        if self.cfgName and mercedes.cfg.vars["RGB change"] then
            local hsv = HSVToColor((CurTime() * 60) % 360, 1, 1)
            drawColor = Color(hsv.r, hsv.g, hsv.b, self.Color.a)
        end

        surface_SetDrawColor(drawColor)
        surface_DrawRect(0,0,w,h)
    end
    
    function PANEL:Think()
        // Update color in real-time if RGB change is enabled
        if self.cfgName and mercedes.cfg.vars["RGB change"] then
            local hsv = HSVToColor((CurTime() * 60) % 360, 1, 1)
            local baseColor = string_ToColor(mercedes.cfg.colors[self.cfgName] or "255 255 255 255")
            self.Color = Color(hsv.r, hsv.g, hsv.b, baseColor.a)
        end
    end

    vgui_Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, mercedes.Colors[25] )

        surface_SetDrawColor( mercedes.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    function PANEL:Init()
        self:RequestFocus()
        self:MakePopup()
    end

    function PANEL:Think()
        if self.lifeTime < 15 then self.lifeTime = self.lifeTime + 1 end

        if not self:HasFocus() and self.lifeTime >= 14 then
            self:Remove()
        end
    end

    vgui_Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200,200)
    end 

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, mercedes.Colors[25] )

        surface_SetDrawColor( mercedes.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui_Register( "UColorPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui_Register( "UColorMixer", PANEL, "DColorMixer" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_bDirty", "Dirty", FORCE_BOOL )
    AccessorFunc( PANEL, "m_bSortable", "Sortable", FORCE_BOOL )

    AccessorFunc( PANEL, "m_iHeaderHeight", "HeaderHeight" )
    AccessorFunc( PANEL, "m_iDataHeight", "DataHeight" )

    AccessorFunc( PANEL, "m_bMultiSelect", "MultiSelect" )
    AccessorFunc( PANEL, "m_bHideHeaders", "HideHeaders" )

    function PANEL:Init()
        self:SetSortable( true )
        self:SetMouseInputEnabled( true )
        self:SetMultiSelect( true )
        self:SetHideHeaders( false )

        self:SetPaintBackground( true )
        self:SetHeaderHeight( 16 )
        self:SetDataHeight( 17 )

        self.Columns = {}

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

        self.pnlCanvas = vgui.Create( "Panel", self )

        self.VBar = vgui.Create( "DVScrollBar", self )
        self.VBar:SetZPos( 20 )
    end

    function PANEL:DisableScrollbar()

        if ( IsValid( self.VBar ) ) then
            self.VBar:Remove()
        end

        self.VBar = nil

    end

    function PANEL:GetLines()
        return self.Lines
    end

    function PANEL:GetInnerTall()
        return self:GetCanvas():GetTall()
    end

    function PANEL:GetCanvas()
        return self.pnlCanvas
    end

    function PANEL:AddColumn( strName, iPosition )

        if ( iPosition ) then
            if ( iPosition <= 0 ) then
                ErrorNoHaltWithStack( "Attempted to insert column at invalid position ", iPosition )
                return
            end
        
            if ( IsValid( self.Columns[ iPosition ] ) ) then
                ErrorNoHaltWithStack( "Attempted to insert duplicate column." )
                return
            end
        end

        local pColumn = nil

        if ( self.m_bSortable ) then
            pColumn = vgui.Create( "DListView_Column", self )
        else
            pColumn = vgui.Create( "DListView_ColumnPlain", self )
        end

        pColumn:SetName( strName )
        pColumn:SetZPos( 10 )

        if ( iPosition ) then

            table.insert( self.Columns, iPosition, pColumn )

            local i = 1
            for id, pnl in pairs( self.Columns ) do
                pnl:SetColumnID( i )
                i = i + 1
            end

        else

            local ID = table.insert( self.Columns, pColumn )
            pColumn:SetColumnID( ID )

        end

        self:InvalidateLayout()

        return pColumn

    end

    function PANEL:RemoveLine( LineID )

        local Line = self:GetLine( LineID )
        local SelectedID = self:GetSortedID( LineID )

        self.Lines[ LineID ] = nil
        table.remove( self.Sorted, SelectedID )

        self:SetDirty( true )
        self:InvalidateLayout()

        Line:Remove()

    end

    function PANEL:ColumnWidth( i )

        local ctrl = self.Columns[ i ]
        if ( not ctrl ) then return 0 end

        return ctrl:GetWide()

    end

    function PANEL:FixColumnsLayout()

        local NumColumns = table.Count( self.Columns )
        if ( NumColumns == 0 ) then return end

        local AllWidth = 0
        for k, Column in pairs( self.Columns ) do
            AllWidth = AllWidth + math.ceil( Column:GetWide() )
        end

        local ChangeRequired = self.pnlCanvas:GetWide() - AllWidth
        local ChangePerColumn = math.floor( ChangeRequired / NumColumns )
        local Remainder = ChangeRequired - ( ChangePerColumn * NumColumns )

        for k, Column in pairs( self.Columns ) do

            local TargetWidth = math.ceil( Column:GetWide() ) + ChangePerColumn
            Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

        end

        local TotalMaxWidth = 0

        -- If there's a remainder, try to palm it off on the other panels, equally
        while ( Remainder ~= 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abort!
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( not self:GetHideHeaders() )

        end

    end

    function PANEL:PerformLayout()

        -- Do Scrollbar
        local Wide = self:GetWide()
        local YPos = 0

        if ( IsValid( self.VBar ) ) then

            self.VBar:SetPos( self:GetWide() - 16, 0 )
            self.VBar:SetSize( 16, self:GetTall() )
            self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() )
            YPos = self.VBar:GetOffset()

            if ( self.VBar.Enabled ) then Wide = Wide - 16 end

        end

        if ( self.m_bHideHeaders ) then
            self.pnlCanvas:SetPos( 0, YPos )
        else
            self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() )
        end

        self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )

        self:FixColumnsLayout()

        --
        -- If the data is dirty, re-layout
        --
        if ( self:GetDirty() ) then

            self:SetDirty( false )
            local y = self:DataLayout()
            self.pnlCanvas:SetTall( y )

            -- Layout again, since stuff has changed..
            self:InvalidateLayout( true )

        end

    end

    function PANEL:OnScrollbarAppear()

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:OnRequestResize( SizingColumn, iSize )

        -- Find the column to the right of this one
        local Passed = false
        local RightColumn = nil
        for k, Column in pairs( self.Columns ) do

            if ( Passed ) then
                RightColumn = Column
                break
            end

            if ( SizingColumn == Column ) then Passed = true end

        end

        -- Alter the size of the column on the right too, slightly
        if ( RightColumn ) then

            local SizeChange = SizingColumn:GetWide() - iSize
            RightColumn:SetWide( RightColumn:GetWide() + SizeChange )

        end

        SizingColumn:SetWide( iSize )
        self:SetDirty( true )

        -- Invalidating will munge all the columns about and make it right
        self:InvalidateLayout()

    end

    function PANEL:DataLayout()

        local y = 0
        local h = self.m_iDataHeight

        local alt = false
        for k, Line in ipairs( self.Sorted ) do

            if ( not Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = not alt

            y = y + Line:GetTall()

        end

        return y

    end

    PANEL.Cur = true
    function PANEL:AddLine( ... )

        self.Cur = not self.Cur

        self:SetDirty( true )
        self:InvalidateLayout()

        local Line = vgui.Create( "DListView_Line", self.pnlCanvas )
        local c = self.Cur and 48 or 32

        function Line:Paint( w, h )
            
            surface_SetDrawColor( c, c, c )
            surface_DrawRect( 0, 0, w, h )
        end

        local ID = table.insert( self.Lines, Line )

        Line:SetListView( self )
        Line:SetID( ID )

        -- This assures that there will be an entry for every column
        for k, v in pairs( self.Columns ) do
            Line:SetColumnText( k, "" )
        end

        for k, v in pairs( {...} ) do
            Line:SetColumnText( k, v )
        end

        -- Make appear at the bottom of the sorted list
        local SortID = table.insert( self.Sorted, Line )

        if ( SortID % 2 == 1 ) then
            Line:SetAltLine( true )
        end

        return Line

    end

    function PANEL:OnMouseWheeled( dlta )

        if ( not IsValid( self.VBar ) ) then return end

        return self.VBar:OnMouseWheeled( dlta )

    end

    function PANEL:ClearSelection( dlta )

        for k, Line in pairs( self.Lines ) do
            Line:SetSelected( false )
        end

    end

    function PANEL:GetSelectedLine()

        for k, Line in pairs( self.Lines ) do
            if ( Line:IsSelected() ) then return k, Line end
        end

    end

    function PANEL:GetLine( id )

        return self.Lines[ id ]

    end

    function PANEL:GetSortedID( line )

        for k, v in pairs( self.Sorted ) do

            if ( v:GetID() == line ) then return k end

        end

    end

    function PANEL:OnClickLine( Line, bClear )

        local bMultiSelect = self:GetMultiSelect()
        if ( not bMultiSelect and not bClear ) then return end

        --
        -- Control, multi select
        --
        if ( bMultiSelect and input.IsKeyDown( KEY_LCONTROL ) ) then
            bClear = false
        end

        --
        -- Shift block select
        --
        if ( bMultiSelect and input.IsKeyDown( KEY_LSHIFT ) ) then

            local Selected = self:GetSortedID( self:GetSelectedLine() )
            if ( Selected ) then

                local LineID = self:GetSortedID( Line:GetID() )

                local First = math.min( Selected, LineID )
                local Last = math.max( Selected, LineID )

                -- Fire off OnRowSelected for each non selected row
                for id = First, Last do
                    local line = self.Sorted[ id ]
                    if ( not line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
                    line:SetSelected( true )
                end

                -- Clear the selection and select only the required rows
                if ( bClear ) then self:ClearSelection() end

                for id = First, Last do
                    local line = self.Sorted[ id ]
                    line:SetSelected( true )
                end

                return

            end

        end

        --
        -- Check for double click
        --
        if ( Line:IsSelected() and Line.m_fClickTime and ( not bMultiSelect or bClear ) ) then

            local fTimeDistance = SysTime() - Line.m_fClickTime

            if ( fTimeDistance < 0.3 ) then
                self:DoDoubleClick( Line:GetID(), Line )
                return
            end

        end

        --
        -- If it's a new mouse click, or this isn't
        -- multiselect we clear the selection
        --
        if ( not bMultiSelect or bClear ) then
            self:ClearSelection()
        end

        if ( Line:IsSelected() ) then return end

        Line:SetSelected( true )
        Line.m_fClickTime = SysTime()

        self:OnRowSelected( Line:GetID(), Line )

    end

    function PANEL:SortByColumns( c1, d1, c2, d2, c3, d3, c4, d4 )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( not IsValid( a ) ) then return true end
            if ( not IsValid( b ) ) then return false end

            if ( c1 and a:GetColumnText( c1 ) ~= b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 and a:GetColumnText( c2 ) ~= b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 and a:GetColumnText( c3 ) ~= b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 and a:GetColumnText( c4 ) ~= b:GetColumnText( c4 ) ) then
                if ( d4 ) then a, b = b, a end
                return a:GetColumnText( c4 ) < b:GetColumnText( c4 )
            end

            return true
        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SortByColumn( ColumnID, Desc )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( Desc ) then
                a, b = b, a
            end

            local aval = a:GetSortValue( ColumnID ) or a:GetColumnText( ColumnID )
            local bval = b:GetSortValue( ColumnID ) or b:GetColumnText( ColumnID )

            -- Maintain nicer sorting for numbers
            if ( isnumber( aval ) and isnumber( bval ) ) then return aval < bval end

            return tostring( aval ) < tostring( bval )

        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SelectItem( Item )

        if ( not Item ) then return end

        Item:SetSelected( true )
        self:OnRowSelected( Item:GetID(), Item )

    end

    function PANEL:SelectFirstItem()

        self:ClearSelection()
        self:SelectItem( self.Sorted[ 1 ] )

    end

    function PANEL:DoDoubleClick( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowSelected( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowRightClick( LineID, Line )

        -- For Override

    end

    function PANEL:Clear()

        for k, v in pairs( self.Lines ) do
            v:Remove()
        end

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

    end

    function PANEL:GetSelected()

        local ret = {}

        for k, v in pairs( self.Lines ) do
            if ( v:IsLineSelected() ) then
                table.insert( ret, v )
            end
        end

        return ret

    end

    function PANEL:SizeToContents()

        self:SetHeight( self.pnlCanvas:GetTall() + self:GetHeaderHeight() )

    end

    vgui_Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface_SetDrawColor( mercedes.Colors[24] )
        surface_DrawRect( 0, 0, w, h )

        surface_SetDrawColor( mercedes.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui_Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 18 )
        self:SetText( "..." )
    end

    vgui_Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui_Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui_Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            mercedes.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            mercedes.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface_SetDrawColor( mercedes.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
   
        surface_SetFont( "tbfont" )
        surface_SimpleText( 8, 2, self.txt, mercedes.Colors[165] )

        surface_SimpleRect( 6, 20, w-12, 1, mercedes.Colors[54] )
    end

    function PANEL:OnMousePressed()
        mercedes.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        mercedes.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui_Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

mercedes.ui.ColorWindow = false
mercedes.ui.SettingsPan = false
mercedes.ui.MultiComboP = false

function mercedes.ui.RemovePanel( pan )
    if not pan then return end 

    pan:Remove()
    pan = false
end

function mercedes.ui.Binder( cfg, par )
    local b = vgui_Create( "UBinder", par )
    b:SetValue( mercedes.cfg.binds[ cfg ] or 0 )

    function b:OnChange()
        mercedes.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function mercedes.ui.ColorPicker( cfg, par, onChange )
    // Инициализируем цвет по умолчанию, если его нет
    if not mercedes.cfg.colors[cfg] then
        mercedes.cfg.colors[cfg] = "255 255 255 255"
    end
    
    if not IsValid(par) then return end
    
    local b = vgui_Create( "UCPicker", par )
    if not IsValid(b) then return end

    // Инициализируем цвет
    local colorStr = mercedes.cfg.colors[cfg] or "255 255 255 255"
    local initialColor = string_ToColor( colorStr )
    if not initialColor then
        initialColor = Color(255, 255, 255, 255)
    end
    b.Color = initialColor

    // Локальная переменная для хранения цвета (используется в замыканиях)
    local currentPickerColor = Color(initialColor.r, initialColor.g, initialColor.b, initialColor.a)
    
    // Store cfg name for RGB change
    b.cfgName = cfg

    function b:DoClick()
        if not IsValid(self) then return end
        
        local x, y = self:LocalToScreen( 0, self:GetTall() )

        mercedes.ui.RemovePanel( mercedes.ui.ColorWindow )

        mercedes.ui.ColorWindow = vgui_Create( "UColorPanel" )
        if not IsValid(mercedes.ui.ColorWindow) then return end
        
        mercedes.ui.ColorWindow:SetPos( x+25, y-100 )
        mercedes.ui.ColorWindow:SetSize(200, 230)

        // Add RGB change checkbox
        local rgbCheckbox = vgui_Create( "UCheckboxLabel", mercedes.ui.ColorWindow )
        rgbCheckbox:SetText( "RGB change" )
        rgbCheckbox:SetPos( 10, 200 )
        rgbCheckbox:SetValue( mercedes.cfg.vars["RGB change"] )
        rgbCheckbox:SetSize( 180, 20 )
        
        function rgbCheckbox:OnChange( val )
            mercedes.cfg.vars["RGB change"] = val
        end

        local c = vgui_Create( "UColorMixer", mercedes.ui.ColorWindow )
        if not IsValid(c) then return end
        c:SetSize( 180, 190 )
        
        local colorStr = mercedes.cfg.colors[cfg] or "255 255 255 255"
        local currentColor = string_ToColor( colorStr )
        if not currentColor then
            currentColor = Color(255, 255, 255, 255)
        end
        currentPickerColor = Color(currentColor.r, currentColor.g, currentColor.b, currentColor.a)
        c:SetColor( currentColor )

        if IsValid(c.HSV) and IsValid(c.HSV.Knob) then
            c.HSV.Knob:SetSize( 5, 5 )
            
            function c.HSV.Knob:Paint( w, h )
                if not currentPickerColor then
                    currentPickerColor = Color(255, 255, 255, 255)
                end
                surface_SimpleRect( 0, 0, w, h, currentPickerColor )

                surface_SetDrawColor( mercedes.Colors[255] )
                surface_DrawOutlinedRect( 0, 0, w, h, 1 )
            end
        end

        function c:ValueChanged( col )
            if not col then return end
            
            local newColor = Color(col.r or 255, col.g or 255, col.b or 255, col.a or 255)
            
            // Apply RGB change if enabled
            if mercedes.cfg.vars["RGB change"] then
                local hsv = HSVToColor((CurTime() * 60) % 360, 1, 1)
                newColor = Color(hsv.r, hsv.g, hsv.b, newColor.a)
            end
            
            currentPickerColor = newColor
            
            if IsValid(b) then
                b.Color = newColor
            end
            
            mercedes.cfg.colors[cfg] = tostring(newColor.r) .. " " .. tostring(newColor.g) .. " " .. tostring(newColor.b) .. " " .. tostring(newColor.a)
            if onChange then onChange( newColor ) end
        end
        
        // Store cfg name for RGB change updates
        mercedes.ui.ColorWindow.cfgName = cfg
        mercedes.ui.ColorWindow.onChangeCallback = onChange
        mercedes.ui.ColorWindow.colorButton = b
        
        // Update color preview with RGB change
        function mercedes.ui.ColorWindow:Think()
            if mercedes.cfg.vars["RGB change"] and IsValid(c) and self.cfgName then
                local hsv = HSVToColor((CurTime() * 60) % 360, 1, 1)
                local currentColor = c:GetColor()
                local newColor = Color(hsv.r, hsv.g, hsv.b, currentColor.a)
                currentPickerColor = newColor
                if IsValid(self.colorButton) then
                    self.colorButton.Color = newColor
                end
                mercedes.cfg.colors[self.cfgName] = tostring(newColor.r) .. " " .. tostring(newColor.g) .. " " .. tostring(newColor.b) .. " " .. tostring(newColor.a)
                if self.onChangeCallback then self.onChangeCallback( newColor ) end
            end
        end

    end
end

function mercedes.ui.SPanel( func, p )
    local b = vgui_Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input_GetCursorPos()

        mercedes.ui.RemovePanel( mercedes.ui.SettingsPan )

        mercedes.ui.SettingsPan = vgui_Create( "USettingsPanel" )
        mercedes.ui.SettingsPan:SetPos( mx+25, my-10 )

        func()
    end
end

function mercedes.ui.Label( pan, str, postCreate )
    local p = vgui_Create( "UCBPanel", pan )

    local lbl = vgui_Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "tbfont" )
    lbl:SetTextColor( mercedes.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end
    
function mercedes.ui.CheckBox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui_Create( "UCBPanel", par )

    local c = vgui_Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( mercedes.cfg.vars[cfg] )

    function c:OnChange( bval )
        mercedes.cfg.vars[cfg] = bval

        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate( p ) end

    if bind then mercedes.ui.Binder( cfg, p ) end
    if color then mercedes.ui.ColorPicker( cfg, p ) end
    if spanel then mercedes.ui.SPanel( spanel, p ) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input_GetCursorPos()

                mercedes.hint = true
                mercedes.hintText = hint
                mercedes.hintX = x + 45
                mercedes.hintY = y - 5
            end
        end
    end
end

function mercedes.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui_Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface_SetFont("tbfont")

        local s = tostring(mercedes.cfg.vars[cfg] or min)
        local tw, th = surface_GetTextSize(s)
        
        surface_SimpleText(2,4,str,mercedes.Colors[165])

        surface_SimpleText(w-tw-2,4,s,mercedes.Colors[165])
    end

    local c = vgui_Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( mercedes.cfg.vars[cfg] or min )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        mercedes.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function mercedes.ui.Button( str, func, p ) 
    local b = vgui_Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function mercedes.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(mercedes.Colors[165])

    local p = vgui_Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface_SetDrawColor(mercedes.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h)
    end
	
	local txt = vgui_Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4) 
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "tbfont" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(mercedes.Colors[165])

	if mercedes.cfg.vars[cfg] != nil and mercedes.cfg.vars[cfg] != "" then
		txt:SetValue(mercedes.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if mercedes.cfg.vars[cfg] == txt:GetValue() then return end

		mercedes.cfg.vars[cfg] = txt:GetValue()
	end 

	function txt.OnValueChange()
		mercedes.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function mercedes.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")
    
    function b:Paint(w,h)
        if self:IsHovered() then 
            surface_SimpleRect(1,1,w-2,h-2,mercedes.Colors[32])
        end

        surface_SetTextColor(mercedes.Colors[165])

        if mercedes.cfg.vars[str.."-"..v] then
            surface_SetTextColor(mercedes.Colors[235]) 
        end

        surface_SetTextPos(5,3)
        surface_SetFont("tbfont")
        surface_DrawText(v)
    end

    function b:DoClick()
        mercedes.cfg.vars[str.."-"..v] = not mercedes.cfg.vars[str.."-"..v] 
    end
end

function mercedes.ui.MultiCombo( pan, str, choices )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(mercedes.Colors[165])

    local d = vgui_Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")
    
    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if mercedes.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table_insert(d.preview,v) 
            elseif mercedes.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table_RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then 
                table_RemoveByValue(d.preview,v)
            end
        end

        preview = table_concat(d.preview,", ")

        surface_SetDrawColor(mercedes.Colors[25])
        surface_DrawRect(0,0,w,h)
    
        surface_SetTextColor(mercedes.Colors[165])
        surface_SetTextPos(8,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText(preview)
    
        surface_SetDrawColor(mercedes.Colors[32])
        surface_DrawRect(w-25,0,25,25)
    
        surface_SetTextColor(mercedes.Colors[165])
        surface_SetTextPos(w-20,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText("▼")

        surface_SetDrawColor(mercedes.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        mercedes.ui.RemovePanel( mercedes.ui.MultiComboP )

        local ctoh = #choices
    
        mercedes.ui.MultiComboP = vgui_Create( "ULifeTimeBase" )
        mercedes.ui.MultiComboP:SetPos( x, y - 1 )
        mercedes.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )
    
        for k, v in pairs(choices) do
            mercedes.ui.dropdownButton( str, v, mercedes.ui.MultiComboP, d.preview )
        end
    end
end

function mercedes.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(mercedes.Colors[165])

    local dropdown = vgui_Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)
    
    if mercedes.presets[ cfg ] then
        choices = mercedes.presets[ cfg ]
    end 
    
    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end
    
    dropdown:SetSortItems(false)

    if mercedes.cfg.vars[cfg] <= #choices then
        dropdown:ChooseOptionID(mercedes.cfg.vars[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        mercedes.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function mercedes.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui_Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function mercedes.ui.MTButton( p, str, postCreate )
    surface_SetFont("tbfont")
    local w, h = surface_GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        p.ActiveTab = str
        mercedes.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface_SetTextColor(235,235,235,255)
        else
            surface_SetTextColor(165,165,165,255)
        end
        
        surface_DrawRect(0,0,width,height)

        surface_SetFont("tbfont")
        surface_SetTextPos(tx,ty)
        surface_DrawText(str)
    end

    p.ActiveTab = str
    mercedes.ui.InitMT( p, postCreate )
end

mercedes.pty = { 5, 5, 5 }
do
    local xt = { 
        [1] = 5,
        [2] = 380,
        [3] = 755
    }

    function mercedes.itemPanel( str, tbl, h )
        local p = vgui_Create( "UPanel", mercedes.scrollpanel )
        p:SetPos( xt[tbl], mercedes.pty[tbl] )
        p:SetSize( 360, h )
        p.txt = str

        mercedes.pty[ tbl ] = mercedes.pty[ tbl ] + h + 5

        return p
    end

    function mercedes.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui_Create( "UButtonBarPanel", mercedes.scrollpanel )
        p:SetPos( xt[tbl], mercedes.pty[tbl] )
        p:SetSize( 360, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        mercedes.pty[ tbl ] = mercedes.pty[ tbl ] + h + 5

        return p
    end

end

mercedes.espposes = {"Up","Down","Right","Left"}
mercedes.espelements = {"Name pos","Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
mercedes.lastdrag = ""
mercedes.esppans = {}

mercedes.esppansposes = {
    [1] = {
        x = 85,
        y = 0,
    },
    [2] = {
        x = 85,
        y = 250,
    },
    [3] = {
        x = 170,
        y = 125,
    },
    [4] = {
        x = 0,
        y = 125,
    },
}

for i = 1, 4 do
    mercedes.esppans[i] = {}
end

function mercedes.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos
        
        for i = 1, #panels do
            local v = panels[i]

            mercedes.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end
    
mercedes.spfuncs = {}

// PANEL CREATION

mercedes.frame = vgui_Create("UFrame")
if IsValid( mercedes.frame ) and mercedes.frame.BeginFadeIn then
    mercedes.frame:BeginFadeIn()
end
mercedes.scrollpanel = vgui_Create("UScroll", mercedes.frame.ContentPanel or mercedes.frame)
if mercedes.RefreshSteamProfile then
    mercedes.RefreshSteamProfile()
end

mercedes.tabs = {}

// Aimbot


mercedes.spfuncs[2] = function()
    mercedes.ui.SettingsPan:SetSize( 250, 160 )

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Wait for simtime update", "Wait for simtime update" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
end

mercedes.spfuncs[3] = function()
    mercedes.ui.SettingsPan:SetSize( 250, 68 )

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Knifebot mode", "Knifebot mode"  )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Facestab", "Facestab" )
end

mercedes.spfuncs[4] = function()
    mercedes.ui.SettingsPan:SetSize( 250, 85 )

    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

mercedes.spfuncs[5] = function()
    mercedes.ui.SettingsPan:SetSize( 250, 128 )

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

mercedes.spfuncs[30] = function()
    mercedes.ui.SettingsPan:SetSize(250,200)

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Force seed", "Force seed" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Wait for seed", "Wait for seed" )

    
    
end

mercedes.spfuncs[32] = function()
    mercedes.ui.SettingsPan:SetSize(250,200)

    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end

-- Music tab (SoundCloud player)
function mercedes.tabs.Music()

    local p = mercedes.itemPanel("Music player",1,260):GetItemPanel()

    local lbl = vgui_Create( "DLabel", p )
    lbl:Dock( TOP )
    lbl:DockMargin( 4, 4, 4, 4 )
    lbl:SetFont( "tbfont" )
    lbl:SetTextColor( mercedes.Colors[165] )
    lbl:SetText( "SoundCloud playlist" )
    lbl:SizeToContents()

    local info = vgui_Create( "DLabel", p )
    info:Dock( TOP )
    info:DockMargin( 4, 0, 4, 8 )
    info:SetFont( "tbfont" )
    info:SetTextColor( mercedes.Colors[245] )
    info:SetText( "Вкладка использует встроенный SoundCloud-плеер. Громкость и управление — в самом плеере." )
    info:SetWrap( true )
    info:SetAutoStretchVertical( true )

    local html = vgui_Create( "DHTML", p )
    html:Dock( FILL )
    html:DockMargin( 4, 0, 4, 4 )

    local playlistURL = "https://soundcloud.com/discover/sets/liked-by::504775362?si=65f9ef4b631e4f2fa4ba7f1c10b72cd0&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"

    html:SetHTML([[
        <html>
        <head>
            <meta charset="utf-8">
            <style>
                html, body {
                    margin: 0;
                    padding: 0;
                    overflow: hidden;
                    background: #000;
                    width: 100%;
                    height: 100%;
                }
                iframe {
                    border: none;
                    width: 100%;
                    height: 100%;
                }
            </style>
        </head>
        <body>
            <iframe scrolling="no" frameborder="no"
                src="https://w.soundcloud.com/player/?url=]] .. playlistURL .. [[&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true">
            </iframe>
        </body>
        </html>
    ]])

end

function mercedes.tabs.Aimbot()

    local p = mercedes.itemPanel("Main",1,210):GetItemPanel()

    mercedes.ui.CheckBox( p, "Enable Aimbot", "Enable aimbot", false, false, false, false, false, function( p ) mercedes.ui.Binder( "Aim on key", p ) end )
    
    mercedes.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, mercedes.spfuncs[2] )
    mercedes.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )
    mercedes.ui.CheckBox( p, "Silent aim", "Silent aim" )
    mercedes.ui.CheckBox( p, "pSilent", "pSilent", "Context vector will be used to make aim completely invisible." )
    mercedes.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false, mercedes.spfuncs[3] )
	mercedes.ui.CheckBox( p, "No Recoil", "Norecoil" )
    mercedes.ui.CheckBox( p, "No Spread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, mercedes.spfuncs[30] )
	
	
	
    
    local p = mercedes.itemPanel("Legit",1,100):GetItemPanel()

    mercedes.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, mercedes.spfuncs[4] )
    mercedes.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, mercedes.spfuncs[5] )
    mercedes.ui.CheckBox( p, "Trigger", "Trigger bot", false, true )


    local p = mercedes.itemPanel( "Visualisation", 1, 100 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Show FOV", "Show FOV", false, false, true )
    mercedes.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true )
    mercedes.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true )

    

    local p = mercedes.itemPanel( "Prediction", 2, 255 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction" )
    mercedes.ui.CheckBox( p, "Bugbait prediction", "Bugbait prediction" )
    mercedes.ui.Slider( p, "Simulation limit", "Simulation limit", 1, 10, 2 )

    mercedes.ui.CheckBox( p, "Prop aimbot", "Prop aimbot" )
    mercedes.ui.CheckBox( p, "Auto throw", "PA thrower" )
    mercedes.ui.Slider( p, "Throw distance", "PA thrower dist", 1, 640, 0 )
    mercedes.ui.Slider( p, "Max simulation time", "Prop max simtime", 1, 10, 2 )
    mercedes.ui.CheckBox( p, "Projectile aimbot", "Projectile aimbot" )
	
	local p = mercedes.itemPanel( "Position adjustment", 2, 220 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    mercedes.ui.CheckBox( p, "Backtrack", "Backtrack" )
    mercedes.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    mercedes.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    mercedes.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    mercedes.ui.CheckBox( p, "Always backtrack", "Always backtrack" )

    local p = mercedes.itemPanel( "Target selection", 3, 175 ):GetItemPanel()

    mercedes.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" } )
    mercedes.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins", "Break LC" } )
    mercedes.ui.CheckBox( p, "Wallz", "Wallz" ) 
    mercedes.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )

    local p = mercedes.itemPanel( "Hitbox selection", 3, 280 ):GetItemPanel()

    mercedes.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Penis" } )
    mercedes.ui.CheckBox( p, "Hitscan", "Hitscan" ) 
    //mercedes.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )
    mercedes.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    mercedes.ui.CheckBox( p, "Multipoint", "Multipoint" ) 
    mercedes.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    mercedes.ui.Slider( p, "Multipoint scale", "Multipoint scale", 0.5, 1, 1 )

    

    

end



mercedes.spfuncs[22] = function()
    mercedes.ui.SettingsPan:SetSize(250,200)

    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid"})
    mercedes.ui.MultiCombo( mercedes.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

mercedes.spfuncs[24] = function( p )
   

    // "Runs act command to make your model dance for other clients"
    //"Forcing istyping for animation desync"
end

mercedes.spfuncs[36] = function()
    mercedes.ui.SettingsPan:SetSize(250,200)
    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Material", "Antiaim material", mercedes.chamsMaterials)
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Antiaim fullbright", "Antiaim fullbright" )
end

function mercedes.tabs.Rage()
    local p = mercedes.itemPanel( "Angles", 1, 280 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    mercedes.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    mercedes.ui.ComboBox( p, "Yaw base", "Yaw base" )
    mercedes.ui.ComboBox( p, "Yaw", "Yaw" )
    mercedes.ui.ComboBox( p, "Pitch", "Pitch" )
    mercedes.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )
    mercedes.ui.Slider( p, "Roll (Lean)", "Roll", -180, 180, 0 )

    local p = mercedes.itemPanel( "Tweaks", 1, 200 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "On shot aa", "On shot aa" )
    mercedes.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    mercedes.ui.CheckBox( p, "Freestanding", "Freestanding" )
    mercedes.ui.CheckBox( p, "Micromovement", "Micromovement" )

    mercedes.ui.CheckBox( p, "Desync", "Desync" )
    mercedes.ui.Slider( p, "Desync range", "Desync range", 0, 60, 0 )
    mercedes.ui.CheckBox( p, "Jitter Body", "Jitter Body" )

    
    local p = mercedes.itemPanel( "Fake lag",2,75 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, mercedes.spfuncs[22] )
    mercedes.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )

    local p = mercedes.itemPanel( "Visualisation", 2,75 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, mercedes.spfuncs[36], false, function( p ) mercedes.ui.ColorPicker( "Real chams", p ) end ) 
    mercedes.ui.CheckBox( p, "Angle arrows", "Angle arrows" )
	
	local p = mercedes.itemPanel( "Animation breaker", 2, 160 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Taunt spam", "Taunt spam" )
    mercedes.ui.ComboBox( p, "Taunt", "Taunt", mercedes.actCommands )
    mercedes.ui.CheckBox( p, "Handjob", "Handjob" )
    mercedes.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )


    
    local p = mercedes.itemPanel( "Sequence", 2, 175 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Sequence manip", "Sequence manip", false, true )
    mercedes.ui.Slider( p, "Out Sequence", "OutSequence", 1, 5000, 0 )
    mercedes.ui.CheckBox( p, "Randomise", "Sequence min random" )
    mercedes.ui.Slider( p, "Min sequence", "Sequence min", 1, 5000, 0 )
    mercedes.ui.CheckBox( p, "Animation freezer", "Animation freezer", false, true )

    local p = mercedes.itemPanel( "Player adjustments", 3, 200 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Interpolation", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    mercedes.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    mercedes.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    mercedes.ui.CheckBox( p, "Fix animations", "Update Client Anim fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    mercedes.ui.CheckBox( p, "Extrapolation", "Extrapolation" )
    mercedes.ui.CheckBox( p, "Extrapolation visual", "Extrapolation visual" )
    mercedes.ui.Slider( p, "Extrapolation scale", "Extrapolation scale", 0.5, 2, 2 )

    local p = mercedes.itemPanel( "Resolver", 3, 95 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Resolver", "Resolver" )
    mercedes.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    mercedes.ui.CheckBox( p, "Taunt resolver", "Taunt resolver" )

    local p = mercedes.itemPanel( "Exploits", 3, 195 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Double tap", "Double tap", false, true, false, false, function(b) if b and ded and ded.EnableTickbaseShifting then ded.EnableTickbaseShifting(true) end end )
    mercedes.ui.CheckBox( p, "Hide shots", "Hide shots", false, true, false, false, function(b) if b and ded and ded.EnableTickbaseShifting then ded.EnableTickbaseShifting(true) end end )
    mercedes.ui.CheckBox( p, "Tickbase shift", "Tickbase shift", false, true )
    mercedes.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true )
    mercedes.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) if ded.SetMinShift then ded.SetMinShift(val) end end )
    mercedes.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) if ded.SetMaxShift then ded.SetMaxShift(val) end end )
    

end

mercedes.spfuncs[11] = function()
    mercedes.ui.SettingsPan:SetSize(250,200)
    
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Team color", "Box team color" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Gradient", "Box gradient" )
    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly" })


end

mercedes.spfuncs[12] = function()
    mercedes.ui.SettingsPan:SetSize(250,48)
    
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Health bar", "Health bar" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

mercedes.spfuncs[14] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)
    
    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Visible material", "Visible mat", mercedes.chamsMaterials)
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Invisible material", "inVisible mat", mercedes.chamsMaterials)
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

mercedes.spfuncs[15] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Material", "Self mat", mercedes.chamsMaterials)
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Weapon chams", "Self chams w" )

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

mercedes.spfuncs[16] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Material", "Backtrack material", mercedes.chamsMaterials)
    mercedes.ui.ColorPicker( "Backtrack chams", mercedes.ui.SettingsPan )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

mercedes.spfuncs[17] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Material", "Entity material", mercedes.chamsMaterials)

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

mercedes.spfuncs[28] = function()
    mercedes.ui.SettingsPan:SetSize(250,48)
    
    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Mode", "Edge bug mode", mercedes.presets["Edge bug mode"] )
end

mercedes.spfuncs[18] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Die time","Tracers die time",1,10,0 )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )
    
end

mercedes.spfuncs[19] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Material", "Viewmodel chams type", mercedes.chamsMaterials)
    
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )
end

mercedes.spfuncs[20] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Collision", "Third person collision" )
    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

mercedes.spfuncs[21] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Ghetto mode", "Ghetto free cam" )
end

mercedes.spfuncs[31] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "3D", "Ent box 3d" )
end


mercedes.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" ) 

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end 
    
    for i = 1,4 do
        local poses = mercedes.esppansposes

        mercedes.esppans[i].panel = vgui_Create( "UPaintedPanel", p )
        mercedes.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        mercedes.esppans[i].panel:SetSize(85,125)
        mercedes.esppans[i].panel:Receiver( "SwagCock$", mercedes.DoDrop )
        mercedes.esppans[i].panel.pos = i
    end

    for i = 1, #mercedes.espelements do
        local cfgstr = mercedes.espelements[i]
        local panel = mercedes.esppans[mercedes.cfg.vars[cfgstr]].panel

        local b = vgui_Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" ) 

        b:SetParent( panel )
    end
end

mercedes.spfuncs[33] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Show ammo", "Show ammo" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Print name", "Weapon printname" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Show reloading", "Show reloading" )
    
end

mercedes.spfuncs[34] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)


end

function mercedes.tabs.Visuals()

    local p = mercedes.itemPanel("Player",1,506):GetItemPanel()

    mercedes.ui.CheckBox( p, "Box", "Box esp", false, false, true, mercedes.spfuncs[11] )

    mercedes.ui.CheckBox( p, "Name", "Name", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Health", "Health", false, false, true, mercedes.spfuncs[12], false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) mercedes.ui.ColorPicker( "Health bar gradient", p ) end )
    mercedes.ui.CheckBox( p, "Armor", "Armor", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Weapon", "Weapon", false, false, false, mercedes.spfuncs[33], false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    mercedes.ui.CheckBox( p, "Team", "Team", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Money", "DarkRP Money", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Packets ( Fake lag )", "Simtime updated", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    
    
    mercedes.ui.Slider( p, "Max distance","ESP Distance",0,100000,0 )
    
    mercedes.ui.CheckBox( p, "Show records", "Show records" )
    mercedes.ui.CheckBox( p, "Skeleton", "Skeleton" )
    mercedes.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, false, false, function(p)
        local lbl, drop = mercedes.ui.ComboBox( p, "", "OOF Style", {"Arrow"} ) 
        lbl:Remove() 
        drop:Dock(RIGHT) 
        drop:DockMargin(0,0,0,0) 
    end )
    // mercedes.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, mercedes.spfuncs[34], false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "Sight lines", "Sight lines" )
    mercedes.ui.CheckBox( p, "InFOV Indicator", "IFOV" )
    mercedes.ui.CheckBox( p, "Snaplines", "Snaplines", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "Snaplines", p ) local lbl, drop = mercedes.ui.ComboBox( p, "", "Snaplines style", {"Bottom","Center"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    mercedes.ui.CheckBox( p, "Head dot", "Head dot", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "Head dot", p ) mercedes.ui.Slider( p, "", "Head dot size", 1, 10, 0 ) end )
    mercedes.ui.CheckBox( p, "Corner boxes", "Corner boxes", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "Corner boxes", p ) mercedes.ui.Slider( p, "", "Corner size", 5, 30, 0 ) end )
    mercedes.ui.CheckBox( p, "Distance", "Distance ESP", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "", "Distance pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    mercedes.ui.CheckBox( p, "3D Box", "3D Player box", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "3D Player box", p ) end )

    mercedes.ui.ComboBox( p, "Font", "ESP Font", { "Outlined", "Shadow", "Thug" } )

    







    


    local p = mercedes.itemPanel("Entity",1,135):GetItemPanel()

    mercedes.ui.CheckBox( p, "Box", "Ent box", false, false, false, mercedes.spfuncs[31] )
    mercedes.ui.CheckBox( p, "Class", "Ent class" )
    mercedes.ui.Slider( p, "Max distance","Ent ESP Distance",0,100000,0 )
    mercedes.ui.Label( p, "Add entity key", function( p ) mercedes.ui.Binder( "Ent add", p ) end )

    local p = mercedes.itemPanel( "Hitmarker", 1, 300 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Hitmarker", "Hitmarker", false, false, true )
    mercedes.ui.CheckBox( p, "Hitnumbers", "Hitnumbers", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "Hitnumbers krit", p ) end )
    //mercedes.ui.CheckBox( p, "Hit particles", "Hit particles", false, false, true, mercedes.spfuncs[31] )
    mercedes.ui.CheckBox( p, "Hitsound", "Hitsound" )
    mercedes.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    mercedes.ui.CheckBox( p, "Killsound", "Killsound" )
    mercedes.ui.TextEntry( "Sound path", "Killsound str", p, 420 )
    
    local p = mercedes.itemPanel("Colored models",2,180):GetItemPanel()

    mercedes.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, mercedes.spfuncs[14], false, function(p) mercedes.ui.ColorPicker( "inVisible chams", p ) end )
    mercedes.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, mercedes.spfuncs[15] )
    mercedes.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, mercedes.spfuncs[16] )
    mercedes.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, mercedes.spfuncs[17], false )
    mercedes.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, mercedes.spfuncs[19], false )


    local lbl, drop = mercedes.ui.ComboBox( p, "Custom Model", "Custom player model", mercedes.customPlayerModelNames )
     function drop:OnSelect(index, value, data)
         mercedes.cfg.vars["Custom player model"] = index
         mercedes.ApplyCustomPlayerModel()
     end

    local p = mercedes.itemPanel("Material customisation",2,150):GetItemPanel()

    mercedes.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = mercedes.chamMats.vis[3], mercedes.chamMats.vis[4], mercedes.chamMats.invis[3], mercedes.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, mercedes.cfg.vars["Fresnel maximum illum"], mercedes.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, mercedes.cfg.vars["Fresnel maximum illum"], mercedes.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, mercedes.cfg.vars["Fresnel maximum illum"], mercedes.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, mercedes.cfg.vars["Fresnel maximum illum"], mercedes.cfg.vars["Fresnel exponent"] ) )
    end )
    
    mercedes.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = mercedes.chamMats.vis[3], mercedes.chamMats.vis[4], mercedes.chamMats.invis[3], mercedes.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], v, mercedes.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], v, mercedes.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], v, mercedes.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], v, mercedes.cfg.vars["Fresnel exponent"] ) )
    end )
 
    mercedes.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = mercedes.chamMats.vis[3], mercedes.chamMats.vis[4], mercedes.chamMats.invis[3], mercedes.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], mercedes.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], mercedes.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], mercedes.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( mercedes.cfg.vars["Fresnel minimum illum"], mercedes.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = mercedes.itemPanel("Outlines",2,160):GetItemPanel()

    mercedes.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    mercedes.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    mercedes.ui.ComboBox( p, "Style", "Outline style", { "Default", "Subtractive", "Additive" } )
    mercedes.ui.CheckBox( p, "Dlight", "Dlight", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "Dlight", p ) mercedes.ui.Slider( p, "", "Dlight brightness", 0, 255, 0 ) mercedes.ui.Slider( p, "Size", "Dlight size", 64, 512, 0 ) end )

    local p = mercedes.itemPanel( "Indicators", 2, 115 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) mercedes.ui.ColorPicker( "Miss lagcomp", p ) mercedes.ui.ColorPicker( "Miss spread", p ) mercedes.ui.ColorPicker( "Miss fail", p ) end )
    mercedes.ui.CheckBox( p, "Spectator list", "Spectator list" )
    mercedes.ui.CheckBox( p, "Target HUD", "Target HUD" )

    


    local p = mercedes.itemPanel("World",3,320):GetItemPanel()

    mercedes.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    mercedes.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    mercedes.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )
    mercedes.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, mercedes.spfuncs[18] )
    mercedes.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )
    mercedes.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    mercedes.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    mercedes.ui.CheckBox( p, "Disable shadows", "Disable shadows" )

    local p = mercedes.itemPanel("View",3,270):GetItemPanel()

    mercedes.ui.CheckBox( p, "Third person", "Third person", false, true, false, mercedes.spfuncs[20] )
    mercedes.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, mercedes.spfuncs[21] )

    mercedes.ui.Slider( p, "Fov override","Fov override",75,160,0 )
    mercedes.ui.Slider( p, "Fov zoom","Fov zoom",10,75,0 )
    mercedes.ui.Label( p, "Fov zoom key", function( p ) mercedes.ui.Binder( "Fov zoom", p ) end )
    mercedes.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    mercedes.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) gRunCmd("r_aspectratio",val) end )

    local p = mercedes.itemPanel( "Misc", 3, 220 ):GetItemPanel()

    mercedes.ui.CheckBox( p, "Hide name", "Hide name" )
    mercedes.ui.TextEntry( "Custom name", "Custom name", p, 999 )
    mercedes.ui.CheckBox( p, "Disable sensivity adjustment", "Disable SADJ" )
    mercedes.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    mercedes.ui.CheckBox( p, "Kill effect", "Kill effect" )
    mercedes.ui.CheckBox( p, "China hat", "China hat", false, false, true )


    
    

   



    





    

    






    
    /*





    mercedes.checkbox("Kill sound","Killsound",p:GetItemPanel())
    

    local p = mercedes.itemPanel("World",2,123)

    

    local p = mercedes.itemPanel("Effects",2,142)


    
    

    local p = mercedes.itemPanel("View",3,275)




    // mercedes.ESPPP:Show()
*/
end

mercedes.spfuncs[25] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.ComboBox( mercedes.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit","Rage","Multidir"})
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    mercedes.ui.CheckBox( mercedes.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

mercedes.spfuncs[26] = function()
    mercedes.ui.SettingsPan:SetSize(250,256)

    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    mercedes.ui.Slider( mercedes.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

mercedes.spfuncs[27] = function( p )
    mercedes.ui.TextEntry( "Name", "Name Convar", p, 250 )
    mercedes.ui.Button( "Change name", function() ded.NetSetConVar("name",mercedes.cfg.vars["Name Convar"]) end, p )
    mercedes.ui.CheckBox( p, "Name stealer", "Name stealer" )

    mercedes.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    mercedes.ui.Button( "Disconnect", function() ded.NetDisconnect(mercedes.cfg.vars["Disconnect reason"]) end, p )
end 

function mercedes.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = mercedes.cfg.vars[m] 
    local num = mercedes.cfg.vars[n]
    local set = mode == 2 and math_Round( num ) or num

    if mode == 1 then set = mercedes.cfg.vars[s] end

    return set
end

mercedes.spfuncs[28] = function( p )
    mercedes.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    mercedes.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    mercedes.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    mercedes.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    mercedes.ui.Button( "Send new val", function() ded.NetSetConVar( mercedes.cfg.vars["Net Convar"] ,mercedes.CustomCvarVal( 1 ) ) end, p )
end 

mercedes.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "Userinfo"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

mercedes.spfuncs[29] = function( p )
    mercedes.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    mercedes.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    mercedes.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    mercedes.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})
    
    mercedes.ui.Button( "Change cvar", function()
        local s = mercedes.CustomCvarVal( 0 )
        local n = mercedes.cfg.vars["Cvar name"]
        
        local flag = GetConVar(n):GetFlags()

        ded.CVarSetFlags( n, 0 )

        gRunCmd( n, s )

        ded.CVarSetFlags( n, flag )
    end, p )

    mercedes.ui.ComboBox( p, "Cvar flag", "Cvar flag", mercedes.FCVAR.str)

    mercedes.ui.Button( "Change flag", function()
        ded.CVarSetFlags( mercedes.cfg.vars["Cvar name"], mercedes.FCVAR.int[ mercedes.cfg.vars["Cvar flag"] ] )
        print( mercedes.cfg.vars["Cvar name"], mercedes.FCVAR.int[ mercedes.cfg.vars["Cvar flag"] ] )
    end, p )

end 

function mercedes.tabs.Misc()

    local function func( p )
        mercedes.ui.MTButton( p, "Cvar", mercedes.spfuncs[29] )
        mercedes.ui.MTButton( p, "Net cvar", mercedes.spfuncs[28] )
        mercedes.ui.MTButton( p, "Net", mercedes.spfuncs[27] )
    end

    local p = mercedes.itemPanel("Movement",1,280):GetItemPanel()

    mercedes.ui.CheckBox( p, "Bunny hop", "Bhop" )
    mercedes.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, mercedes.spfuncs[25] )
    mercedes.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, mercedes.spfuncs[26] )
    mercedes.ui.CheckBox( p, "Keep sprint", "Sprint" )
    mercedes.ui.CheckBox( p, "Fast stop", "Fast stop" )
    mercedes.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    mercedes.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    mercedes.ui.CheckBox( p, "Water walk", "Water jump" )
    mercedes.ui.CheckBox( p, "Edge bug", "Edge bug", false, false, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "Mode", "Edge bug mode", mercedes.presets["Edge bug mode"] ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    mercedes.ui.CheckBox( p, "Show indicator", "Edge bug indicator" )
    mercedes.ui.CheckBox( p, "Jump bug", "Jump bug", false, true, false, false, false, function(p) local lbl, drop = mercedes.ui.ComboBox( p, "Mode", "Jump bug mode", mercedes.presets["Jump bug mode"] ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) mercedes.ui.Binder( "Jump bug", p ) end )

    local p = mercedes.itemPanel("Key spam",1,185):GetItemPanel()

    mercedes.ui.CheckBox( p, "Use spam", "Use spam" )
    mercedes.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    mercedes.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    mercedes.ui.CheckBox( p, "Camera spam", "Camera spam" )
    mercedes.ui.CheckBox( p, "Vape spam", "Vape spam" )

   

end

function mercedes.tabs.Settings()
    local p = mercedes.itemPanel("Config",1,200):GetItemPanel()

    mercedes.ui.TextEntry( "Config name", "Config name", p, 64 )

    mercedes.ui.ComboBox( p, "Config", "Selected config", mercedes.configs)

    mercedes.ui.Button( "Save config", function() mercedes.SaveConfig() end, p )
    mercedes.ui.Button( "Load config", function() mercedes.LoadConfig() end, p )

    //mercedes.ui.Label( p, "Menu color", function( p ) mercedes.ui.ColorPicker( "Menu color", p, mercedes.updateMenuColor ) end )
end

function mercedes.tabs.Players()
    local playerlist = vgui.Create( "UListView", mercedes.scrollpanel )
    playerlist:SetPos( 5, 5 )
    playerlist:SetSize( 500, 775 )
    playerlist:SetMultiSelect( false )
    playerlist:AddColumn( "Name" )
    playerlist:AddColumn( "SID" )
    playerlist:AddColumn( "SID64" )
    playerlist:AddColumn( "Team" )
    playerlist:AddColumn( "Group" )

    local plys = player_GetAll()

    for i = 1, #plys do
        playerlist:AddLine( plys[ i ]:Name(), plys[ i ]:SteamID(), plys[ i ]:SteamID64(), team_GetName( plys[ i ]:Team() ), plys[ i ]:GetUserGroup() )
    end
    


end

mercedes.ttable = {}

mercedes.ttable["Aimbot"]        = mercedes.tabs.Aimbot
mercedes.ttable["HvH"]           = mercedes.tabs.Rage
mercedes.ttable["Visuals"]       = mercedes.tabs.Visuals
mercedes.ttable["Players"]       = mercedes.tabs.Players
mercedes.ttable["Music"]         = mercedes.tabs.Music
mercedes.ttable["Misc"]          = mercedes.tabs.Misc
mercedes.ttable["Config"]        = mercedes.tabs.Settings

function mercedes.initTab(tab)
    if mercedes.scrollpanel != nil then mercedes.scrollpanel:Remove() end

    mercedes.scrollpanel = vgui_Create("UScroll", mercedes.frame.ContentPanel or mercedes.frame)

    mercedes.pty = { 5, 5, 5 }
    // mercedes.ESPPP:Hide()
    mercedes.ttable[tostring(tab)]()
end

function mercedes.tabButton(tab,par) 
    local b = par:Add("DButton")
    b:Dock( TOP )
    b:DockMargin( 0, 0, 0, 0 )
    b:SetTall( 30 )
    b:SetText( "" )
    
    function b:DoClick()
        mercedes.activetab = tab
        mercedes.initTab(tab)
        if mercedes.PlayTabSound then
            mercedes.PlayTabSound()
        else
            surface_PlaySound("garrysmod/ui_click.wav")
        end
    end

    function b:Paint(width,height)
        local isActive = mercedes.activetab == tab
        // Убираем белый фон - только текст
        // Никакого фона не рисуем

        surface_SetFont("tbfont")
        local textColor = mercedes.theme.text
        if isActive then
            // Активная кнопка - белый текст
            textColor = mercedes.theme.text
        else
            // Неактивная - чуть темнее
            textColor = mercedes.theme.muted
        end
        surface_SetTextColor( textColor.r, textColor.g, textColor.b, textColor.a or 255 )
        surface_SetTextPos( 12, height / 2 - 7 )
        surface_DrawText( tab )
    end
end

local navOrder = { "Aimbot", "Visuals", "HvH", "Players", "Music", "Config", "Misc" }

for i = 1, #navOrder do
    mercedes.tabButton( navOrder[i], mercedes.frame:GetTopPanel() )
end

mercedes.activetab = "Aimbot"
mercedes.initTab( mercedes.activetab )

// Input 

function mercedes.IsKeyDown( key )
    if key >= 107 then
        return input_IsMouseDown( key )
    end

    return input_IsKeyDown( key )
end


mercedes.target             = false  
mercedes.aimingrn           = false 

mercedes.targetVector       = Vector()
mercedes.predictedVector    = Vector()
mercedes.backtrackVector    = Vector()

// Target HUD animation variables
mercedes.targethudy = 0
mercedes.targethudx = 0
mercedes.targeta = 0
mercedes.targethp = 0
mercedes.nullVec            = Vector() * -1

mercedes.SilentAngle        = me:EyeAngles()

mercedes.SkipCommand        = false
mercedes.SendPacket         = true

mercedes.traceStruct        = { mask = MASK_SHOT, filter = me }
mercedes.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
mercedes.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
mercedes.cones              = {}
mercedes.parsedbones        = {}

mercedes.swbNormal          = bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
mercedes.swbWall            = bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
mercedes.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
mercedes.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

mercedes.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
mercedes.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
mercedes.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
mercedes.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

mercedes.activeWeapon       = false 
mercedes.activeWeaponClass  = false 
mercedes.moveType           = me:GetMoveType() 

mercedes.myaw               = GetConVar("m_yaw"):GetFloat()

mercedes.backtracktick      = 0










function mercedes.AutoWall( dir, plyTarget )
	if not mercedes.activeWeapon or mercedes.swbShit[ mercedes.activeWeaponClass ] then return false end 

	local eyePos = me:EyePos()
	
	local function SWBAutowall()

        mercedes.traceStruct.start = eyePos
        mercedes.traceStruct.endpos = eyePos + dir * mercedes.activeWeapon.PenetrativeRange
        mercedes.traceStruct.filter = me
        mercedes.traceStruct.mask = mercedes.swbNormal

		local tr = TraceLine( mercedes.traceStruct )
		
		if tr.Hit and not tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)
			
			if mercedes.activeWeapon.CanPenetrate and dot > 0.26 then

                mercedes.traceStruct.start = tr.HitPos
                mercedes.traceStruct.endpos = tr.HitPos + dir * mercedes.activeWeapon.PenStr * ( mercedes.swbPen[tr.MatType] or 1 ) * mercedes.activeWeapon.PenMod
                mercedes.traceStruct.filter = me
                mercedes.traceStruct.mask = mercedes.swbWall

				tr = TraceLine( mercedes.traceStruct )

                mercedes.traceStruct.start = tr.HitPos
                mercedes.traceStruct.endpos = tr.HitPos + dir * 0.1
                mercedes.traceStruct.filter = me
                mercedes.traceStruct.mask = mercedes.swbNormal

				tr = TraceLine( mercedes.traceStruct) 
				
				if tr.Hit then return false end

                mercedes.traceStruct.start = tr.HitPos
                mercedes.traceStruct.endpos = tr.HitPos + dir * 32768
                mercedes.traceStruct.filter = me
                mercedes.traceStruct.mask = MASK_SHOT

				tr = TraceLine( mercedes.traceStruct )
				
                if mercedes.cfg.vars["Ignores-Head unhitable"] then
                    return tr.Entity == plyTarget and tr.HitGroup == 1
                else
                    return tr.Entity == plyTarget
                end
			end
		end
		
		return false
	end
	
	local function M9KAutowall()
		if !mercedes.activeWeapon.Penetration then
			return false
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 then
				return false
			end
			
			local maxPenetration    = 14
            local maxRicochet       = 0
            local isRicochet        = false

            if mercedes.m9kPenetration[ mercedes.activeWeapon.Primary.Ammo ] then
                maxPenetration = mercedes.m9kPenetration[ mercedes.activeWeapon.Primary.Ammo ]
            end
			
            if mercedes.m9kMaxRicochet[ mercedes.activeWeapon.Primary.Ammo ] then
                maxRicochet = mercedes.m9kMaxRicochet[ mercedes.activeWeapon.Primary.Ammo ]
            end

            if mercedes.m9kCanRicochet[ mercedes.activeWeapon.Primary.Ammo ] then
                isRicochet = mercedes.m9kMaxRicochet[ mercedes.activeWeapon.Primary.Ammo ]
            end

			if tr.MatType == MAT_METAL and isRicochet and mercedes.activeWeapon.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration

			if mercedes.m9kPenMaterial[ tr.MatType ] then
				penetrationDir = tr.Normal * ( maxPenetration * 2 ) 
			end

			if tr.Fraction <= 0 then
				return false
			end

			mercedes.traceStruct.endpos    = tr.HitPos
			mercedes.traceStruct.start     = tr.HitPos + penetrationDir
			mercedes.traceStruct.mask      = MASK_SHOT
			mercedes.traceStruct.filter    = me

			local trace = TraceLine( mercedes.traceStruct )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			mercedes.traceStruct.endpos = trace.HitPos + tr.Normal * 32768
			mercedes.traceStruct.start  = trace.HitPos
			mercedes.traceStruct.mask   = MASK_SHOT
			mercedes.traceStruct.filter = me

			local penTrace = TraceLine( mercedes.traceStruct )

            if mercedes.cfg.vars["Ignores-Head unhitable"] then
                return penTrace.Entity == plyTarget and penTrace.HitGroup == 1
            else
                return penTrace.Entity == plyTarget
            end

			local damageMulti = 0.5
			if mercedes.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
				damageMulti = 1
			elseif tr.MatType == MAT_CONCRETE or tr.MatType == MAT_METAL then
				damageMulti = 0.3
			elseif tr.MatType == MAT_WOOD or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_GLASS then
				damageMulti = 0.8
			elseif tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				damageMulti = 0.9
			end
			
			if penTrace.MatType == MAT_GLASS then
				bounceNum = bounceNum - 1
			end

			return BulletPenetrate( penTrace, bounceNum + 1, damage * damageMulti )
		end

        mercedes.traceStruct.start = eyePos
        mercedes.traceStruct.endpos = eyePos + dir * 32768
        mercedes.traceStruct.filter = me
        mercedes.traceStruct.mask = MASK_SHOT

		local trace = TraceLine( mercedes.traceStruct )

		return BulletPenetrate( trace, 0, mercedes.activeWeapon.Primary.Damage )
	end
	
    if StartsWith( mercedes.activeWeaponClass, "m9k_" ) then
		return M9KAutowall()
	elseif StartsWith( mercedes.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	end
	
	return false
end

mercedes.Piercable = function( ent ) 
    print( ent, ent:GetClass(), ent:IsSolid() )
    if ent:GetClass() == "func_breakable" or ent == me or not ent:IsSolid() then 
        return true 
    end 

    return false
end

mercedes.Piercable = ents.FindByClass( "func_breakable" )
table.insert( mercedes.Piercable, me )

function mercedes.VisibleCheck( who, where, predticks, awalldir )
    local start = me:EyePos()

    if predticks then start = start + ( me:GetVelocity() * TickInterval ) * predticks end

    mercedes.traceStruct.start = start
    mercedes.traceStruct.endpos = where
    mercedes.traceStruct.mask = MASK_SHOT
    mercedes.traceStruct.filter = mercedes.Piercable

    local tr = TraceLine( mercedes.traceStruct )

    if IsValid(tr.Entity) and tr.Entity:GetClass() == "func_breakable" and not table.HasValue( mercedes.Piercable, tr.Entity ) then
        table.insert( mercedes.Piercable, tr.Entity )
    end 

    local canhit = (IsValid(tr.Entity) and tr.Entity == who) or tr.Fraction == 1

    if not canhit and awalldir and mercedes.cfg.vars["Wallz"] then 
        return mercedes.AutoWall( awalldir, who )
    end

    if mercedes.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup ~= 1 then return false end

    return canhit
end

function mercedes.CanShoot( cmd )
	if not mercedes.activeWeapon then return false end
	local seq = mercedes.activeWeapon:GetSequence()

    if mercedes.cfg.binds["Aim on key"] != 0 and not mercedes.IsKeyDown( mercedes.cfg.binds["Aim on key"] ) then
        return false
    end

	if mercedes.badSweps[ mercedes.activeWeaponClass ] then
		return false
	end

    if mercedes.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if mercedes.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if mercedes.cfg.vars["Bullet time"] and mercedes.activeWeapon:GetNextPrimaryFire() >= ded.GetServerTime(cmd) then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if mercedes.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) ~= 134 then
        return false 
    end

	return mercedes.activeWeapon:Clip1() ~= 0 and not mercedes.badSeqs[ seq ] 
end 

function mercedes.Spread( cmd, ang, spread )
	if not mercedes.activeWeapon or not mercedes.cones[ mercedes.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

mercedes.CustomSpread = {}

function mercedes.CustomSpread.swb( cmd, ang )
   

    local cone = mercedes.activeWeapon.CurCone
    if not cone then return ang end

    if me:Crouching() then
        cone = cone * 0.85
    end

    math_randomseed( cmd:CommandNumber() )
    return ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
end

function mercedes.CustomSpread.cw( cmd, ang )
    local cone = mercedes.activeWeapon.CurCone
    if not cone then return ang end

    math_randomseed( cmd:CommandNumber() )
    return ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
end



function mercedes.CustomSpread.fas2( cmd, ang )
    math_randomseed( CurTime() )

    local dir = Angle( math_Rand( -mercedes.activeWeapon.CurCone, mercedes.activeWeapon.CurCone ), math_Rand( -mercedes.activeWeapon.CurCone, mercedes.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir 
            
    if mercedes.activeWeapon.ClumpSpread and mercedes.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math_Rand(-1, 1), math_Rand(-1, 1), math_Rand(-1, 1)) * mercedes.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

function mercedes.CustomSpread.tfa( cmd, ang )

    
    return ang
end

mercedes.SpreadComps = {}

mercedes.SpreadComps["swb"]     = mercedes.CustomSpread.swb
mercedes.SpreadComps["cw"]      = mercedes.CustomSpread.cw
mercedes.SpreadComps["fas2"]    = mercedes.CustomSpread.fas2
mercedes.SpreadComps["tfa"]     = mercedes.CustomSpread.tfa










function mercedes.NoSpread(cmd, ang)
    if not mercedes.activeWeapon or mercedes.swbShit[ mercedes.activeWeaponClass ] then return ang end
    local base = string.Split( mercedes.activeWeaponClass, "_" )[ 1 ]

    if mercedes.SpreadComps[ base ] then
        ang = mercedes.SpreadComps[ base ]( cmd, ang )
    elseif mercedes.cones[ mercedes.activeWeaponClass ] then
        local spread = mercedes.cones[ mercedes.activeWeaponClass ]
        return mercedes.Spread( cmd, ang, spread ) 
    end

    return ang
end

function mercedes.NoRecoil( ang )  
	if StartsWith( mercedes.activeWeaponClass,"m9k_" ) or StartsWith( mercedes.activeWeaponClass,"bb_" ) or StartsWith( mercedes.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - me:GetViewPunchAngles()
    end

	return ang
end

function mercedes.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if mercedes.parsedbones[ mdl ] and mercedes.parsedbones[ mdl ][ bone ] then 
        return mercedes.parsedbones[ mdl ][ bone ]
    end

    if not mercedes.parsedbones[ mdl ] then
        mercedes.parsedbones[ mdl ] = {}
    end
        
    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do 
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			mercedes.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do 
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            mercedes.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function mercedes.MultipointGroupCheck( group )
    if group == 1 and not mercedes.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not mercedes.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not mercedes.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not mercedes.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not mercedes.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not mercedes.cfg.vars["Multipoint groups-Generic"] then return false end

    return true 
end

function mercedes.GetBones( ply )
    local scale = mercedes.cfg.vars["Multipoint scale"]
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if mercedes.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do 
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not mercedes.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not mercedes.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not mercedes.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not mercedes.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not mercedes.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not mercedes.cfg.vars["Hitscan groups-Generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }
        end

        if not pos or not istable( pos ) then return {} end

        local valid = {}

        for i = 1, #pos do
            local bone = pos[ i ].bone
            local hitboxbone = ply:GetHitBoxBone( bone, set )

            if hitboxbone == nil then 
                continue 
            end 

            local mins, maxs = ply:GetHitBoxBounds( bone, set )

            if not mins or not maxs then 
                continue
            end 

            local bonepos, ang = ply:GetBonePosition( hitboxbone )
            
            if not bonepos then continue end
            
            if mercedes.cfg.vars["Multipoint"] and mercedes.MultipointGroupCheck( pos[ i ].hitgroup ) then
                local points = {
                    ( ( mins + maxs ) * 0.5 ),
                    Vector( mins.x, mins.y, mins.z ),
                    Vector( mins.x, maxs.y, mins.z ),
                    Vector( maxs.x, maxs.y, mins.z ),
                    Vector( maxs.x, mins.y, mins.z ),
                    Vector( maxs.x, maxs.y, maxs.z ),
                    Vector( mins.x, maxs.y, maxs.z ),
                    Vector( mins.x, mins.y, maxs.z ),
                    Vector( maxs.x, mins.y, maxs.z )
                }

                for i = 1, #points do
                    points[ i ]:Rotate( ang )
                    points[ i ] = points[ i ] + bonepos

                    if i == 1 then continue end 

                    points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
                    valid[ #valid + 1 ] = points[ i ]
                end
            end 

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else
        local bone = mercedes.ParseBones( ply, mercedes.cfg.vars["Hitbox selection"] ) 

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then 
            return { pos }  
        end 

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then 
            return { pos } 
        end 

        local bonepos, ang = ply:GetBonePosition( hitboxbone )  

        if not bonepos then return { pos } end

        if mercedes.cfg.vars["Multipoint"] then
            local points = {
                ( ( mins + maxs ) * 0.5 ),
                Vector( mins.x, mins.y, mins.z ),
                Vector( mins.x, maxs.y, mins.z ),
                Vector( maxs.x, maxs.y, mins.z ),
                Vector( maxs.x, mins.y, mins.z ),
                Vector( maxs.x, maxs.y, maxs.z ),
                Vector( mins.x, maxs.y, maxs.z ),
                Vector( mins.x, mins.y, maxs.z ),
                Vector( maxs.x, mins.y, maxs.z )
            }

            for i = 1, #points do
                points[ i ]:Rotate( ang )
                points[ i ] = points[ i ] + bonepos

                if i == 1 then continue end 

                points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
            end

            return points
        else 
            mins:Rotate( ang )
            maxs:Rotate( ang )

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function mercedes.GetSortedPlayers( mode, selfpred, plypred, vischeck )
    local players   = player_GetAll()   
    local eyepos    = me:EyePos()       
    local valid     = {}                // sorted lady and gentleman goes here ( niggers and faggots goes to hell )

	if selfpred then
		eyepos = eyepos + (me:GetVelocity() * TickInterval) * selfpred
	end

    local st = me:Team()

    for i = 1, #players do
        local v = players[i] 

        if v == me then continue end 
        if not v:Alive() or v:IsDormant() then continue end 
        if mercedes.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end 
        if mercedes.cfg.vars["Ignores-Friends"] and mercedes.cfg.friends[v:SteamID64()] then continue end 
        if mercedes.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end 
        if mercedes.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end 
        if mercedes.cfg.vars["Ignores-Frozen"] and v:IsFlagSet( FL_FROZEN ) then continue end 
        if mercedes.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive( EF_NODRAW ) then continue end 
        if mercedes.cfg.vars["Ignores-God time"] and v:GetColor().a < 255 then continue end 
        if mercedes.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end 
        if mercedes.cfg.vars["Ignores-Break LC"] and v.break_lc then continue end
        if st == TEAM_SPECTATOR or mercedes.cfg.vars["Ignores-Teammates"] and st == v:Team() then continue end 
        if mercedes.cfg.vars["Ignores-Nocliping"] and v:IsEFlagSet(EFL_NOCLIP_ACTIVE) then continue end 

        if vischeck then
			local bone = mercedes.GetBones( v )[1]
			local dir = me:GetShootPos() - bone
			dir:Normalize()

			if not mercedes.VisibleCheck( v, bone, selfpred, dir ) then
				continue
			end
		end

        local pos = v:GetPos()
        if plypred then 
            pos = pos + (v:GetVelocity() * TickInterval) * plypred
        end

        valid[#valid+1] = { v, pos }
    end

    if mode == 1 then
        table_sort(valid, function( a, b )
            return ( a[2] - eyepos ):LengthSqr() < ( b[2] - eyepos ):LengthSqr()       
        end)
    elseif mode == 2 then
        table_sort(valid, function( a, b )
            local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()

            local aDist
            do
                local dx = scrwc - aScr.x
                local dy = scrhc - aScr.y
                aDist = dx * dx + dy * dy
            end
    
            local bDist
            do
                local dx = scrwc - bScr.x
                local dy = scrhc - bScr.y
                bDist = dx * dx + dy * dy
            end
    
            return aDist < bDist
        end)
    end

    if #valid == 0 then return end

    return valid
end

function mercedes.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - mercedes.btrecords[ ply ][ tick ].simulationtime

    if diff > mercedes.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function mercedes.FindBacktrack( cmd, ply )
    local ticks = #mercedes.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if mercedes.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function mercedes.FindFirstHittableTicks( ply, cmd )
    local tickcount = #mercedes.btrecords[ ply ]

    if not tickcount then return 1 end

    for i = 1, tickcount do
        if mercedes.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function mercedes.FindClosestHittableTicks( ply, cmd )
        local mypos = me:EyePos()
        local records = mercedes.btrecords[ ply ]
        local firstticks = mercedes.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if not tickcount or not firstticks then return 1 end

        lastdist = math_huge
    
        for i = 1, tickcount - firstticks do
            local mt = i + firstticks

            if ( records[ mt ].aimpos ):DistToSqr( mypos ) < lastdist then
                lastdist = ( records[ mt ].aimpos ):DistToSqr( mypos )
                lasttick = mt
            end
        end

        return lasttick
    end
end

function mercedes.SelectTarget( cmd )
    local plys = mercedes.GetSortedPlayers( mercedes.cfg.vars["Target selection"] )
    mercedes.target     = false


    if not plys then return end 

    local maxplys       = mercedes.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys ~= 0 and curplys > maxplys then
        curplys = maxplys
    end

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]
        --mega build mode check
        if not IsValid(ply) then continue end
        if ply:GetNWBool("_Kyle_Buildmode") then continue end

        if not mercedes.cfg.vars["Always backtrack"] then
            local bones = mercedes.GetBones( ply ) or {}

            for o = 1, #bones do
                local bone = bones[o]
                if not bone or not isvector(bone) then continue end
                aimAng = ( bone - me:EyePos() ):Angle()

                if mercedes.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then 
                    mercedes.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end
        end

        if mercedes.cfg.vars["Backtrack"] then
            local ticks = mercedes.FindBacktrack( cmd, ply )

            if mercedes.btrecords[ ply ] and not ply.break_lc then 
                local ts = 0 
                
                if mercedes.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not mercedes.btrecords[ ply ][ p ] then continue end

                        aimAng = ( mercedes.btrecords[ ply ][ p ].aimpos - me:EyePos() ):Angle()

                        mercedes.traceStruct.start = me:EyePos()
                        mercedes.traceStruct.endpos = mercedes.btrecords[ ply ][ p ].aimpos
                        mercedes.traceStruct.filter = me
                        mercedes.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( mercedes.traceStruct )

                        if not tr.Hit or tr.Entity == ply then
                            mercedes.target = ply
                            mercedes.backtracktick = p

                            return ply, mercedes.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                        end
                    end
                end

                if mercedes.cfg.vars["Backtrack mode"] == 3 then return end

                if mercedes.cfg.vars["Backtrack mode"] == 1 then
                    ts = mercedes.FindFirstHittableTicks( ply, cmd )
                elseif mercedes.cfg.vars["Backtrack mode"] == 2 then
                    ts = mercedes.FindClosestHittableTicks( ply, cmd )
                end

                if not mercedes.btrecords[ ply ][ ts ] then return end

                aimAng = ( mercedes.btrecords[ ply ][ ts ].aimpos - me:EyePos() ):Angle()

                mercedes.traceStruct.start = me:EyePos()
                mercedes.traceStruct.endpos = mercedes.btrecords[ ply ][ ts ].aimpos
                mercedes.traceStruct.filter = me
                mercedes.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( mercedes.traceStruct )

                if not tr.Hit or tr.Entity == ply then
                    mercedes.target = ply
                    mercedes.backtracktick = ts

                    return ply, mercedes.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
                end
            end
        end
        
	end
end

function mercedes.IsMovementKeysDown( cmd )

    if cmd:KeyDown( IN_MOVERIGHT ) then
        return true 
    end 
    
    if cmd:KeyDown( IN_MOVELEFT ) then
        return true 
    end 

    if cmd:KeyDown( IN_FORWARD ) then
        return true 
    end 

    if cmd:KeyDown( IN_BACK ) then
        return true 
    end 

    return false
end

function mercedes.MovementFix( cmd, wish_yaw )

	local pitch = math_NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1
	
	if ( pitch > 89 or pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math_rad( math_NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math_cos( ang_diff ) * inverted + sidemove * math_sin( ang_diff )
	local new_sidemove = forwardmove * math_sin( ang_diff ) * inverted + sidemove * math_cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function mercedes.SilentAngles(cmd)
	if not mercedes.SilentAngle then mercedes.SilentAngle = cmd:GetViewAngles() end

	mercedes.SilentAngle = mercedes.SilentAngle + Angle( cmd:GetMouseY() * mercedes.myaw, cmd:GetMouseX() * -mercedes.myaw, 0)
	mercedes.SilentAngle.p = math_Clamp( mercedes.SilentAngle.p, -89, 89 )
    mercedes.SilentAngle.r = 0
    
    mercedes.SilentAngle:Normalize()
end

// Обновление SilentAngle из мыши в CreateMove (как в hvhobkak) — без этого аимбот/сайлент не работают
function mercedes.DoSilentAngleUpdate( UserCmd )
    if not IsValid( me ) or not me:IsPlayer() then return end

    if not mercedes.SilentAngle then
        mercedes.SilentAngle = Angle( UserCmd:GetViewAngles().x, UserCmd:GetViewAngles().y, UserCmd:GetViewAngles().z )
    end

    local pWeapon = me:GetActiveWeapon()

    if ( IsValid( pWeapon ) ) then
        if ( pWeapon.FreezeMovement and pWeapon:FreezeMovement() ) then 
            return 
        end

        local bIsInUse = UserCmd:KeyDown( IN_USE ) or me:KeyDown(IN_USE)

        if ( pWeapon:GetClass() == "weapon_physgun" and bIsInUse ) then
            if ( pWeapon.GetInternalVariable and IsValid( pWeapon:GetInternalVariable( "m_hGrabbedEntity" ) ) ) then 
                return 
            end
        end
    end

    local mYaw = GetConVar( "m_yaw" ):GetFloat()
    local mPitch = GetConVar( "m_pitch" ):GetFloat()

    local silentAngle = mercedes.SilentAngle

    silentAngle.x = math_Clamp( silentAngle.x + UserCmd:GetMouseY() * mPitch, -89, 89 )
    silentAngle.y = silentAngle.y + UserCmd:GetMouseX() * -mYaw
    silentAngle.r = 0
    
    silentAngle:Normalize()

    return silentAngle
end

// Knife bot ( Etot zaichik knifer )

mercedes.knifes = {}

mercedes.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

mercedes.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

mercedes.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

function mercedes:EntityFaceBack( ent )
    local angle = me:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function mercedes.CanStab( ent, pos, health )
    local mypos = me:GetShootPos()
    local tbl = mercedes.knifes[1]
    local wc = me:GetActiveWeapon():GetClass()
    local canuse = false 

    for i = 1, #mercedes.knifes do
        if StartsWith(wc,mercedes.knifes[i].str) then
            canuse = true 
            tbl = mercedes.knifes[i]
            break
        end
    end 

    if not canuse then return false, false end

    if mercedes.canBacktrack( ent ) and mercedes.btrecords[ent][mercedes.backtracktick] then
        pos = mercedes.btrecords[ ent ][ mercedes.backtracktick ].aimpos
    end

    local backstab = tbl.canbackstab and mercedes:EntityFaceBack( ent ) or false
    local dist = mypos:DistToSqr( pos )
    local mode = mercedes.cfg.vars["Knifebot mode"]
    
    if mode == 1 then // Damage mode - tries to inflict biggest possible damage
        if backstab and dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist or  ( dist < tbl.rightdist and health - tbl.leftdmg > 0 )  then 
            return true, true
        end
    elseif mode == 2 then // Fast - tries to hit fast as possible
        if dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist then
            return true, false
        end
    elseif mode == 3 then // Fatal - deals only fatal damage
        if dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist and ( ( backstab and health - tbl.rightdmgb <= 0 ) or ( health - tbl.rightdmg <= 0 ) ) then
            return true, true
        end
    end

    return false, false
end

function mercedes.simtimeCheck( v )
    if not mercedes.cfg.vars["Wait for simtime update"] then return true end

    return v.simtime_updated
end

// Crossbow prediction 

function mercedes.CrossbowPred( cmd )
    if not mercedes.CanShoot( cmd ) then return end

    local plys = mercedes.GetSortedPlayers( mercedes.cfg.vars["Target selection"] )

    if not plys then return end

    for i = 1, #plys do
        local ply = plys[i][1]

        local eyePos        = me:EyePos()

        local plyPos        = ply:GetPos()
        local plyCenter     = ply:OBBCenter()

        local aimPos        = plyPos + plyCenter
        local aimAngle      = ( aimPos - eyePos ):Angle()
        local aimVector     = aimAngle:Forward()

        // Проверка видимости цели
        if not mercedes.VisibleCheck( ply, aimPos, nil, aimAngle:Forward() ) then
            continue
        end

        // Проверка FOV лимита
        if mercedes.cfg.vars["Fov limit"] then
            local fov = mercedes.cfg.vars["Aimbot FOV"]
            local view = mercedes.cfg.vars["Silent aim"] and mercedes.SilentAngle or cmd:GetViewAngles()
            local ang = aimAngle - view
            ang:Normalize()
            local fovDist = math_sqrt(ang.x * ang.x + ang.y * ang.y)
            
            if fovDist > fov then
                continue
            end
        end

        local velStart      = aimVector * 3500

        local distance      = eyePos:Distance( aimPos )
        local travelTime    = distance / 3500

        // Movement simulation 
        local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if predTime > mercedes.cfg.vars["Simulation limit"] then continue end

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, mercedes.TIME_TO_TICKS( predTime ) do
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()

        aimPos              = data.m_vecAbsOrigin + plyCenter
        distance            = eyePos:Distance( aimPos )
        travelTime          = distance / 3500

        ded.FinishSimulation()

        // Gravity simulation
        local gravity       = GetConVar("sv_gravity"):GetFloat() * 0.05
        gravity             = ( gravity * TickInterval ) * mercedes.TIME_TO_TICKS( travelTime )

        aimPos.z            = aimPos.z + gravity

        // Проверка видимости предсказанной позиции
        local finalVec = Vector( aimPos.x, aimPos.y, aimPos.z )
        local finalAng = ( finalVec - eyePos ):Angle()
        finalAng:Normalize()
        
        // Проверка видимости финальной позиции
        mercedes.traceStruct.start = eyePos
        mercedes.traceStruct.endpos = finalVec
        mercedes.traceStruct.filter = me
        mercedes.traceStruct.mask = MASK_SHOT
        
        local tr = TraceLine( mercedes.traceStruct )
        
        // Если стена на пути, не стреляем
        if tr.Hit and tr.Entity != ply then
            continue
        end

        // Aimbot 

        debugoverlay.Line( plyPos + plyCenter, finalVec, 0.1, color_white, true )

        cmd:SetViewAngles( finalAng )
        
        // Auto fire для арбалета
        if mercedes.cfg.vars["Auto fire"] then
            cmd:AddKey( IN_ATTACK )
        end
        
        // Выходим после первой валидной цели
        return
    end
end

// Bugbait prediction

// Данные для визуализации траектории
mercedes.bugbaitTrajectory = {}
mercedes.bugbaitImpactPos = nil
mercedes.bugbaitStartPos = nil
mercedes.bugbaitThrowStartTime = nil
mercedes.bugbaitFinalAngle = nil
mercedes.bugbaitThrowDelay = 0.3 // Задержка перед броском (в секундах)
mercedes.bugbaitThrowExecuted = false // Флаг, что бросок уже был выполнен
mercedes.bugbaitClickTime = 0.05 // Время короткого клика для броска

local function GetBugbaitMuzzlePos(ent)
    if not IsValid(ent) then return Vector(0, 0, 0) end
    
    local attach_id = ent:LookupAttachment("muzzle")
    if attach_id and attach_id > 0 then
        local attach = ent:GetAttachment(attach_id)
        if attach then
            return attach.Pos
        end
    end
    
    local pos = ent:GetPos()
    local ang = ent:GetAngles()
    return pos + ang:Forward() * 16 + ang:Right() * 6 - ang:Up() * 6
end

function mercedes.BugbaitPred( cmd )
    // Специальная проверка для bugbait (игнорируем badSweps)
    if not mercedes.activeWeapon then 
        mercedes.bugbaitThrowStartTime = nil
        mercedes.bugbaitFinalAngle = nil
        return 
    end
    if mercedes.activeWeaponClass ~= "weapon_bugbait" then 
        mercedes.bugbaitThrowStartTime = nil
        mercedes.bugbaitFinalAngle = nil
        return 
    end
    
    // Наводится только когда игрок нажимает кнопку атаки (кидает)
    if not cmd:KeyDown( IN_ATTACK ) then 
        mercedes.bugbaitTrajectory = {}
        mercedes.bugbaitImpactPos = nil
        mercedes.bugbaitThrowStartTime = nil
        mercedes.bugbaitFinalAngle = nil
        mercedes.bugbaitThrowExecuted = false
        return 
    end
    
    // Инициализируем время начала задержки при первом нажатии
    if not mercedes.bugbaitThrowStartTime then
        mercedes.bugbaitThrowStartTime = CurTime()
        mercedes.bugbaitThrowExecuted = false
    end
    
    // Проверяем, прошла ли задержка
    local timeSincePress = CurTime() - mercedes.bugbaitThrowStartTime
    local shouldThrow = timeSincePress >= mercedes.bugbaitThrowDelay
    local isClickTime = shouldThrow and not mercedes.bugbaitThrowExecuted and timeSincePress < (mercedes.bugbaitThrowDelay + mercedes.bugbaitClickTime)
    
    if mercedes.cfg.binds["Aim on key"] != 0 and not mercedes.IsKeyDown( mercedes.cfg.binds["Aim on key"] ) then
        return false
    end
    
    if mercedes.moveType == MOVETYPE_NOCLIP then
        return false
    end

    local plys = mercedes.GetSortedPlayers( mercedes.cfg.vars["Target selection"] )

    if not plys then 
        mercedes.bugbaitTrajectory = {}
        mercedes.bugbaitImpactPos = nil
        return 
    end

    // Получаем позицию выстрела из viewmodel
    local vm = me:GetViewModel()
    local startPos = me:EyePos()
    if IsValid(vm) then
        startPos = GetBugbaitMuzzlePos(vm)
    end
    
    mercedes.bugbaitStartPos = startPos

    for i = 1, #plys do
        local ply = plys[i][1]

        local plyPos        = ply:GetPos()
        local plyCenter     = ply:OBBCenter()
        local aimPos        = plyPos + plyCenter
        local aimAngle      = ( aimPos - startPos ):Angle()
        local aimVector     = aimAngle:Forward()

        // Проверка видимости цели
        if not mercedes.VisibleCheck( ply, aimPos, nil, aimAngle:Forward() ) then
            continue
        end

        // Проверка FOV лимита
        if mercedes.cfg.vars["Fov limit"] then
            local fov = mercedes.cfg.vars["Aimbot FOV"]
            local view = mercedes.cfg.vars["Silent aim"] and mercedes.SilentAngle or cmd:GetViewAngles()
            local ang = aimAngle - view
            ang:Normalize()
            local fovDist = math_sqrt(ang.x * ang.x + ang.y * ang.y)
            
            if fovDist > fov then
                continue
            end
        end

        // Параметры броска bugbait (из bug.lua)
        local baseThrowSpeed = 1000 // Базовая скорость броска
        local gravity         = 600  // Гравитация (положительное значение для расчетов)
        local gravityVec      = Vector(0, 0, -600) // Вектор гравитации
        
        // Учитываем скорость игрока при броске (как в bug.lua)
        local myVel = me:GetVelocity()
        
        // Итеративный расчет с учетом движения цели и времени полета
        local predictedAimPos = aimPos
        local bestVelocity = nil
        local bestTravelTime = 0
        
        // Итеративно находим правильную траекторию
        for iteration = 1, 5 do
            // Рассчитываем расстояние до предсказанной позиции
            local horizontalDist = Vector(predictedAimPos.x - startPos.x, predictedAimPos.y - startPos.y, 0):Length()
            local verticalDist = predictedAimPos.z - startPos.z
            
            if horizontalDist < 0.1 then
                // Если цель прямо над/под нами
                local finalAng = (predictedAimPos - startPos):Angle()
                finalAng:Normalize()
                cmd:SetViewAngles( finalAng )
                if mercedes.cfg.vars["Auto fire"] then
                    cmd:AddKey( IN_ATTACK )
                end
                return
            end
            
            // Расчет угла броска для параболической траектории
            // Формула: y = x*tan(θ) - (g*x²)/(2*v²*cos²(θ))
            local g = gravity
            local v = baseThrowSpeed
            local x = horizontalDist
            local y = verticalDist
            
            // Коэффициенты квадратного уравнения для tan(θ)
            local a = (g * x * x) / (2 * v * v)
            local b = -x
            local c = a + y
            
            local discriminant = b * b - 4 * a * c
            
            if discriminant < 0 then 
                // Невозможно попасть с текущей скоростью, пробуем следующую итерацию
                if iteration < 5 then continue else break end
            end
            
            local sqrtD = math_sqrt(discriminant)
            local tan1 = (-b + sqrtD) / (2 * a)
            local tan2 = (-b - sqrtD) / (2 * a)
            
            // Выбираем более высокий угол (для более высокого броска)
            local tanAngle = math_max(tan1, tan2)
            local launchAngle = math_atan(tanAngle)
            
            // Направление к цели в горизонтальной плоскости
            local dirToTarget = Vector(predictedAimPos.x - startPos.x, predictedAimPos.y - startPos.y, 0)
            dirToTarget:Normalize()
            
            // Создаем вектор направления с учетом угла броска
            local forward = dirToTarget * math_cos(launchAngle)
            local up = Vector(0, 0, 1) * math_sin(launchAngle)
            local throwDir = forward + up
            throwDir:Normalize()
            
            // Начальная скорость с учетом направления (как в bug.lua)
            local throwVelocity = throwDir * baseThrowSpeed
            
            // Добавляем скорость игрока (как в bug.lua)
            local forwardVel = myVel:Dot(throwDir) * 0.3
            local rightVel = myVel:Dot(throwDir:Angle():Right()) * 0.2
            throwVelocity = throwVelocity + throwDir * forwardVel
            throwVelocity = throwVelocity + throwDir:Angle():Right() * rightVel
            
            // Рассчитываем время полета
            local actualSpeed = throwVelocity:Length()
            local travelTime = horizontalDist / (actualSpeed * math_cos(launchAngle))
            
            // Симулируем движение цели на время полета + задержку сети
            local predTime = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime
            
            if predTime > mercedes.cfg.vars["Simulation limit"] then 
                if iteration < 5 then continue else break end
            end
            
            ded.StartSimulation( ply:EntIndex() )
            
            for i = 1, mercedes.TIME_TO_TICKS( predTime ) do
                ded.SimulateTick()
            end
            
            local data = ded.GetSimulationData()
            local newAimPos = data.m_vecAbsOrigin + plyCenter
            
            ded.FinishSimulation()
            
            // Проверяем, изменилась ли позиция значительно
            local posChange = newAimPos:Distance(predictedAimPos)
            predictedAimPos = newAimPos
            
            // Сохраняем лучшую скорость
            bestVelocity = throwVelocity
            bestTravelTime = travelTime
            
            // Если позиция стабилизировалась, выходим
            if posChange < 5 or iteration >= 5 then
                break
            end
        end
        
        if not bestVelocity then continue end
        
        // Используем лучшую найденную скорость
        local velocity = bestVelocity
        aimPos = predictedAimPos
        
        // Симулируем траекторию для визуализации (как в bug.lua)
        local trajectory = {startPos}
        local pos = startPos
        local vel = Vector(velocity.x, velocity.y, velocity.z)
        local timeStep = 0.05
        local impactFound = false
        local impactPos = nil
        
        for i = 0, 100 do
            local nextPos = pos + vel * timeStep + 0.5 * gravityVec * timeStep^2
            vel = vel + gravityVec * timeStep
            
            local tr = util.TraceLine({
                start = pos,
                endpos = nextPos,
                filter = me
            })
            
            table.insert(trajectory, nextPos)
            
            if tr.Hit and not impactFound then
                impactPos = tr.HitPos
                impactFound = true
            end
            
            if impactFound then break end
            pos = nextPos
        end
        
        // Сохраняем траекторию для визуализации
        mercedes.bugbaitTrajectory = trajectory
        mercedes.bugbaitImpactPos = impactPos
        
        // Вычисляем финальный угол на основе начальной скорости
        local finalAng = velocity:Angle()
        finalAng:Normalize()
        
        // Проверка видимости финальной позиции
        mercedes.traceStruct.start = startPos
        mercedes.traceStruct.endpos = aimPos
        mercedes.traceStruct.filter = me
        mercedes.traceStruct.mask = MASK_SHOT
        
        local tr = TraceLine( mercedes.traceStruct )
        
        // Если стена на пути, не стреляем (но пропускаем небольшие препятствия)
        if tr.Hit and tr.Entity ~= ply and tr.Fraction < 0.8 then
            continue
        end

        // Сохраняем финальный угол для использования
        mercedes.bugbaitFinalAngle = finalAng
        
        // Применяем прицеливание (pSilent или обычное)
        if mercedes.cfg.vars["pSilent"] then
            // pSilent — как в hvhobkak: только SetContextVector, не трогаем SilentAngle
            ded.SetContextVector( cmd, finalAngle:Forward(), true )
        else
            // Обычное прицеливание
            cmd:SetViewAngles( finalAng )
        end
        
        // Логика броска с задержкой
        if shouldThrow and not mercedes.bugbaitThrowExecuted then
            // Время для короткого клика - симулируем нажатие для броска
            if isClickTime then
                // Добавляем кнопку атаки для выполнения броска
                cmd:AddKey( IN_ATTACK )
                mercedes.bugbaitThrowExecuted = true
            else
                // После короткого клика убираем кнопку, но продолжаем наводиться
                cmd:RemoveKey( IN_ATTACK )
            end
        elseif shouldThrow and mercedes.bugbaitThrowExecuted then
            // После выполнения броска продолжаем наводиться, но не бросаем
            cmd:RemoveKey( IN_ATTACK )
        else
            // Во время задержки убираем кнопку атаки, только наводимся
            cmd:RemoveKey( IN_ATTACK )
        end
        
        // Выходим после первой валидной цели
        return
    end
    
    // Если не нашли цель, очищаем траекторию
    mercedes.bugbaitTrajectory = {}
    mercedes.bugbaitImpactPos = nil
end

// Propkill aimbot

mercedes.grabbingEnt = false 

function mercedes.DrawPhysgunBeamFunc( ply, wep, e, tar, bone, hitpos )
    if ply != me then return end 

    mercedes.grabbingEnt = IsValid( tar ) and tar or false
end

mercedes.predictedPoint = {}
function mercedes.PropAim( cmd )
    if not mercedes.grabbingEnt or not IsValid( mercedes.grabbingEnt ) or not cmd:KeyDown( IN_ATTACK ) then return end
    if not IsValid( me ) or not me:IsPlayer() or me == NULL then return end

    local plys = mercedes.GetSortedPlayers( mercedes.cfg.vars["Target selection"] )
    mercedes.target = false
    mercedes.targetVector = false

    if not plys then return end

    for i = 1, #plys do
        local ply           = plys[i][1]
        if not IsValid( ply ) or not ply:IsPlayer() or ply == NULL then continue end
        print( ply )

        local eyePos        = me:EyePos() 

        local plyPos        = ply:GetPos()
        local plyVel        = ply:GetVelocity()
        local plyCenter     = ply:OBBCenter()
        local plySpeed      = plyVel:Length()
        //local plyPred       = plyPos + plyVel * TickInterval

        local propPos       = mercedes.grabbingEnt:GetPos()
        local propVel       = mercedes.grabbingEnt:GetVelocity()
        local propSpeed     = propVel:Length()

        local distance      = plyPos:Distance( propPos )
        local plydist       = plyPos:Distance( eyePos )

        if plydist >= 4096 then continue end

        local travelTime    = distance / propSpeed
        //local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if travelTime > mercedes.cfg.vars["Simulation limit"] then continue end // predTime

        // Prediction

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, mercedes.TIME_TO_TICKS( travelTime ) do // predTime
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()
        local aimPos        = data.m_vecAbsOrigin + plyCenter

        distance            = aimPos:Distance( propPos )
        travelTime          = distance / propSpeed

        ded.FinishSimulation()

        // Mouse wheel shit

        local deltaDistance = plydist - distance
        local scrollDelta = 13337

        // Aim

        local aimAng        = ( aimPos - me:EyePos() ):Angle()
        aimAng:Normalize()

        cmd:SetMouseWheel( scrollDelta ) 
        cmd:SetViewAngles( aimAng )

        if deltaDistance < mercedes.cfg.vars["PA thrower dist"] and mercedes.cfg.vars["PA thrower"] then
            cmd:RemoveKey( IN_ATTACK )
        end


    end
end





function mercedes.Aim(cmd)
    if not IsValid( me ) or not me:IsPlayer() or me == NULL then return end
    
    mercedes.AntiAim(cmd)

    if mercedes.SendPacket then
        mercedes.fakeAngles.angle = cmd:GetViewAngles()
        mercedes.fakeAngles.movex = me:GetPoseParameter("move_x")
        mercedes.fakeAngles.movey = me:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if me:IsValidLayer(i) then
                layers[i] = {
                    cycle = me:GetLayerCycle(i),
                    sequence = me:GetLayerSequence(i),
                    weight = me:GetLayerWeight(i)
                }
            end
        end

        mercedes.fakeAngles.origin = me:GetNetworkOrigin()
        mercedes.fakeAngles.seq = me:GetSequence()
        mercedes.fakeAngles.cycle = me:GetCycle()
    else
        mercedes.realAngle = cmd:GetViewAngles()
    end

    local ply, bone, aimang, backtracking, bttick = mercedes.SelectTarget(cmd)

    mercedes.targetVector = bone 

    if not aimang then return end

    aimang:Normalize()  

    if not mercedes.cfg.vars["Enable aimbot"] or not ply then return end
    if not IsValid( ply ) or not ply:IsPlayer() or ply == NULL then return end

    local oldangs = Angle(aimang)

    if mercedes.cfg.vars["Always backtrack"] and not backtracking then return end

    if mercedes.cfg.vars["Fov limit"] then
        local fov = mercedes.cfg.vars["Aimbot FOV"]

		local view = mercedes.cfg.vars["Silent aim"] and mercedes.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math_sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            mercedes.targetVector = false
		    return 
        end
    end

    if not mercedes.CanShoot(cmd) or not mercedes.simtimeCheck( ply ) then return end
    if not mercedes.cfg.vars["Aimbot smoothing"] and mercedes.SkipCommand then return end

    mercedes.aimingrn = true

    // Knife bot 
    local altfire = false
    local canstab, rightstab = mercedes.CanStab( ply, bone, IsValid(ply) and ply:Health() or 0 )

    if mercedes.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif mercedes.cfg.vars["Knifebot"] and not canstab then
        return 
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if mercedes.cfg.vars["Norecoil"] then
        finalAngle = mercedes.NoRecoil(finalAngle)
    end

    if mercedes.cfg.vars["Force seed"] then
        //ded.ForceSeed( cmd )
    end

    if mercedes.cfg.vars["Nospread"] then
        finalAngle = mercedes.NoSpread(cmd,finalAngle)
    end

    if mercedes.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end
    
    if mercedes.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if mercedes.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = mercedes.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )
        
        finalAngle = ret
    end

    if mercedes.cfg.vars["Projectile aimbot"] then
        local predTime = math.ceil( ( me:EyePos() ):DistToSqr( ply:GetPos() ) / 3600 )

        print( predTime )

        //if predTime > 15 then return end

        ded.StartSimulation( ply:EntIndex() )

        for tick = 1, predTime do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()
        local vec = data.m_vecAbsOrigin

        ded.FinishSimulation()

        local g = predTime * 0.111

        print( vec.z, g )

        vec.z = vec.z + g 

        finalAngle = ( vec - me:EyePos() ):Angle()
        finalAngle:Normalize()  
    end

    //ded.SetContextMenu( cmd, mercedes.cfg.vars["pSilent"] or mercedes.cfg.vars["Facestab"] )
    if mercedes.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif mercedes.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = mercedes.btrecords[ply][bttick].simulationtime
        timeOffset = ded.GetServerTime(cmd) - targetTime

        serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - mercedes.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = mercedes.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ded.GetServerTime(cmd) - targetTime))
            local tick = mercedes.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif mercedes.cfg.vars["Adjust tickcount"] then
        //if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")

            ded.SetCommandTick(cmd, mercedes.TIME_TO_TICKS( ded.GetSimulationTime( ply:EntIndex() ) ) )
        //else
        //    ded.NetSetConVar("cl_interpolate","1")
        //    ded.NetSetConVar("cl_interp",tostring(ded.GetServerTime(cmd) - targetTime))

        //    local tick = mercedes.TIME_TO_TICKS(ded.GetServerTime(cmd))
        //    ded.SetCommandTick(cmd, tick - 1)
        //end
    end

    if mercedes.cfg.vars["Auto fire"] then

        local w = me:GetActiveWeapon():GetClass()

        if StartsWith( w, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

       // mercedes.SendPacket = true
        me.simtime_updated = true
        ded.UpdateClientAnimation( me:EntIndex() )

        if mercedes.cfg.vars["Resolver"] then 
            ply.aimshots = (ply.aimshots or 0) + 1
        end

        cmd:AddKey( altfire and IN_ATTACK2 or IN_ATTACK ) 

        mercedes.SkipCommand = true 
    end
end

function mercedes.autoReload(cmd)
    if not mercedes.cfg.vars["Auto reload"] then return end

	local wep = me:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and me:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end

// adaptive Cstrafe

mercedes.last_ground_pos = 0
mercedes.cstrafe_dir = 0

function mercedes.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

	local forward = viewangles:Forward()
	local right = viewangles:Right()
	
	local fmove = 0
	local smove = ( dir == 1 ) && -10000 or 10000
	
	forward.z = 0
	right.z = 0
	
	forward:Normalize()
	right:Normalize()

	local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
	local wishspeed = wishdir:Length()
	
	wishdir:Normalize()
	
	if ( wishspeed != 0 && wishspeed > maxspeed ) then
		wishspeed = maxspeed
	end
	
	local wishspd = wishspeed
	
	if ( wishspd > 30 ) then
		wishspd = 30
	end
	
	local currentspeed = velocity:Dot( wishdir )
	local addspeed = wishspd - currentspeed
	
	if ( addspeed <= 0 ) then
		return velocity
	end
	
	local accelspeed = accel * wishspeed * TickInterval
	
	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end
	
	return velocity + ( wishdir * accelspeed )

end
    
function mercedes.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = me:GetMaxSpeed()
	local jump_power = me:GetJumpPower()

	local origin = me:GetNetworkOrigin()
	local velocity = me:GetAbsVelocity()
	
	local mins = me:OBBMins()
	local maxs = me:OBBMaxs()

    local pticks = math_Round(mercedes.cfg.vars["CStrafe ticks"])
	
	local on_ground = me:IsFlagSet( FL_ONGROUND )
	
	for i = 1, pticks do

		viewangles.y = math_NormalizeAngle( math_deg( math_atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )

		if ( on_ground ) then
		
			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )
			
		end

		velocity = mercedes.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )
		
		local endpos = origin + ( velocity * TickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = me,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		if ( ( pm.Fraction ~= 1 and pm.HitNormal.z <= 0.9 ) or pm.AllSolid or pm.StartSolid ) then
			return false
		end
		
		if ( pm.Fraction ~= 1 ) then
		
			local time_left = TickInterval

			for j = 1, 2 do
			
				time_left = time_left - ( time_left * pm.Fraction )

				local dot = velocity:Dot( pm.HitNormal )
				
				velocity = velocity - ( pm.HitNormal * dot )

				dot = velocity:Dot( pm.HitNormal )

				if ( dot < 0 ) then
					velocity = velocity - ( pm.HitNormal * dot )
				end

				endpos = pm.HitPos + ( velocity * time_left )

				pm = TraceHull( {
					start = pm.HitPos,
					endpos = endpos,
					filter = me,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				} )

				if ( pm.Fraction == 1 or pm.AllSolid or pm.StartSolid ) then
					break
				end
			
			end
			
		end
		
		origin = pm.HitPos
		
		if ( ( mercedes.last_ground_pos - origin.z ) > math_Round(mercedes.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end
		
		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = me,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		on_ground = ( ( pm.Fraction < 1 or pm.AllSolid or pm.StartSolid ) and pm.HitNormal.z >= 0.7 )
		
		velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )
		
		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end

function mercedes.CircleStrafe( cmd )

	local angle = 0
	
	while ( mercedes.cstrafe_dir < 2 ) do
	
		angle = 0
		local path_found = false
		local step = ( mercedes.cstrafe_dir == 1 ) and math_Round(mercedes.cfg.vars["CStrafe angle step"]) or -math_Round(mercedes.cfg.vars["CStrafe angle step"])
		
		while ( true ) do
		
			if ( mercedes.cstrafe_dir == 1 ) then
			
				if ( angle > math_Round(mercedes.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			else
			
				if ( angle < -math_Round(mercedes.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			end

			if ( mercedes.PredictMovement( cmd:GetViewAngles(), mercedes.cstrafe_dir, angle ) ) then
			
				path_found = true
				break
			
			end

			angle = angle + step
		
		end
		
		if ( path_found ) then
			break
		end
		
		mercedes.cstrafe_dir = mercedes.cstrafe_dir + 1
	
	end
	
	if ( mercedes.cstrafe_dir < 2 ) then
	
		local velocity = me:GetAbsVelocity()
		local viewangles = cmd:GetViewAngles()
		
		viewangles.y = math_NormalizeAngle( math_deg( math_atan2( velocity.y, velocity.x ) ) + angle )
		
		cmd:SetViewAngles( viewangles )
		cmd:SetSideMove( ( mercedes.cstrafe_dir == 1 ) and -10000 or 10000 )
	
	else
	
		mercedes.cstrafe_dir = 0
	
	end

end

do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function mercedes.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( mercedes.IsKeyDown(mercedes.cfg.binds["Circle strafe"]) and mercedes.cfg.vars["Circle strafe"] ) then
        
            mercedes.CircleStrafe( cmd )
    
        elseif ( mercedes.IsKeyDown(mercedes.cfg.binds["Z Hop"]) and mercedes.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14
            
            cmd:SetSideMove( 5000 * math_sin(handler) )
        elseif mercedes.cfg.vars["Air strafer"] and mercedes.cfg.vars["Strafe mode"] == 3 then
    
            local get_velocity_degree = function(velocity)
                local tmp = math_deg(math_atan(30.0 / velocity))
                    
                if (tmp > 90.0) then
                    return 90.0
                elseif (tmp < 0.0) then
                    return 0.0
                else
                    return tmp
                end
            end
    
            local M_RADPI = 57.295779513082
            local side_speed = 10000
            local velocity = me:GetVelocity()
            velocity.z = 0.0
    
            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()
    
            if (not forwardmove or not sidemove) then
                return
            end
    
            if(velocity:Length2D() <= 15.0 and not (forwardmove ~= 0 or sidemove ~= 0)) then
                return
            end
    
            local flip = cmd:TickCount() % 2 == 0
    
            local turn_direction_modifier = flip and 1.0 or -1.0
            local viewangles = Angle(mercedes.SilentAngle.x, mercedes.SilentAngle.y, mercedes.SilentAngle.z)
    
            if (forwardmove or sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)
    
                local turn_angle = math_atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end
    
            local strafe_angle = math_deg(math_atan(15 / velocity:Length2D()))
    
            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end
    
            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math_NormalizeAngle(temp.y)
    
            local yaw_delta = temp.y
            old_yaw = viewangles.y
    
            local abs_yaw_delta = math_abs(yaw_delta)
    
            if (abs_yaw_delta <= strafe_angle or abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()
    
                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math_NormalizeAngle(temp.y)
    
                local velocityangle_yawdelta = temp.y
                local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
    
                if (velocityangle_yawdelta <= velocity_degree or velocity:Length2D() <= 15) then
                    if (-velocity_degree <= velocityangle_yawdelta or velocity:Length2D() <= 15) then
                        viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                        cmd:SetSideMove(side_speed * turn_direction_modifier)
                    else
                        viewangles.y = velocity_angles.y - velocity_degree
                        cmd:SetSideMove(side_speed)
                    end
                else
                    viewangles.y = velocity_angles.y + velocity_degree
                    cmd:SetSideMove(-side_speed)
                end
            elseif (yaw_delta > 0) then
                cmd:SetSideMove(-side_speed)
            elseif (yaw_delta < 0) then
                cmd:SetSideMove(side_speed)
            end
    
            local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
            local speed = move:Length()
    
            local angles_move = move:Angle()
    
            local normalized_x = math.modf(mercedes.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(mercedes.SilentAngle.y + 180, 360) - 180
    
            local yaw = math_rad(normalized_y - viewangles.y + angles_move.y)
    
            if (normalized_x >= 90 or normalized_x <= -90 or mercedes.SilentAngle.x >= 90 and mercedes.SilentAngle.x <= 200 or mercedes.SilentAngle.x <= -90 and mercedes.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math_cos(yaw) * speed)
            else
                cmd:SetForwardMove(math_cos(yaw) * speed)
            end
    
            cmd:SetSideMove(math_sin(yaw) * speed)

        elseif mercedes.cfg.vars["Air strafer"] and mercedes.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if me:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / me:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) and -400 or 400)
            end

        end
    end
end

mercedes.aatarget = nil

function mercedes.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * TickInterval
end

function mercedes.PredictedEyePos()
    return me:EyePos() + me:GetVelocity() * TickInterval
end

function mercedes.GetBaseYaw()
    if not IsValid( mercedes.aatarget ) or mercedes.cfg.vars["Yaw base"] != 2 then
        return mercedes.SilentAngle.y
    end

    return math_NormalizeAngle( (mercedes.PredictedPos(mercedes.aatarget) - mercedes.PredictedEyePos()):Angle().y )
end

function mercedes.Freestand(cmd)
	if not IsValid(mercedes.aatarget) then return false end

	local headpos = me:GetBonePosition(me:LookupBone("ValveBiped.Bip01_Head1"))
	if not headpos then return end

	local selfpos = me:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = mercedes.aatarget:WorldToLocal(selfpos)
	local bearing = math_deg(-math_atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math_rad(yaw)
		local x, y = math_sin(yaw), math_cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = TraceLine({
			start = mercedes.aatarget:EyePos() + mercedes.aatarget:GetVelocity() * TickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = mercedes.aatarget
		})

		return tr.Fraction < 1 and tr.Entity ~= me
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = me:WorldToLocal(headpos)
		if headlocal.x > 0 then
			left, right = right, left
		end
	end

	if leftcheck and rightcheck then
		return false
	elseif leftcheck then
		return true, left , right
	elseif rightcheck then
		return true, right, left
	end

	return false
end

mercedes.realAngle = me:EyeAngles()
mercedes.inverted = false
mercedes.oldYaw = 0
mercedes.SwaySide = 1

local baseyaw = 0

mercedes.CalcYaw = {
    // Backward
    [1] = function( cmd ) 
        return baseyaw - 178 
    end, 
    // Fake forward
    [2] = function( cmd )
        return mercedes.SendPacket and baseyaw or baseyaw + 178 
    end, 
    // Legit Delta
    [3] = function( cmd )     
        return mercedes.SendPacket and baseyaw or baseyaw + ( mercedes.inverted and 43 or - 43 )
    end,
    // Sideways 
    [4] = function( cmd )     
        local delta = mercedes.inverted and 89 or -89
        return baseyaw - ( mercedes.SendPacket and delta or -delta ) 
    end,
    // Half Sideways
    [5] = function( cmd )     
        local delta = mercedes.inverted and 89 or -89
        return baseyaw - ( mercedes.SendPacket and delta or 178 ) 
    end,
    // Fake Spin
    [6] = function( cmd )     
        local add = math_NormalizeAngle( CurTime() * mercedes.cfg.vars["Spin speed"] * 10 )
        return mercedes.SendPacket and ( mercedes.inverted and ( baseyaw - 178 ) or add ) or ( mercedes.inverted and add or ( baseyaw - 178 ) )
    end,
    // LBY Spin
    [7] = function( cmd )     
        return lby( me:EntIndex() ) + ( mercedes.SendPacket and 180 or 0)
    end,
    // LBY Breaker
    [8] = function( cmd )   
        local yaw = baseyaw - 178

        if me:GetVelocity():Length2D() > 1 then
            yaw = lby( me:EntIndex() ) + ( mercedes.SendPacket and 180 or 0)
        elseif not mercedes.SendPacket then
            local side = mercedes.inverted and -1 or 1
            local lbyTarget = lby_target( me:EntIndex() )

            if math_abs( math_NormalizeAngle( lbyTarget - mercedes.oldYaw ) ) < mercedes.cfg.vars["LBY min delta"] then
                yaw = math_NormalizeAngle( mercedes.oldYaw + mercedes.cfg.vars["LBY break delta"] * side)
            else
                yaw = math_NormalizeAngle( lby( me:EntIndex() ) - 44 * side )
            end
        end
        
        return yaw
    end,
    // Sin Sway
    [9] = function( cmd )     
        local add = mercedes.cfg.vars["Sin add"]
        local sin = math_sin( CurTime() ) * mercedes.cfg.vars["Sin delta"]
        return mercedes.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,
    // Pendulum Sway
    [10] = function( cmd )
        local ct = CurTime()
        local delta = mercedes.cfg.vars["Sin delta"]
        local ct1 = ( ct % 0.9 )
        local ct2 = ( ct % 2 )

        local x1 = ct2 * math_sin(ct1)
        local y1 = ct2 * -1 * math_cos(ct1)
    
        local x2 = x1 + ct1 * math_sin(ct2)
        local y2 = y1 - ct1 * math_cos(ct2)

        local sin = mercedes.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,
    // Lag Sway
    [11] = function( cmd )     
        local swaySpeed = (mercedes.fakeLagTicks + 1) / 12 * math.pi
        local swayAmount = math_sin(CurTime() * swaySpeed) * 45
    
        return ( baseyaw - 180 ) + 55 * mercedes.SwaySide + swayAmount * mercedes.SwaySide * -1
    end,
    // Fake Jitter
    [12] = function( cmd )     
        local delta = mercedes.cfg.vars["Jitter delta"]
        
        local a = mercedes.SendPacket and baseyaw - 178 or baseyaw - 178 + math_random( -delta, delta )
        local b = mercedes.SendPacket and baseyaw - 178 + math_random( -delta, delta ) or baseyaw - 178

        return mercedes.inverted and a or b
    end,
    // Kappa Jitter 
    [13] = function( cmd )    
        local delta = mercedes.cfg.vars["Jitter delta"]

        local a = mercedes.SendPacket and baseyaw - 178 or baseyaw + ( delta * mercedes.SwaySide )
        local b = mercedes.SendPacket and baseyaw + ( delta * mercedes.SwaySide ) or baseyaw - 178

        return mercedes.inverted and a or b
    end,
    // Abu Jitter 
    [14] = function( cmd )   
        local ctjit = math_sin( CurTime() * 30 ) * 25

        return ctjit + ( mercedes.SendPacket and baseyaw - 160 * mercedes.SwaySide or baseyaw - 160 * -mercedes.SwaySide )
    end,
    // Satanic spinner 
    [15] = function( cmd ) 
        local side = mercedes.inverted and 1 or -1
        local satanicvalue = math_sin( CurTime() * 666 ) * 666

        return math_NormalizeAngle( mercedes.SendPacket and satanicvalue * side or satanicvalue * -side )
    end,
    // Custom aa
    [16] = function( cmd )   
        return mercedes.SendPacket and baseyaw + mercedes.cfg.vars["Custom real"] or baseyaw + mercedes.cfg.vars["Custom fake"]
    end,
    // Hand block 
    [17] = function( cmd )  
        return baseyaw - 180
    end,
    // Tank AA
    [20] = function( cmd )
        local j1 = mercedes.cfg.vars["TankAA Jitter 1"]
        local j2 = mercedes.cfg.vars["TankAA Jitter 2"]
        
        local min = math_min(j1, j2)
        local max = math_max(j1, j2)
        
        local val = math_random(min, max)
        local sign = (cmd:CommandNumber() % 2 == 0) and 1 or -1
        
        -- Fake is static backward, Real is jittering randomly
        return mercedes.SendPacket and baseyaw - 180 or baseyaw - 180 + (val * sign)
    end,
} 







do
    local pitch, yaw = 0, 0 

    local pitches = { 
        [1] = 89,
        [2] = -89,
        [3] = 0,
        [4] = -180,
        [5] = 180,
    }







 






    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch()
        local cfg = mercedes.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if mercedes.SendPacket then
            pitchflip = not pitchflip
        end
        
        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = mercedes.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = mercedes.cfg.vars["Custom pitch"] 
        end

        return x
    end

    local function micromovement(cmd)
        if not mercedes.cfg.vars["Micromovement"] then return end
        if not me:Alive() then return end
        if not me:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = !mm_side
    end

    local function aacheck(cmd)
        if not mercedes.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if mercedes.moveType == MOVETYPE_LADDER then return false end
        if mercedes.moveType == MOVETYPE_NOCLIP then return false end

        if mercedes.cfg.binds["Anti aim"] != 0 and not mercedes.IsKeyDown(mercedes.cfg.binds["Anti aim"]) then
            return false
        end

        return true 
    end

    function mercedes.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe 

        if mercedes.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = mercedes.Freestand(cmd)
        end

        if mercedes.SendPacket then
            mercedes.SwaySide = mercedes.SwaySide * -1 
        end

        baseyaw = mercedes.GetBaseYaw()
        pitch = CalcPitch()
        yaw = mercedes.CalcYaw[mercedes.cfg.vars["Yaw"]](cmd)

        if mercedes.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math_random( -0.9, 0.9 ) 
        end 

        if freestandsucc then
            yaw = mercedes.SendPacket and freestandunsafe or freestandsafe
        end

        if mercedes.cfg.vars["Desync"] then
            local range = mercedes.cfg.vars["Desync range"] or 0
            local invert = mercedes.inverted and 1 or -1
            if mercedes.SendPacket then
                yaw = yaw + (range * invert)
            end
        end

        if mercedes.cfg.vars["Jitter Body"] then
            if mercedes.SendPacket then
                yaw = yaw + math_sin(CurTime() * 15) * 45
            end
        end

        if aacheck(cmd) then
            local roll = mercedes.cfg.vars["Roll"] or 0
            local pyAngle = Angle(pitch,yaw,roll)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            mercedes.oldYaw = pyAngle.y
        end
    end
end

mercedes.fakeLagTicks = 0
mercedes.fakeLagfactor = 0
mercedes.chokedTicks = 0

mercedes.peeked = false 
mercedes.peeking = false 

function mercedes.FakeLagOnPeek()
    mercedes.fakeLagTicks = 21 - mercedes.chokedTicks - 1 

    if mercedes.chokedTicks >= 20 then
        mercedes.peeked = true
		mercedes.peeking = false
		mercedes.SendPacket = true
        me.simtime_updated = true
        ded.UpdateClientAnimation( me:EntIndex() )
		return
    end
end

function mercedes.WarpOnPeek()
	ded.StartShifting( true )

	mercedes.peeked = true
	mercedes.peeking = false
end

function mercedes.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = mercedes.GetSortedPlayers( 1, extr, 1, true ) 
		if plys then break end
	end

	if plys and not mercedes.peeking and not mercedes.peeked then
		mercedes.peeking = true
		mercedes.peeked = false
	elseif not plys then
		mercedes.peeking = false
		mercedes.peeked = false
	end

	if mercedes.peeking and not mercedes.peeked then
		if not ded.GetIsShifting() and ded.GetCurrentCharge() >= mercedes.cfg.vars["Shift ticks"] and mercedes.cfg.vars["Warp on peek"] then
			mercedes.WarpOnPeek()
        elseif mercedes.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + mercedes.maxFreezeTicks - 1 ) 
		//elseif mercedes.cfg.vars["Fake lag options-On peek"] then
		//	mercedes.FakeLagOnPeek()
		end
	end
end

local function antiaim(cmd)
    if not vars.aa then return end
    if lply:GetMoveType() == MOVETYPE_LADDER then return end 
    local ex = aaEnemyPos().x
    local ey = aaEnemyPos().y
    local p, y
    if vars.aa_mode == 'none' then return end
    if vars.aa_mode == 'hblock' then 
        p = -30
        y = ey+4 
    end
    if vars.aa_mode == 'spin' then 
        if nbpkt then
        p = 90
        y = ey-180
        else
        p = -70
        y = (RealTime()*360%360)
        end
    end 
    if vars.aa_mode == 'spinx2' then 
        local change = RealTime()*5%360
        if nbpkt then 
            p = 90
            y = RealTime()*360%360 
        else 
            p = 90
            y = (change > 90 and change < 250) and 0 or 180
        end
    end 
    if vars.aa_mode == 'spin2' then 
        p = 90
        y = (RealTime()*360%360)
    end 
    if vars.aa_mode == 'fakeangle' then 
        p = nbpkt and vars.aa_realp or vars.aa_fakep
        y = nbpkt and vars.aa_realy or vars.aa_fakey
    end 
    if vars.aa_mode == 'legit' then 
        p = nbpkt and vars.aa_realp or vars.aa_fakep
        y = nbpkt and vdbg.view.y - 45 or vdbg.view.y
    end 
    if vars.aa_mode == 'invert' then 
        if nbpkt then
            p = 89
            y = ey + 89
        else
            p = 89
            y = ey+189
        end
    end 
    if vars.aa_mode == 'side' then 
        if nbpkt then
            p = 90 
            y = ey-90
        else
            p = 90
            y = ey+90
        end
    end 

    local ang = Angle(p,y,0)

    cmd:SetViewAngles(normalizeAngle(ang)) 

    if nbpkt then 
        fakeAngles.p = p
        fakeAngles.y = y
    else
        realAngles.p = p 
        realAngles.y = y
    end 
end


do
    
    local function shouldlag(cmd)
        if not mercedes.cfg.vars["Fake lag"] then return false end
        if not me:Alive() then return false end
        if mercedes.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if mercedes.cfg.vars["Fake lag options-Disable on ladder"] and mercedes.moveType == MOVETYPE_LADDER then return false end
        if mercedes.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end

        if mercedes.cfg.vars["Allah fly"] and not me:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function mercedes.FakeLag(cmd)
        local factor = math_Round(mercedes.cfg.vars["Lag limit"])

        if mercedes.cfg.vars["Fake lag options-Randomise"] then 
            factor =  math_random(mercedes.cfg.vars["Lag randomisation"],factor) 
        end

        local velocity = me:GetVelocity():Length2D()
        local pertick = velocity * TickInterval
        local adaptive_factor = math_Clamp(math_ceil(64 / pertick),1,factor)

        if mercedes.cfg.vars["Lag mode"] == 1 or mercedes.cfg.vars["Lag mode"] == 3 then
            mercedes.fakeLagfactor = factor
        elseif mercedes.cfg.vars["Lag mode"] == 2 then
            mercedes.fakeLagfactor = adaptive_factor
        end

        if mercedes.cfg.vars["Allah walk"] and me:IsFlagSet( FL_ONGROUND ) and mercedes.IsKeyDown(mercedes.cfg.binds["allahwalk"]) then
            mercedes.fakeLagfactor = 21
        end

        //if mercedes.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then 
        //    local nfactor = mercedes.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    mercedes.fakeLagfactor = math_Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            mercedes.SendPacket = false

            if mercedes.fakeLagTicks <= 0 then
                mercedes.fakeLagTicks = mercedes.fakeLagfactor
                mercedes.SendPacket = true
                me.simtime_updated = true
                ded.UpdateClientAnimation( me:EntIndex() )
            else
                mercedes.fakeLagTicks = mercedes.fakeLagTicks - 1
            end

        else
            if mercedes.fakeLagfactor > 0 then mercedes.fakeLagfactor = 0 end
            mercedes.SendPacket = true
            me.simtime_updated = true
            ded.UpdateClientAnimation( me:EntIndex() )
        end
    end
end

function mercedes.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math_sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math_sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = me:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function mercedes.FastWalk( cmd )
    if not mercedes.cfg.vars["Ground strafer"] then return end 
    if math_abs(cmd:GetSideMove()) > 1 or math_abs(cmd:GetForwardMove()) < 1 then return end 
    if not me:IsFlagSet( FL_ONGROUND ) then return end

    if mercedes.moveType == MOVETYPE_NOCLIP or mercedes.moveType == MOVETYPE_LADDER then return end

    local waterLevel = me:WaterLevel()

    if waterLevel >= 2 then return end
    
	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function mercedes.validMoveType()
    return mercedes.moveType ~= MOVETYPE_LADDER and mercedes.moveType ~= MOVETYPE_NOCLIP and mercedes.moveType ~= MOVETYPE_OBSERVER 
end

function mercedes.isMoving(cmd)
    if not cmd then
        return false
    end

    return mercedes.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

// Edge Bug - техника для избежания урона от падения при касании края поверхности
// Как работает:
// 1. Игрок падает с края платформы
// 2. Когда хитбокс игрока касается края поверхности (пиксель к пикселю)
// 3. Нужно отжать приседание и нажать прыжок
// 4. Это предотвращает получение урона от падения и меняет координаты
function mercedes.EdgeBug(cmd)
    // Проверяем, что игрок в воздухе и падает
    if me:IsFlagSet(FL_ONGROUND) then 
        mercedes.edgeBugState = 0
        mercedes.edgeBugActive = false
        return 
    end
    
    local vel = me:GetVelocity()
    // Проверяем, что игрок падает вниз (с достаточной скоростью)
    if vel.z > -100 then 
        mercedes.edgeBugState = 0
        mercedes.edgeBugActive = false
        return 
    end
    
    local pos = me:GetPos()
    local mins, maxs = me:OBBMins(), me:OBBMaxs()
    local forward = me:EyeAngles():Forward()
    forward.z = 0
    forward:Normalize()
    
    // Проверяем касание края поверхности хитбоксом игрока (пиксель к пикселю)
    // Используем TraceHull для точной проверки хитбокса
    
    // Trace вниз хитбоксом для проверки расстояния до поверхности
    local traceDown = {
        start = pos,
        endpos = pos + Vector(0, 0, -20),
        mins = mins,
        maxs = maxs,
        filter = me,
        mask = MASK_SOLID_BRUSHONLY
    }
    local trDown = TraceHull(traceDown)
    
    // Если слишком далеко от поверхности, выходим
    if trDown.Fraction >= 0.9 then 
        mercedes.edgeBugActive = false
        return 
    end
    
    local distDown = trDown.Fraction * 20
    
    // Trace вперед хитбоксом для обнаружения края
    local traceForward = {
        start = pos + forward * 10,
        endpos = pos + forward * 10 + Vector(0, 0, -20),
        mins = mins,
        maxs = maxs,
        filter = me,
        mask = MASK_SOLID_BRUSHONLY
    }
    local trForward = TraceHull(traceForward)
    
    // Проверяем, что впереди есть край (поверхность дальше или нет поверхности)
    local distForward = trForward.Fraction >= 0.9 and 999 or (trForward.Fraction * 20)
    
    // Если впереди край (поверхность дальше или нет поверхности) и хитбокс касается края
    if (distForward > distDown + 2 or trForward.Fraction >= 0.9) and distDown < 6 and distDown > 0 then
        mercedes.edgeBugActive = true
        mercedes.edgeBugDist = distDown
        
        local mode = mercedes.cfg.vars["Edge bug mode"]
        
        // При касании края хитбоксом (очень близко) - активируем Edge Bug
        if distDown < 4 and distDown > 0.5 then
            if mode == 1 then // Auto - полностью автоматически
                // Отжимаем приседание и нажимаем прыжок при касании края
                cmd:RemoveKey(IN_DUCK)
                cmd:AddKey(IN_JUMP)
                mercedes.edgeBugState = 2 // Active
            elseif mode == 2 then // On duck - только если зажат duck
                if cmd:KeyDown(IN_DUCK) then
                    // Отжимаем приседание и нажимаем прыжок
                    cmd:RemoveKey(IN_DUCK)
                    cmd:AddKey(IN_JUMP)
                    mercedes.edgeBugState = 2 // Active
                else
                    mercedes.edgeBugState = 0 // Waiting for duck
                end
            elseif mode == 3 then // Auto (дубликат для совместимости)
                // Отжимаем приседание и нажимаем прыжок
                cmd:RemoveKey(IN_DUCK)
                cmd:AddKey(IN_JUMP)
                mercedes.edgeBugState = 2 // Active
            end
        elseif distDown < 6 then
            // Готовимся - отжимаем приседание заранее
            cmd:RemoveKey(IN_DUCK)
            mercedes.edgeBugState = 1 // Preparing
        end
    else
        mercedes.edgeBugActive = false
    end
end

// Jump Bug - техника для избежания урона от падения
// Как работает:
// 1. Игрок падает с высоты
// 2. Когда игрок находится очень близко к земле (около 4 единиц)
// 3. Нужно отжать приседание (если оно было зажато) и нажать прыжок
// 4. Это предотвращает получение урона от падения
function mercedes.JumpBug(cmd)
    // Проверяем, что игрок в воздухе и падает
    if me:IsFlagSet(FL_ONGROUND) then 
        mercedes.jumpBugState = 0
        mercedes.jumpBugReady = false
        return 
    end
    
    local vel = me:GetVelocity()
    // Проверяем, что игрок падает вниз (с достаточной скоростью)
    if vel.z > -100 then 
        mercedes.jumpBugState = 0
        mercedes.jumpBugReady = false
        return 
    end
    
    local pos = me:GetPos()
    
    // Trace вниз для проверки расстояния до земли
    local traceDown = {
        start = pos,
        endpos = pos + Vector(0, 0, -20),
        filter = me,
        mask = MASK_SOLID_BRUSHONLY
    }
    local trDown = TraceLine(traceDown)
    
    // Если слишком далеко от земли, выходим
    if trDown.Fraction >= 0.9 then 
        mercedes.jumpBugReady = false
        return 
    end
    
    local distDown = trDown.Fraction * 20
    
    // Проверяем, что находимся очень близко к земле (около 4 единиц)
    if distDown < 6 and distDown > 0 then
        mercedes.jumpBugReady = true
        mercedes.jumpBugDist = distDown
        
        local mode = mercedes.cfg.vars["Jump bug mode"]
        local shouldActivate = false
        
        if mode == 1 then // Auto - полностью автоматически
            shouldActivate = true
        elseif mode == 2 then // On jump - работает только если держите прыжок
            shouldActivate = cmd:KeyDown(IN_JUMP)
        elseif mode == 3 then // On key - только при нажатии назначенной клавиши
            shouldActivate = mercedes.IsKeyDown(mercedes.cfg.binds["Jump bug"])
        end
        
        if shouldActivate then
            // При расстоянии около 4 единиц - активируем Jump Bug
            if distDown < 5 and distDown > 2 then
                // Отжимаем приседание (если было зажато)
                cmd:RemoveKey(IN_DUCK)
                // Нажимаем прыжок
                cmd:AddKey(IN_JUMP)
                mercedes.jumpBugState = 2 // Active
            elseif distDown < 6 then
                // Готовимся - отжимаем приседание заранее
                cmd:RemoveKey(IN_DUCK)
                mercedes.jumpBugState = 1 // Preparing
            end
        else
            mercedes.jumpBugState = 0 // Waiting
        end
    else
        mercedes.jumpBugReady = false
    end
end

function mercedes.Stop(cmd)
    if mercedes.validMoveType() and me:IsFlagSet( FL_ONGROUND ) then

        local moving = mercedes.isMoving(cmd)

        if not moving then

            local vel = me:GetVelocity()
            local dir = vel:Angle()
                
            dir.yaw = mercedes.SilentAngle.y - dir.yaw
                
            local newmove = dir:Forward() * vel:Length2D()
        
            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk 

function mercedes.SlideWalk( cmd )
    local ticksToStop = mercedes.fakeLagfactor





end








// Auto peak 

mercedes.startedPeeking = false 
mercedes.needToMoveBack = false
mercedes.startPeekPosition = Vector(0,0,0)

function mercedes.MoveTo( cmd, pos )
    local ang = ( pos - me:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    mercedes.MovementFix( cmd, ang )
end

function mercedes.checkAutopeak( cmd )
    if mercedes.startedPeeking and cmd:KeyDown(IN_ATTACK) then 
        mercedes.needToMoveBack = true
    elseif !mercedes.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        mercedes.needToMoveBack = false
    end  
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function mercedes.drawAutopeak()
        local col = mercedes.needToMoveBack and colorA or colorB
    
        cam_Start3D2D( mercedes.startPeekPosition, nullangle, 0.5 )
            cam_IgnoreZ( true )

            surface_SetDrawColor( col )
            surface_SetMaterial( apmat )
            surface_DrawTexturedRect( -32, -32, 64, 64 )

            cam_IgnoreZ( false )
        cam_End3D2D()
    end
end

function mercedes.autopeakThink()
    if mercedes.IsKeyDown(mercedes.cfg.binds["Auto peak"]) then
        if not mercedes.startedPeeking then
            mercedes.startPeekPosition = me:GetPos()     
        end

        mercedes.startedPeeking = true
    else
        mercedes.startedPeeking = false
    end
end







// Sequence Manipulation 

mercedes.freezedTicks = 0
mercedes.maxFreezeTicks = math_Round( 1 / TickInterval ) 
function mercedes.AnimationFreezer()
    if not mercedes.IsKeyDown( mercedes.cfg.binds["Animation freezer"] ) then return end

    if mercedes.freezedTicks < mercedes.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + mercedes.maxFreezeTicks - 1 ) 

        mercedes.freezedTicks = mercedes.freezedTicks + 1
    else
        mercedes.freezedTicks = 0
    end
end

mercedes.seqshit = false
function mercedes.SequenceShit(cmd)
    if not mercedes.cfg.vars["Sequence manip"] or not mercedes.IsKeyDown(mercedes.cfg.binds["Sequence manip"]) then
        
        if mercedes.seqshit then
            mercedes.seqshit = false 
        end

        return 
    end

    local amt = mercedes.cfg.vars["Sequence min random"] and math_random(mercedes.cfg.vars["Sequence min"],mercedes.cfg.vars["OutSequence"]) or mercedes.cfg.vars["OutSequence"] 

    mercedes.seqshit = true
    mercedes.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )
 
function mercedes.PerformHandjob( cmd )
    local mode = mercedes.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math_random(0, 1) == 0 
    end

    ded.SetTyping(cmd, shouldjerk)
end 

mercedes.hooks          = {}
mercedes.hooks.tbl      = {}
local pre_tbl = {}
local aft_tbl = {}
mercedes.hooks.tbl_pre  = pre_tbl
mercedes.hooks.tbl_aft  = aft_tbl
mercedes.hooks.removed  = {}

function mercedes.hooks.Add( event, func )
    local str =  event .. me:SteamID64()
    mercedes.hooks.tbl[ event ] = str

    hook_Add( event, str, func )
end

local asdfd = mercedes.hooks.Add

function mercedes.hooks.AddPre( event, func )
   
    asdfd(event, func)
end

function mercedes.hooks.AddAft( event, func )
    
    asdfd(event, func)
end

function mercedes.hooks.Remove( event, func )
    mercedes.hooks.tbl[ event ] = nil

    hook_Remove( event, event..me:SteamID64() )
end
local hcall = function(name, gm, ...)
    local pre = pre_tbl[name]
    if ( pre != nil ) then
		local a, b, c, d, e, f;
		for k, v in pairs( pre ) do
			if ( isstring( k ) ) then
				a, b, c, d, e, f = v( ... )
			else
				if ( IsValid( k ) ) then
					a, b, c, d, e, f = v( k, ... )
				else
					pre[ k ] = nil
				end
			end
			if ( a != nil ) then
				return a, b, c, d, e, f
			end
		end
	end
    local aft = aft_tbl[name]
    if ( aft != nil ) then
		local a, b, c, d, e, f;
		for k, v in pairs( aft ) do
			if ( isstring( k ) ) then
				a, b, c, d, e, f = v( ... )
			else
				if ( IsValid( k ) ) then
					a, b, c, d, e, f = v( k, ... )
				else
					aft[ k ] = nil
				end
			end
			if ( a != nil ) then
				return a, b, c, d, e, f
			end
		end
	end
	local HookTable = hook_GetTable()[ name ]
	if ( HookTable != nil ) then
		local a, b, c, d, e, f;
		for k, v in pairs( HookTable ) do
			if ( isstring( k ) ) then
				a, b, c, d, e, f = v( ... )
			else
				if ( IsValid( k ) ) then
					a, b, c, d, e, f = v( k, ... )
				else
					HookTable[ k ] = nil
				end
			end
			if ( a != nil ) then
				return a, b, c, d, e, f
			end
		end
	end
	if ( !gm ) then return end

	local GamemodeFunction = gm[ name ]
	if ( GamemodeFunction == nil ) then return end

	return GamemodeFunction( gm, ... )
end
function hook.Run( name, ... )
	return hcall( name, gmod and gmod.GetGamemode() or nil, ... )
end
hook.Call = hcall

local function hgtable()
    local hooks = hook_GetTable()
    local empty = {}

    for eventName, hookTable in pairs( hooks ) do
        empty[ eventName ] = {}

        for hookName, hookFunc in pairs( hookTable ) do
            if mercedes.hooks.tbl[ eventName ] ~= hookName then
                empty[ eventName ][ hookName ] = hookFunc
            end
        end
    end

    return empty
end

hook.GetTable = hgtable

local function asshooks()
    local hgtable = hgtable
    local hcall = hcall
    local print = print
    local h = hook_GetTable()
    local gmod = gmod
    local pairs = pairs
    local isfunction = isfunction
    local isstring = isstring
    local isnumber = isnumber
    local isbool = isbool
    local IsValid = IsValid
    local type = type
    local ErrorNoHaltWithStack = ErrorNoHaltWithStack
    
    module( "hook" )
    
    local Hooks = h

    function GetTable()
        return hgtable()
    end

    function Add( event_name, name, func )

        if ( !isstring( event_name ) ) then ErrorNoHaltWithStack( "bad argument #1 to 'Add' (string expected, got " .. type( event_name ) .. ")" ) return end
        if ( !isfunction( func ) ) then ErrorNoHaltWithStack( "bad argument #3 to 'Add' (function expected, got " .. type( func ) .. ")" ) return end
    
        local notValid = name == nil or isnumber( name ) or isbool( name ) or isfunction( name ) or !name.IsValid or !IsValid( name )
        if ( !isstring( name ) and notValid ) then ErrorNoHaltWithStack( "bad argument #2 to 'Add' (string expected, got " .. type( name ) .. ")" ) return end
    
        if ( Hooks[ event_name ] == nil ) then
            Hooks[ event_name ] = {}
        end
    
        Hooks[ event_name ][ name ] = func
    
    end

    function Remove( event_name, name )

        if ( !isstring( event_name ) ) then ErrorNoHaltWithStack( "bad argument #1 to 'Remove' (string expected, got " .. type( event_name ) .. ")" ) return end
    
        local notValid = isnumber( name ) or isbool( name ) or isfunction( name ) or !name.IsValid or !IsValid( name )
        if ( !isstring( name ) and notValid ) then ErrorNoHaltWithStack( "bad argument #2 to 'Remove' (string expected, got " .. type( name ) .. ")" ) return end
    
        if ( !Hooks[ event_name ] ) then return end
    
        Hooks[ event_name ][ name ] = nil
    
    end

    function Run( name, ... )
        return hcall( name, gmod and gmod.GetGamemode() or nil, ... )
    end

    function Call(...)
        return hcall(...)
    end

end

asshooks()

function hook.Add( str1, str2, func )
    //if mercedes.hooks.tbl[ str1 ] == str2 then return end 

    hook_Add( str1, str2, func )
end

function hook.Remove( str1, str2 )
    if mercedes.hooks.tbl[ str1 ] == str2 then return end 

    hook_Remove( str1, str2 )
end

// create move hook 

mercedes.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

mercedes.vapecd = false
mercedes.tyaga = 0
mercedes.maxvape = mercedes.TIME_TO_TICKS(5)
mercedes.hoppin = false
local ic = false

mercedes.slams = {}

mercedes.hooks.AddPre( "OnEntityCreated", function( ent )
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == me then 
        mercedes.slams[ #mercedes.slams + 1 ] = ent
    end
end )






function mercedes.CreateMove(cmd)
    mercedes.DoSilentAngleUpdate( cmd )

    mercedes.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then return end

    //if ded.GetIsShifting() then mercedes.shiftedTicks = mercedes.shiftedTicks + 1 end

    local w = me:GetActiveWeapon()
    mercedes.activeWeapon       = IsValid( w ) and w or false
    mercedes.activeWeaponClass  = IsValid( w ) and w:GetClass() or false 
    mercedes.moveType           = me:GetMoveType() 

    if mercedes.cfg.vars["Silent aim"] then cmd:SetViewAngles(mercedes.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if mercedes.cfg.vars["Flashlight spam"] and input_IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if mercedes.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if mercedes.tyaga >= mercedes.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                mercedes.tyaga = 0
            elseif mercedes.tyaga < mercedes.maxvape then
                mercedes.tyaga = mercedes.tyaga + 1 
            end
        else
            mercedes.tyaga = 0
        end
    end 


    if mercedes.vapecd then 
        mercedes.vapecd = false 
        cmd:RemoveKey( IN_ATTACK2 ) 
    elseif mercedes.cfg.vars["Vape spam"] and mercedes.activeWeapon and not mercedes.vapecd and StartsWith( mercedes.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        mercedes.vapecd = true
    end   

    if mercedes.cfg.vars["Handjob"] then
        mercedes.PerformHandjob( cmd )
    end 

    //if mercedes.cfg.vars["Fake latency"] then
    //    local amt = mercedes.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if mercedes.SkipCommand then 
        cmd:RemoveKey( IN_ATTACK ) 
    
        mercedes.SkipCommand = !mercedes.SkipCommand 
    end

    if ( me:IsFlagSet( FL_ONGROUND ) ) then
		mercedes.last_ground_pos = me:GetNetworkOrigin().z
	end

    if mercedes.cfg.vars["Animation freezer"] then mercedes.AnimationFreezer() end
    
	mercedes.SequenceShit(cmd)

    if not mercedes.seqshit then
        mercedes.FakeLag(cmd)

        if mercedes.cfg.vars["Allah walk"] and me:IsFlagSet( FL_ONGROUND ) and mercedes.IsKeyDown(mercedes.cfg.binds["allahwalk"]) then
            
            if mercedes.fakeLagTicks ~= 20 then
                mercedes.ClampMovementSpeed(cmd, 0)
            else
                mercedes.ClampMovementSpeed(cmd, me:GetWalkSpeed())
            end

            //if(mercedes.fakeLagTicks <= 20) then
            //    mercedes.ClampMovementSpeed(cmd, 0)
            //    mercedes.Stop(cmd)
                //me:SetPoseParameter("move_x", 0)
	            //me:SetPoseParameter("move_y", 0)
            //else
             //   mercedes.ClampMovementSpeed(cmd, me:GetWalkSpeed())
            //end

            --print(mercedes.fakeLagTicks,me:GetVelocity():Length2D())
        end
    end

    if mercedes.cfg.vars["Fake lag options-On peek"] or mercedes.cfg.vars["Warp on peek"] or mercedes.cfg.vars["Freeze on peek"] then
        mercedes.CheckPeeking()
    end
    
    // Movement
    
    mercedes.FastWalk( cmd )

    if mercedes.cfg.vars["Sprint"] then cmd:AddKey(IN_SPEED) end

    mercedes.hoppin = false
    if ( cmd:KeyDown( IN_JUMP ) ) then

		if ( not me:IsFlagSet( FL_ONGROUND ) ) and mercedes.cfg.vars["Bhop"] then
			cmd:RemoveKey( IN_JUMP )
            mercedes.hoppin = true
		end

		mercedes.AutoStrafe( cmd )
	end
    
	if mercedes.cfg.vars["Fast stop"] then
        mercedes.Stop(cmd)
    end

    // Edge Bug
    if mercedes.cfg.vars["Edge bug"] then
        mercedes.EdgeBug(cmd)
    end

    // Jump Bug
    if mercedes.cfg.vars["Jump bug"] then
        mercedes.JumpBug(cmd)
    end

    if mercedes.cfg.vars["Water jump"] and me:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif mercedes.cfg.vars["Jesus lag"] and mercedes.SendPacket and me:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end

    if mercedes.cfg.vars["Fake duck"] and mercedes.IsKeyDown(mercedes.cfg.binds["Fake duck"]) then
        if mercedes.fakeLagTicks > (mercedes.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    mercedes.targetVector = false

	ded.StartPrediction(cmd)

        local wish_yaw = mercedes.SilentAngle.y 

        if ( mercedes.IsKeyDown(mercedes.cfg.binds["Circle strafe"]) and mercedes.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end

        if mercedes.cfg.vars["Crossbow prediction"] and mercedes.activeWeaponClass == "weapon_crossbow" then
            mercedes.CrossbowPred( cmd )
        elseif mercedes.cfg.vars["Bugbait prediction"] and mercedes.activeWeaponClass == "weapon_bugbait" then
            mercedes.BugbaitPred( cmd )
        elseif mercedes.cfg.vars["Prop aimbot"] then
            mercedes.PropAim(cmd)
        else
            mercedes.Aim(cmd)
        end 
        
        if mercedes.cfg.vars["Silent aim"] then
            mercedes.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction() 

    if mercedes.cfg.vars["Trigger bot"] and mercedes.IsKeyDown( mercedes.cfg.binds["Trigger bot"] ) then
        local tr = me:GetEyeTrace().Entity 
        
        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    local dt_on = mercedes.cfg.vars["Double tap"] and mercedes.cfg.vars["Tickbase shift"]
    local hs_on = mercedes.cfg.vars["Hide shots"] and mercedes.cfg.vars["Tickbase shift"] and (mercedes.cfg.binds["Hide shots"] == 0 or mercedes.IsKeyDown(mercedes.cfg.binds["Hide shots"]))

    if (dt_on or hs_on) and cmd:KeyDown( IN_ATTACK ) then
        ded.StartShifting( true )
    end

    

    if mercedes.cfg.vars["Rapid fire"] and me:Alive() then
        local w = me:GetActiveWeapon()

        if IsValid(w) and not mercedes.norf[ w:GetClass() ] and me:KeyDown( IN_ATTACK ) then
            cmd:RemoveKey(IN_ATTACK)
        end
    end

    if mercedes.cfg.vars["Alt Rapid fire"] and me:Alive() then
        local w = me:GetActiveWeapon()

        if IsValid(w) and me:KeyDown( IN_ATTACK2 ) then
            cmd:RemoveKey(IN_ATTACK2)
        end
    end

    if mercedes.cfg.vars["Auto detonator"] and #mercedes.slams > 0 then
        local d = mercedes.cfg.vars["AutoD distance"]
        d = d * d 

        local plys = player_GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] ~= me then continue end
            
            for k, v in pairs(mercedes.slams) do
                if not IsValid(v) then mercedes.slams[k] = nil continue end
    
                local pos = v:GetPos()
    
                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( TickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if mercedes.cfg.vars["Auto peak"] then
        local ppos = mercedes.startPeekPosition
        local pposd = me:GetPos():DistToSqr(ppos)

        if mercedes.needToMoveBack and pposd < 1024 then //or mercedes.IsMovementKeysDown( cmd )
            mercedes.needToMoveBack = false
        end

        if mercedes.startedPeeking then
            //if not mercedes.IsMovementKeysDown( cmd ) then
            //    mercedes.needToMoveBack = true
            //end

            if mercedes.needToMoveBack then
                mercedes.MoveTo( cmd, ppos )

                if mercedes.cfg.vars["Auto peak tp"] and mercedes.cfg.vars["Tickbase shift"] then
                    //mercedes.shiftedTicks = 0
                    print("NIGGER")
                    ded.StartShifting( true )
                end
            end
        end

        mercedes.checkAutopeak( cmd )
    end

    mercedes.autoReload(cmd)

    if mercedes.cfg.vars["Use spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if mercedes.cfg.vars["Auto GTA"] then
        local tr = me:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if mercedes.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( mercedes.cfg.vars["GFID"] )

        if IsValid( tar ) then 
            local tang = ( tar:GetPos() - me:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            mercedes.MovementFix( cmd, tang.y )
        end
    end

    if mercedes.cfg.vars["Air lag duck"] and mercedes.SendPacket then
        local startPosUnducked = me:GetPos()
        local isDucking = bit.band(me:GetFlags(), FL_DUCKING) ~= 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( me:EntIndex() )

        local shouldduck = true 

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = me:OBBMaxs()
            maxs.z = 72 

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = me:OBBMins(),
                maxs = maxs,
                filter = me,
                mask = MASK_PLAYERSOLID
            })

            if me:IsOnGround() and trace.Hit then
                shouldduck = false 
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and not me:IsFlagSet( FL_ONGROUND ) then 
            cmd:AddKey( IN_DUCK )   
        end
    end

    if mercedes.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(mercedes.fcangles)
    end

    /*if mercedes.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents_GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() ~= "crossbow_bolt" then continue end 

            local mypos = me:GetPos() + me:GetVelocity() * TickInterval 
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * TickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if mercedes.SendPacket then
        mercedes.chokedTicks = 0 
    else
        mercedes.chokedTicks = mercedes.chokedTicks + 1
    end

    if not mercedes.cfg.vars["Silent aim"] then mercedes.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( mercedes.SendPacket )

    if mercedes.cfg.vars["Lag mode"] == 3 and mercedes.SendPacket then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 8)
    end
    if mercedes.SilentAngle then ded.SetViewAngles( mercedes.SilentAngle ) end
end 


 
   
hook_Add( "PostClampCreateMove", "mercedes.CreateMove", mercedes.CreateMove ) // Post
 
mercedes.UnSafeFrame = false
mercedes.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), scrw, scrh )

do
    local oldsky, oldskycolor, oldwallcolor = mercedes.cfg.vars["Custom sky"], mercedes.cfg.vars["Sky color"], mercedes.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = mercedes.cfg.colors["Sky color"], mercedes.cfg.colors["Wall color"]

    local worldcollerp = string_ToColor( mercedes.cfg.colors["Wall color"] )
    local worldmats = Entity( 0 ):GetMaterials()

    local origsky = GetConVar("sv_skyname"):GetString()
    local tsides = {"lf", "ft", "rt", "bk", "dn", "up"}
    local skymat = {}

    for i = 1, 6 do 
        skymat[i] = Material("skybox/" .. origsky .. tsides[i]) 
    end

    local function setSkyboxTexture( skyname )
        for i = 1, 6 do
            local t = Material("skybox/" .. skyname .. tsides[i]):GetTexture("$basetexture")
            skymat[i]:SetTexture("$basetexture", t)
        end
    end

    local function setSkyColor( setcolor )
        local cfg = string_ToColor( mercedes.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string_ToColor( mercedes.cfg.colors["Wall color"] )
        worldcollerp = mercedes.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function mercedes.hRenderScene()

        local newname, newcolor, newcolor2 = mercedes.cfg.vars["Custom sky"], mercedes.cfg.vars["Sky color"], mercedes.cfg.vars["Wall color"]
        local newskyclr, newwallclr = mercedes.cfg.colors["Sky color"],mercedes.cfg.colors["Wall color"]
        
        if newskyclr ~= oldskyclr or newcolor ~= oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr ~= tostring( worldcollerp ) or newcolor2 ~= oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname ~= oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( not gui.IsConsoleVisible() and not gui.IsGameUIVisible() ) or mercedes.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = scrw,
                h = scrh,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }
         
            render_RenderView( view )
            render.CopyTexture( nil, mercedes.renderTarget )
         
            cam_Start2D()
                mercedes.DrawESP() mercedes.DrawSomeShit()
            cam_End2D()

            cam_Start3D()
                hook_Run( "Ungrabbable3D" )
            cam_End3D()
    
            render.SetRenderTarget( mercedes.renderTarget )
         
            return true
        end
    end

end

function mercedes.PreScreenGrab()
    if mercedes.UnSafeFrame then return end
	mercedes.UnSafeFrame = true
 
	render_Clear( 0, 0, 0, 255, true, true )
	render_RenderView( {
		origin = me:EyePos(),
		angles = me:EyeAngles(),
		x = 0,
		y = 0,
		w = scrw,
		h = scrh,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	mercedes.UnSafeFrame = false
end

mercedes.prikol = Material( "a/prikol" ):GetTexture( "$basetexture" ) //  Material( file_Read( "prikol.png", "DATA" ) )

function render.Capture( data )
    mercedes.PreScreenGrab()

    if mercedes.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( mercedes.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end

function _G.render.Capture( data )
    mercedes.PreScreenGrab()

    if mercedes.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( mercedes.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end

function mercedes.IsValidPlayer(pl)
    if pl ~= me then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

function mercedes.GetEntPos(ent)
    local min, max = ent:OBBMins(), ent:OBBMaxs()

    local points = {
        Vector( max.x, max.y, max.z ),
        Vector( max.x, max.y, min.z ),
        Vector( max.x, min.y, min.z ),
        Vector( max.x, min.y, max.z ),
        Vector( min.x, min.y, min.z ),
        Vector( min.x, min.y, max.z ),
        Vector( min.x, max.y, min.z ),
        Vector( min.x, max.y, max.z )
    }

    local MaxX, MinX, MaxY, MinY
    local isVisible = false

    for i = 1, #points do
        local v = points[i]
        local p = ent:LocalToWorld( v ):ToScreen()
        isVisible = p.visible 
        
		if MaxX != nil then
            MaxX, MaxY, MinX, MinY = math_max( MaxX, p.x ), math_max( MaxY, p.y), math_min( MinX, p.x ), math_min( MinY, p.y)
        else
            MaxX, MaxY, MinX, MinY = p.x, p.y, p.x, p.y
        end

    end

    return MaxX, MaxY, MinX, MinY, isVisible
end

function mercedes.getTextX(tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then 
        return tw
    end
end

function mercedes.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos
    elseif pos == 4 then
        return min+th*tbpos
    end
end

function mercedes.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function mercedes.GenerateArrowPoss(x, y, scale, ang)
    local ang1 = Angle(0, ang, 0):Forward() * scale
    local ang2 = Angle(0, ang + 120, 0):Forward() * (scale - 1)
    local ang3 = Angle(0, ang - 120, 0):Forward() * (scale - 1)

    local p0 = {x = x, y = y}
    local poly = {
        {x = p0.x + ang1.x, y = p0.y + ang1.y},
        {x = p0.x + ang2.x, y = p0.y + ang2.y},
        {x = p0.x + ang3.x, y = p0.y + ang3.y},
    }
    return poly
end

function mercedes.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface_DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface_DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

mercedes.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
    [3] = "thug",
}

function mercedes.DrawESP()
    local d = mercedes.cfg.vars["ESP Distance"]
    local ed = mercedes.cfg.vars["Ent ESP Distance"]
    local pos = me:GetPos()
    d = d * d
    ed = ed * ed

    surface_SetFont( mercedes.Fonts[ mercedes.cfg.vars["ESP Font"] ] )

    if mercedes.cfg.vars["Ent box 3d"] then
        cam_Start3D()
            for i = 1, #mercedes.entityCache do
                local v = mercedes.entityCache[ i ]

                if not IsValid( v.entity ) then return end 

                if v.position:DistToSqr( pos ) > ed then continue end

                render_DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), mercedes.Colors[255], true )
            end
        cam_End3D()
    end

    for i = 1, #mercedes.entityCache do
        local v = mercedes.entityCache[ i ]

        if not IsValid( v.entity ) then return end 

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY, isVisible = mercedes.GetEntPos( v.entity )
        local XLen, YLen = MaxX - MinX, MaxY - MinY

        if not isVisible then continue end

        surface_SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        surface_SetTextColor( mercedes.Colors[255] )

        if mercedes.cfg.vars["Ent box"] and not mercedes.cfg.vars["Ent box 3d"] then
            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)

            surface_SetDrawColor( 255, 255, 255 ) 
            surface_DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
        end

        if mercedes.cfg.vars["Ent class"] then
            local tw, th = surface_GetTextSize( v.class )

            surface_SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface_DrawText( v.class )
        end
    end

    local plys = player_GetAll()

    local color_box     = string_ToColor( mercedes.cfg.colors["Box esp"] )
    local color_box_g   = string_ToColor( mercedes.cfg.colors["Box gradient"] )

    local myEyePos = me:EyePos()

    for i = 1, #plys do
        local v = plys[i]

        if not mercedes.IsValidPlayer(v) or not mercedes.playerCache[ v ] then continue end
        
        local vp = mercedes.playerCache[ v ].GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface_SetAlphaMultiplier( v:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY, isVisible = mercedes.GetEntPos( v )
        local XLen, YLen = MaxX - MinX, MaxY - MinY

        -- визуализация экстраполяции
        if mercedes.cfg.vars["Extrapolation"] and mercedes.cfg.vars["Extrapolation visual"] and mercedes.predicted[ v ] and mercedes.predicted[ v ].pos then
            local pred2d = mercedes.predicted[ v ].pos:ToScreen()
            if pred2d.visible then
                surface_SetDrawColor(255, 25, 25, 200)
                surface_DrawOutlinedRect(pred2d.x - 3, pred2d.y - 3, 6, 6, 1)
            end
        end

        local teamcolor = mercedes.playerCache[ v ].TeamColor

        if mercedes.cfg.vars["OOF Arrows"] then 
            local xScale, yScale = scrw / 250, scrh / 250
            local xScale, yScale = xScale * 50, yScale * 50
 
            local angle = ( v:EyePos() - myEyePos ):Angle() 
            local addPos = Angle(0, (mercedes.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(scrw / 2, scrh / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - mercedes.SilentAngle.y) ) >= 60 then
                local poly = mercedes.GenerateArrowPoss(pos.x, pos.y, 16, (mercedes.SilentAngle.y - angle.y) - 90)
                local poly1 = mercedes.GenerateArrowPoss(pos.x, pos.y, 17, (mercedes.SilentAngle.y - angle.y) - 90)
                local poly2 = mercedes.GenerateArrowPoss(pos.x, pos.y, 15, (mercedes.SilentAngle.y - angle.y) - 90)
                
                if mercedes.cfg.vars["OOF Style"] == 1 then
                    surface_SetDrawColor( mercedes.Colors[0] )
                    mercedes.DrawOutlinedPoly( poly1 )
                    mercedes.DrawOutlinedPoly( poly2 )

                    surface_SetDrawColor( teamcolor ) 
                    mercedes.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (mercedes.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface_SetDrawColor( teamcolor ) 
                    
                    surface_DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    //surface_DrawLine(last.x, last.y, v.x, v.y)
                    //surface_DrawLine(last.x, last.y, v.x, v.y)
                    //surface_DrawLine(last.x, last.y, v.x, v.y)
                end
                
            end
        end

        if not isVisible then continue end

        if mercedes.cfg.vars["Box esp"] then
            if mercedes.cfg.vars["Box style"] == 1 then
                surface_SetDrawColor(mercedes.Colors[0])
                surface_DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface_SetDrawColor( mercedes.cfg.vars["Box team color"] and teamcolor or color_box )
                surface_DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif mercedes.cfg.vars["Box style"] == 2 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )

                surface_SetDrawColor(mercedes.Colors[0])

                // Left up
                surface_DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface_DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface_DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface_DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface_DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface_DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface_DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface_DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface_SetDrawColor( mercedes.cfg.vars["Box team color"] and teamcolor or color_box )

                wlen = wlen - 2
                hlen = hlen - 2 

                // Left up
                surface_DrawRect( MinX, MinY, wlen, 1 )
                surface_DrawRect( MinX, MinY, 1, hlen )
 
                // Right up
                surface_DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface_DrawRect( MaxX, MinY, 1, hlen )
 
                // Left down
                surface_DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface_DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
 
                // Right down
                surface_DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface_DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif mercedes.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )
                local xc = math_floor( XLen / 2 )

                surface_SetDrawColor(mercedes.Colors[0])

                // Left
                surface_DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface_DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface_DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface_DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface_DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface_DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface_DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface_DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface_DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface_DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface_SetDrawColor( mercedes.cfg.vars["Box team color"] and teamcolor or color_box )

                // Left
                surface_DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface_DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface_DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface_DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface_DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface_DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif mercedes.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math_floor( XLen / 3 ) + 3, math_floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

                for i = 1, 3 do
                    polys = {
                        { x = x + wlen, y = y },
                        { x = xw - wlen, y = y },
                        { x = xw, y = y + hlen },
                        { x = xw, y = xh - hlen },
                        { x = xw - wlen, y = xh },
                        { x = x + wlen, y = xh },
                        { x = x, y = xh - hlen },
                        { x = x, y = y + hlen },
                    }
    
                    surface_SetDrawColor( i == 2 and teamcolor or mercedes.Colors[0] ) 
                    mercedes.DrawOutlinedPoly( polys )
                    
                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
                
            end
        end

        // Sight lines 

        if mercedes.cfg.vars["Sight lines"] then 
            local tr = v:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface_SetDrawColor( teamcolor )
            surface_DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // Snaplines
        if mercedes.cfg.vars["Snaplines"] then
            local snapColor = string_ToColor( mercedes.cfg.colors["Snaplines"] )
            local centerY = mercedes.cfg.vars["Snaplines style"] == 1 and scrh or scrh / 2
            local centerX = scrw / 2
            
            surface_SetDrawColor( snapColor.r, snapColor.g, snapColor.b, snapColor.a )
            surface_DrawLine( MaxX + (MinX - MaxX) / 2, MaxY, centerX, centerY )
        end

        // Head dot
        if mercedes.cfg.vars["Head dot"] then
            local headPos = v:GetBonePosition( v:LookupBone( "ValveBiped.Bip01_Head1" ) or 0 )
            if headPos and headPos ~= v:GetPos() then
                local headScreen = headPos:ToScreen()
                if headScreen.visible then
                    local headColor = string_ToColor( mercedes.cfg.colors["Head dot"] )
                    local dotSize = mercedes.cfg.vars["Head dot size"]
                    
                    surface_SetDrawColor( mercedes.Colors[0] )
                    surface_DrawRect( headScreen.x - dotSize - 1, headScreen.y - dotSize - 1, dotSize * 2 + 2, dotSize * 2 + 2 )
                    
                    surface_SetDrawColor( headColor )
                    surface_DrawRect( headScreen.x - dotSize, headScreen.y - dotSize, dotSize * 2, dotSize * 2 )
                end
            end
        end

        // Corner boxes
        if mercedes.cfg.vars["Corner boxes"] then
            local cornerColor = string_ToColor( mercedes.cfg.colors["Corner boxes"] )
            local cornerSize = mercedes.cfg.vars["Corner size"]
            
            surface_SetDrawColor( mercedes.Colors[0] )
            // Top left
            surface_DrawLine( MinX - 1, MinY - 1, MinX + cornerSize, MinY - 1 )
            surface_DrawLine( MinX - 1, MinY - 1, MinX - 1, MinY + cornerSize )
            // Top right
            surface_DrawLine( MaxX + 1, MinY - 1, MaxX - cornerSize, MinY - 1 )
            surface_DrawLine( MaxX + 1, MinY - 1, MaxX + 1, MinY + cornerSize )
            // Bottom left
            surface_DrawLine( MinX - 1, MaxY + 1, MinX + cornerSize, MaxY + 1 )
            surface_DrawLine( MinX - 1, MaxY + 1, MinX - 1, MaxY - cornerSize )
            // Bottom right
            surface_DrawLine( MaxX + 1, MaxY + 1, MaxX - cornerSize, MaxY + 1 )
            surface_DrawLine( MaxX + 1, MaxY + 1, MaxX + 1, MaxY - cornerSize )
            
            surface_SetDrawColor( cornerColor )
            // Top left
            surface_DrawLine( MinX, MinY, MinX + cornerSize, MinY )
            surface_DrawLine( MinX, MinY, MinX, MinY + cornerSize )
            // Top right
            surface_DrawLine( MaxX, MinY, MaxX - cornerSize, MinY )
            surface_DrawLine( MaxX, MinY, MaxX, MinY + cornerSize )
            // Bottom left
            surface_DrawLine( MinX, MaxY, MinX + cornerSize, MaxY )
            surface_DrawLine( MinX, MaxY, MinX, MaxY - cornerSize )
            // Bottom right
            surface_DrawLine( MaxX, MaxY, MaxX - cornerSize, MaxY )
            surface_DrawLine( MaxX, MaxY, MaxX, MaxY - cornerSize )
        end

        // 3D Player box
        if mercedes.cfg.vars["3D Player box"] then
            cam_Start3D()
                local boxColor = string_ToColor( mercedes.cfg.colors["3D Player box"] )
                local mins, maxs = v:OBBMins(), v:OBBMaxs()
                render_SetColorModulation( boxColor.r / 255, boxColor.g / 255, boxColor.b / 255 )
                render_DrawWireframeBox( v:GetPos(), v:GetAngles(), mins, maxs, true )
                render_SetColorModulation( 1, 1, 1 )
            cam_End3D()
        end

        // text 

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface_SetTextColor( mercedes.Colors[255] )

        if mercedes.cfg.vars["Name"] then 
            local name = mercedes.playerCache[ v ].Name
            local pos = mercedes.cfg.vars["Name pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Usergroup"] then 
            local name = mercedes.playerCache[ v ].GetUserGroup
            local pos = mercedes.cfg.vars["Usergroup pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Weapon"] then 
            local name = mercedes.cfg.vars["Show ammo"] and mercedes.playerCache[ v ].WeaponClass .. " (" .. mercedes.playerCache[ v ].WeaponAmmo .. ")" or mercedes.playerCache[ v ].WeaponClass
           
            if mercedes.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v:IsValidLayer(i) then
                        if v:GetSequenceActivityName(v:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = mercedes.cfg.vars["Weapon pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Armor"] then 
            local name = mercedes.playerCache[ v ].Armor
            local pos = mercedes.cfg.vars["Armor pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Team"] then 
            local name = mercedes.playerCache[ v ].TeamName
            local pos = mercedes.cfg.vars["Team pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["DarkRP Money"] then 
            local name = mercedes.playerCache[ v ].MoneyVar
            local pos = mercedes.cfg.vars["Money pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
        
        local health = mercedes.playerCache[ v ].Health

        if mercedes.cfg.vars["Health bar"] then 
            local maxhealth = mercedes.playerCache[ v ].GetMaxHealth

			local healthfrac = math_min( health / maxhealth, 1 )
		    local height = math_floor( healthfrac * YLen )

            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawRect( MinX-6, MinY-1, 4, YLen+2 )

			surface_SetDrawColor( string_ToColor( mercedes.cfg.colors["Health"] ) )
			surface_DrawRect(MinX - 5, MinY+YLen-height, 2, height)

            if mercedes.cfg.vars["Health bar gradient"] then 
                surface_SimpleTexturedRect( MinX - 5, MinY+YLen-height, 2, height, string_ToColor( mercedes.cfg.colors["Health bar gradient"] ) , mercedes.Materials["Gradient"] )
            end
        end

        if mercedes.cfg.vars["Health"] then 
            local pos = mercedes.cfg.vars["Health pos"]
            local tw, th = surface_GetTextSize(health)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(health)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = mercedes.cfg.vars["Break LC pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = mercedes.cfg.vars["Simtime pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["IFOV"] then
            local angle = ( v:EyePos() - myEyePos ):Angle() 
            local infov = math_abs( math_NormalizeAngle( angle.y ) ) > 75
            local name = infov and "in FOV!" or "out of FOV!"
            local pos = mercedes.cfg.vars["Simtime pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if mercedes.cfg.vars["Distance ESP"] then
            local dist = math_floor( math_sqrt( distance ) )
            local name = dist .. " u"
            local pos = mercedes.cfg.vars["Distance pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-mercedes.getTextX(tw,pos),mercedes.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
 
        if mercedes.cfg.vars["Skeleton"] then
            surface_SetDrawColor( string_ToColor( mercedes.cfg.colors["Skeleton"] ) )

		    for i = 0, v:GetBoneCount() - 1 do

			    local parent = v:GetBoneParent(i)

			    if(not parent) then continue end

			    local bonepos = v:GetBonePosition(i)

			    if(bonepos == v:GetPos() ) then continue end

			    local parentpos = v:GetBonePosition(parent)

			    if(not bonepos or not parentpos) then continue end

			    local screen1, screen2 = bonepos:ToScreen(),parentpos:ToScreen()

			    surface_DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
		    end
        end

        if mercedes.cfg.vars["Show records"] and mercedes.canBacktrack(v) then
            local len = #mercedes.btrecords[ v ]

            for i = 1, len do
                local pos = ( mercedes.btrecords[v][i].aimpos ):ToScreen()
                surface_SetDrawColor( mercedes.backtracktick == i and mercedes.Colors["Red"] or mercedes.Colors[255] )
                surface_DrawRect(pos.x,pos.y,2,2)
            end
        end

        if mercedes.cfg.vars["Backtrack skeleton"] and mercedes.canBacktrack(v) then
            local len = #mercedes.btrecords[ v ]

            surface_SetDrawColor( mercedes.Colors[255] )

            for i = 1, len do
                local data = mercedes.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()
        
                    surface_DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end
    end

    surface_SetAlphaMultiplier(1)
end


surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )

mercedes.fovColor = Color( 255, 255, 255 )
mercedes.gradFov = false






//mercedes.bgmaterial = Material( "a/paws.png", "noclamp smooth" )



do
    local lc, blc = Color(125,255,64), Color(255,64,125)

    local indx, indy = scrw / 2 - 100, scrh/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NOT CHARGED", 0, chargedcolor

    //local watermarkx = scrw + 245
    //local watermarkc = Color( 232, 232, 232, 235)

    function mercedes.DrawSomeShit()

        //if mercedes.frame:IsVisible() then
        //    surface_SetDrawColor( mercedes.accent )
        //    surface_SetMaterial( mercedes.bgmaterial )
        //    surface_DrawTexturedRect( 0, 0, scrw, scrh )
        //end

        surface_SetFont("DTFont")

        local latency    = math_Round( ( ded.GetLatency(0) + ded.GetLatency(1) ) * 1000 ) 
        local currentlby = math_Round( lby( me:EntIndex() ) ) 
        local targetlby  = math_Round( lby_target( me:EntIndex() ) ) 
        local speed      = math_Round( me:GetVelocity():Length2D() )

        -- Обновляем данные для HUD-меню
        mercedes.hudInfoData = mercedes.hudInfoData or {}
        mercedes.hudInfoData.latency    = latency
        mercedes.hudInfoData.currentlby = currentlby
        mercedes.hudInfoData.targetlby  = targetlby
        mercedes.hudInfoData.speed      = speed
        mercedes.hudInfoData.fakeTicks  = mercedes.fakeLagTicks or 0

        -- Создаём перетаскиваемую панель один раз
        if not IsValid( mercedes.hudInfoPanel ) then
            local pw, ph = 180, 110
            mercedes.hudInfoPanel = vgui_Create( "DPanel" )
            mercedes.hudInfoPanel:SetSize( pw, ph )
            mercedes.hudInfoPanel:SetPos( 38, scrh - 220 )
            mercedes.hudInfoPanel:SetMouseInputEnabled( true )
            mercedes.hudInfoPanel:SetKeyboardInputEnabled( false )

            -- Прозрачный фон, чтобы выглядело как раньше (только текст)
            function mercedes.hudInfoPanel:Paint( w, h )
                local data = mercedes.hudInfoData or {}
                local white = color_white

                surface_SetFont( "DTFont" )
                surface_SetTextColor( 255, 255, 255, 255 )

                local x = 0
                local y = 10
                local step = 18

                surface_SimpleText( x, y + step * 0, "LC",       white )
                surface_SimpleText( x, y + step * 1, "FT: " .. ( data.fakeTicks or 0 ), white )
                surface_SimpleText( x, y + step * 2, tostring( data.speed or 0 ),        white )
                surface_SimpleText( x, y + step * 3, "AT: " .. ( data.latency or 0 ) .. " ms", white )

                local lbyStr = "LBY: " .. ( data.currentlby or 0 ) .. " (" .. ( data.targetlby or 0 ) .. ")"
                surface_SimpleText( x, y + step * 4, lbyStr, white )
            end

            -- Простейшее перетаскивание панели мышью
            function mercedes.hudInfoPanel:OnMousePressed( mcode )
                if mcode ~= MOUSE_LEFT then return end
                self.Dragging = true
                local mx, my = gui.MousePos()
                local x, y = self:GetPos()
                self.DragOffsetX = mx - x
                self.DragOffsetY = my - y
                self:MouseCapture( true )
            end

            function mercedes.hudInfoPanel:OnMouseReleased( mcode )
                if mcode ~= MOUSE_LEFT then return end
                self.Dragging = false
                self:MouseCapture( false )
            end

            function mercedes.hudInfoPanel:Think()
                if not self.Dragging then return end
                local mx, my = gui.MousePos()
                self:SetPos( mx - ( self.DragOffsetX or 0 ), my - ( self.DragOffsetY or 0 ) )
            end
        end
        
        if mercedes.cfg.vars["Auto Vape"] then
            surface_SimpleText(38,scrh-220,"Vape: ", mercedes.tyaga == 0 and blc or lc)
            
            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawRect( 78, scrh-219, 60, 14 )

            surface_SetDrawColor( lc )
            surface_DrawRect( 79, scrh-218, mercedes.tyaga / mercedes.maxvape * 58, 12 )
        end
        

        local dt_bind = mercedes.cfg.binds["Double tap"]
        local dt_active = mercedes.cfg.vars["Double tap"] and (dt_bind == 0 or mercedes.IsKeyDown(dt_bind))
        if dt_active then
            local max, cur = mercedes.cfg.vars["Charge ticks"], ded.GetCurrentCharge()
            local dtw = (cur / max) * 30
            local x, y = scrwc + 15, scrhc + 15
            
            local clr = (cur >= max) and lc or blc
            
            surface_SimpleText( x, y, "DT", Color(0,0,0,150) ) -- Тень
            surface_SimpleText( x-1, y-1, "DT", blc ) -- Фон (незаряженный)
            
            render.SetScissorRect( x-1, y-1 - 30, x-1 + 30, y-1 + 30 - (30 - (cur/max)*15), true ) -- Простая анимация заполнения
                surface_SimpleText( x-1, y-1, "DT", lc )
            render.SetScissorRect( 0, 0, 0, 0, false )
            
            -- Полоска заряда
            surface_SetDrawColor(0,0,0,150)
            surface_DrawRect(x, y+15, 20, 4)
            surface_SetDrawColor(clr)
            surface_DrawRect(x, y+15, (cur/max)*20, 4)
        end

        local hs_bind = mercedes.cfg.binds["Hide shots"]
        local hs_active = mercedes.cfg.vars["Hide shots"] and (hs_bind == 0 or mercedes.IsKeyDown(hs_bind))
        if hs_active then
            local x, y = scrwc + 15, scrhc + 35
            local max, cur = mercedes.cfg.vars["Charge ticks"], ded.GetCurrentCharge()
            local clr = (cur >= max) and Color(100, 150, 255) or blc
            
            surface_SimpleText( x, y, "HS", Color(0,0,0,150) )
            surface_SimpleText( x-1, y-1, "HS", clr )
        end

        

        local CT = CurTime()
        local FT = FrameTime() * 128

        if mercedes.cfg.vars["Hitmarker"] and #mercedes.hitmarkers > 0 then
            local hm = string_ToColor( mercedes.cfg.colors["Hitmarker"] ) 
    
            surface_SetDrawColor( hm )

            for i = #mercedes.hitmarkers, 1, -1  do
                local v = mercedes.hitmarkers[ i ]
    
                if v.time < CT - 1 then table_remove( mercedes.hitmarkers, i ) continue end 
    
                v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface_DrawLine( scrwc - v.add, scrhc - v.add, scrwc - 10 - v.add, scrhc - 10 - v.add )
                surface_DrawLine( scrwc + v.add, scrhc - v.add, scrwc + 10 + v.add, scrhc - 10 - v.add )
                surface_DrawLine( scrwc - v.add, scrhc + v.add, scrwc - 10 - v.add, scrhc + 10 + v.add )
                surface_DrawLine( scrwc + v.add, scrhc + v.add, scrwc + 10 + v.add, scrhc + 10 + v.add )
            end
        end

        if mercedes.cfg.vars["Hitnumbers"] and #mercedes.hitnums > 0 then 
            local n, c = string_ToColor( mercedes.cfg.colors["Hitnumbers"] ), string_ToColor( mercedes.cfg.colors["Hitnumbers krit"] )
        
            surface_SetFont( "veranda_scr" )

            for i = #mercedes.hitnums, 1, -1 do
                local v = mercedes.hitnums[ i ]

                if v.time < CT - 1 then table_remove( mercedes.hitnums, i ) continue end 

                surface_SetTextColor( v.crit and c or n )

                v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface_SetTextPos( scrwc - v.add * v.xdir, scrhc - v.add * v.ydir )
                surface_DrawText( v.dmg )
            end
        end

        if mercedes.cfg.vars["Show FOV"] then 
            local col = string_ToColor( mercedes.cfg.colors["Show FOV"] )
            
            local radius = mercedes.GetFovRadius()
        
            surface_SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( scrwc, scrhc, radius + 1 )

            surface_SetDrawColor( col.r, col.g, col.b )
            surface.DrawCircle( scrwc, scrhc, radius )

            surface_SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( scrwc, scrhc, radius - 1 )
        end

        // Target HUD
        if mercedes.cfg.vars["Target HUD"] then
            local winchance = "by serejaga"
            local ping = "ping pong anal"
            local thx, thy = mercedes.cfg.vars["Target HUD x"], mercedes.cfg.vars["Target HUD y"]
            
            local targetInFov = true
            if IsValid(mercedes.target) then
                // Проверка FOV limit
                if mercedes.cfg.vars["Fov limit"] then
                    local fov = mercedes.cfg.vars["Aimbot FOV"]
                    local eyePos = me:EyePos()
                    local viewAngles = me:EyeAngles()
                    
                    // Получаем позицию цели
                    local targetPos
                    if mercedes.targetVector and mercedes.targetVector != Vector() then
                        targetPos = mercedes.targetVector
                    else
                        local bones = mercedes.GetBones(mercedes.target)
                        if bones and #bones > 0 then
                            targetPos = bones[1] // Используем первую кость
                        else
                            targetPos = mercedes.target:GetPos() + mercedes.target:OBBCenter()
                        end
                    end
                    
                    local aimAngle = (targetPos - eyePos):Angle()
                    local ang = aimAngle - viewAngles
                    ang:Normalize()
                    local fovDist = math_sqrt(ang.x * ang.x + ang.y * ang.y)
                    
                    targetInFov = fovDist <= fov
                end
            end
            
            if IsValid(mercedes.target) and targetInFov then
                mercedes.targethp = Lerp(FrameTime() * 5, mercedes.targethp, math_Clamp(mercedes.target:Health(), 0, 100))
                
                if IsValid(me:GetActiveWeapon()) and me:GetActiveWeapon():Clip1() <= 0 then
                    winchance = "No ammo SYKA BLYAT!"
                elseif not IsValid(mercedes.target:GetActiveWeapon()) and IsValid(me:GetActiveWeapon()) then
                    winchance = "Ez win"
                elseif mercedes.target:Health() < 10 and mercedes.target:Health() < me:Health() then
                    winchance = "Ezz Owning"
                elseif me:Health() < 10 and mercedes.target:Health() > me:Health() then
                    winchance = "*DEAD*"
                elseif mercedes.target:Health() > me:Health() then
                    winchance = "Loosing"
                elseif mercedes.target:Health() == me:Health() then
                    winchance = "Same chance"
                elseif mercedes.target:Health() < me:Health() then
                    winchance = "Winning"
                end
                
                if mercedes.target:Ping() > me:Ping() then
                    ping = " (bigger)"
                elseif mercedes.target:Ping() < me:Ping() then
                    ping = " (advantage)"
                elseif mercedes.target:Ping() == me:Ping() then
                    ping = " (same)"
                else
                    ping = ""
                end
                
                if targetInFov then
                    mercedes.targethudy = math_Approach(mercedes.targethudy, 340, FrameTime() * 500)
                    mercedes.targethudx = math_Approach(mercedes.targethudx, 120, FrameTime() * 500)
                    mercedes.targeta = math_Approach(mercedes.targeta, 255, FrameTime() * 500)
                else
                    mercedes.targethudy = math_Approach(mercedes.targethudy, 0, FrameTime() * 350)
                    mercedes.targethudx = math_Approach(mercedes.targethudx, 0, FrameTime() * 350)
                    mercedes.targeta = math_Approach(mercedes.targeta, 0, FrameTime() * 350)
                end
            else
                mercedes.targethudy = math_Approach(mercedes.targethudy, 0, FrameTime() * 350)
                mercedes.targethudx = math_Approach(mercedes.targethudx, 0, FrameTime() * 350)
                mercedes.targeta = math_Approach(mercedes.targeta, 0, FrameTime() * 350)
            end
            
            draw.RoundedBox(0, thx + 150 - mercedes.targethudy / 2, thy, mercedes.targethudy, mercedes.targethudx, Color(22, 22, 22, mercedes.targeta))
            local gradMat = mercedes.LoadTargetHUDMaterial("gradient")
            if gradMat then
                surface_SetDrawColor(255, 255, 255, mercedes.targeta)
                surface_SetMaterial(gradMat)
                surface_DrawTexturedRect(thx + 150 - mercedes.targethudy / 2, thy, mercedes.targethudy, 4)
            end
            
            if IsValid(mercedes.target) then
                draw.SimpleText(mercedes.TruncateText(mercedes.target:Name(), 32), "THUDFONT", thx + 150 - mercedes.targethudy / 2 + 120, thy + 12, Color(255, 255, 255, mercedes.targeta))
                if IsValid(mercedes.target:GetActiveWeapon()) then
                    draw.SimpleText(mercedes.target:GetActiveWeapon():GetPrintName(), "THUDFONT", thx + 150 - mercedes.targethudy / 2 + 120, thy + 45, Color(255, 255, 255, mercedes.targeta))
                else
                    draw.SimpleText("No valid weapon", "THUDFONT", thx + 150 - mercedes.targethudy / 2 + 120, thy + 45, Color(255, 255, 255, mercedes.targeta))
                end
                draw.SimpleText(winchance, "THUDFONT", thx + 150 - mercedes.targethudy / 2 + 120, thy + 65, Color(255, 255, 255, mercedes.targeta))
                draw.SimpleText("Ping: " .. mercedes.target:Ping() .. ping, "THUDFONT", thx + 150 - mercedes.targethudy / 2 + 120, thy + 85, Color(255, 255, 255, mercedes.targeta))
                
                draw.NoTexture()
                surface_SetDrawColor(9, 9, 9, mercedes.targeta)
                mercedes.DrawCircle(thx + 150 - mercedes.targethudy / 2 + 60, thy + 62, 48, 64, 100)
                local circleMat = mercedes.LoadTargetHUDMaterial("circle")
                if circleMat then
                    surface_SetMaterial(circleMat)
                    surface_SetDrawColor(255, 255, 255, mercedes.targeta)
                    mercedes.DrawCircle(thx + 150 - mercedes.targethudy / 2 + 60, thy + 62, 48, 64, mercedes.targethp)
                end
                draw.NoTexture()
                surface_SetDrawColor(22, 22, 22, mercedes.targeta)
                mercedes.DrawCircle(thx + 150 - mercedes.targethudy / 2 + 60, thy + 62, 36, 64, 100)
                
                draw.SimpleText((mercedes.target:Health() / mercedes.target:GetMaxHealth() * 100) .. "%", "THUDFONT", thx + 150 - mercedes.targethudy / 2 + 60, thy + mercedes.targethudx / 2 + 4, Color(255, 255, 255, mercedes.targeta), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            
            // Draggable
            if mercedes.ui.frame then
                local framepos_x, framepos_y = mercedes.ui.frame:GetPos()
                local mx, my = gui.MouseX(), gui.MouseY()
                if mx >= thx and mx <= thx + 300 and my >= thy and my <= thy + 150 and input_IsMouseDown(107) and not (mx >= framepos_x and mx <= framepos_x + 900 and my >= framepos_y and my <= framepos_y + 700) then
                    mercedes.cfg.vars["Target HUD x"], mercedes.cfg.vars["Target HUD y"] = mx - 100, my - 12
                end
            end
        end

        if mercedes.target and mercedes.targetVector then
            if mercedes.cfg.vars["Aimbot snapline"] then 
                local pos = mercedes.targetVector:ToScreen()
                surface_SetDrawColor( string_ToColor( mercedes.cfg.colors["Aimbot snapline"] ) )
                surface_DrawLine( pos.x, pos.y, scrwc, scrhc )
            end
    
            if mercedes.cfg.vars["Aimbot marker"] then 
                local pos = mercedes.targetVector:ToScreen()

                surface_SetDrawColor( 0, 0, 0 )
                surface_DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface_DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface_DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface_DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface_DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface_DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface_DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface_DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface_SetDrawColor( string_ToColor( mercedes.cfg.colors["Aimbot marker"] ) )
                
                surface_DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface_DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface_DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface_DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface_DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface_DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface_DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface_DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end
        end
        
        surface_SetFont( "veranda" )

        if mercedes.cfg.vars[ "On screen logs" ] and table.Count( mercedes.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = scrw / 2, scrh / 2 + 45 
    
            for k, v in pairs( mercedes.onScreenLogs ) do

                if mercedes.TICKS_TO_TIME( tick - mercedes.onScreenLogs[ k ].tick ) > 8 then
                    mercedes.onScreenLogs[ k ] = nil
                    continue 
                end

                local data = mercedes.onScreenLogs[ k ]
                local fstr = ""
    
                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end
    
                local tw, th = surface.GetTextSize( fstr )
    
                x = x - tw / 2
                
                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface.GetTextSize( str )
    
                    surface.SetTextPos( x, y )
                    surface.SetTextColor( data[ 2 ][ p ] )
                    surface.DrawText( str )
    
                    x = x + tw
                end
    
                x, y = scrw / 2, y + th
            end
        end

        local plys = player_GetAll()

        if mercedes.cfg.vars[ "Spectator list" ] then
            local y = scrh / 2 

            for i = 1, #plys do
                local v = plys[ i ]

                if not mercedes.playerCache[ v ] then continue end
                if mercedes.playerCache[ v ].ObserverMode == 0 then continue end 

                surface.SetTextPos( 15, y )
                surface.SetTextColor( mercedes.Colors[255] )
                surface.DrawText( v:Name() .. " spectating " .. tostring( mercedes.playerCache[ v ].ObserverTarget ) )
            
                y = y + 15
            end
        end 

        



        
    end
    
   
    
end



mercedes.kd = false
function mercedes.togglevisible()
    if mercedes.frame:IsVisible() then
        mercedes.frame:SetVisible(false)

        if mercedes.ui.MultiComboP then mercedes.ui.RemovePanel( mercedes.ui.MultiComboP ) end
        if mercedes.ui.ColorWindow then mercedes.ui.RemovePanel( mercedes.ui.ColorWindow ) end
        if mercedes.ui.SettingsPan then mercedes.ui.RemovePanel( mercedes.ui.SettingsPan ) end

        RememberCursorPosition()

        if mercedes.validsnd then mercedes.validsnd:Pause() end
    else
        mercedes.frame:SetVisible(true)

        RestoreCursorPosition()
        if mercedes.validsnd then mercedes.validsnd:Play() end
    end
end

mercedes.hooks.AddAft("PrePlayerDraw", function(ply, falgs)
	if ply ~= me then
        ply.ChatGestureWeight = 0
		for i = 0, 13 do
			if ply:IsValidLayer(i) then
				local seqname = ply:GetSequenceName(ply:GetLayerSequence(i))
				if seqname:StartWith("taunt_") or seqname:StartWith("act_") or seqname:StartWith("gesture_") then
                    ply:SetLayerDuration(i, 0.001)
					break
				end
			end
		end
        
    end

    if mercedes.cfg.vars["Visible chams"] then
        //ply:SetNoDraw( true )
    end
end)


// Chams

CreateMaterial("textured", "VertexLitGeneric") 
CreateMaterial("flat", "UnLitGeneric")
CreateMaterial("flat_z", "UnLitGeneric",{["$ignorez"] = 1})
CreateMaterial("textured_z", "VertexLitGeneric",{["$ignorez"] = 1})

CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial( "selfillum_a", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_a_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})

CreateMaterial("metallic", "VertexLitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
})

CreateMaterial("metallic_z", "VertexLitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
    ["$ignorez"] = 1,
})

mercedes.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!textured"), -- textured
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!wireframe"), -- wireframe
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!textured_z"), -- textured
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!wireframe_z"), -- wireframe
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    }
}
 
do
    local f = (1/255)

    function mercedes.drawChams()
        if mercedes.UnSafeFrame then return end

        local vm, invm = mercedes.cfg.vars["Visible mat"], mercedes.cfg.vars["inVisible mat"]
        local sin = math_floor( math_sin( CurTime() * 4 ) * 45 )

        local vc = string_ToColor(mercedes.cfg.colors["Visible chams"])
        local invc = string_ToColor(mercedes.cfg.colors["inVisible chams"])
        local sc = string_ToColor(mercedes.cfg.colors["Self chams"])
        
        cam_Start3D()
            for k, v in pairs(player_GetAll()) do
                if not IsValid(v) or v == me or not v:Alive() or v:IsDormant() then continue end 

                if mercedes.cfg.vars["Supress lighting"] then
                    render_SuppressEngineLighting(true)
                end

                if mercedes.cfg.vars["inVisible chams"] then
                    mercedes.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render_MaterialOverride(mercedes.chamMats.invis[invm])
                    render_SetColorModulation(invc.r/255,invc.g/255,invc.b/255) 

                    if invm == 7 then
                        render_SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if mercedes.cfg.vars["inVisible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if mercedes.cfg.vars["Visible chams"] then
                    mercedes.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render_MaterialOverride(mercedes.chamMats.vis[vm])
                    render_SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render_SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if mercedes.cfg.vars["Visible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if mercedes.cfg.vars["Supress lighting"] then
                    render_SuppressEngineLighting(false)
                end

            end

            if mercedes.cfg.vars["Self chams"] and IsValid(me) and me:Alive() then

                if mercedes.cfg.vars["Supress self lighting"] then
                    render_SuppressEngineLighting(true)
                end

                mercedes.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render_MaterialOverride(mercedes.chamMats.vis[mercedes.cfg.vars["Self mat"]])
                render_SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if mercedes.cfg.vars["Self mat"] == 7 then
                    render_SetBlend( (sin + 100) / 255 )
                end

                me:SetRenderMode(1)
                me:DrawModel()

                if mercedes.cfg.vars["Self chams w"] then 
                    local w = me:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end
              
                if mercedes.cfg.vars["Supress self lighting"] then
                    render_SuppressEngineLighting(false)
                end

            end

            


        cam_End3D()

        render_SetColorModulation(1, 1, 1)
        render_SetBlend(1)
        render_MaterialOverride()
    end
end


// Client side models 

function mercedes.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function mercedes.CS_Model_update(ply,model,tbl)
    if not tbl then return end

    local mdl = model
    local playerModel = ply:GetModel()
    local layers = tbl.layers 

    for i = 0, 13 do
        if mdl:IsValidLayer(i) then
            local l = layers[i]
            mdl:SetLayerCycle(l.cycle)
            mdl:SetLayerSequence(l.sequence)
            mdl:SetLayerWeight(l.weight)
        end
    end

    mdl:SetSequence(tbl.sequence)
    mdl:SetCycle(tbl.cycle)

    mdl:SetPoseParameter("aim_pitch", tbl.angles.p)
	mdl:SetPoseParameter("head_pitch", 0)
	mdl:SetPoseParameter("body_yaw", tbl.angles.y)
	mdl:SetPoseParameter("aim_yaw", 0)
		
	mdl:SetPoseParameter("move_x", tbl.movex)
	mdl:SetPoseParameter("move_y", tbl.movey)

    mdl:SetAngles( Angle( 0, tbl.angles.y, 0 ) )
    mdl:SetModel( playerModel )
	mdl:SetPos( tbl.origin )
end

function mercedes.PostDrawTranslucentRenderables()
    if mercedes.UnSafeFrame then return end

    mercedes.drawCSModels_backtrack()
    mercedes.drawCSModels_real()
    
    // Визуализация траектории bugbait
    if mercedes.cfg.vars["Bugbait prediction"] and mercedes.activeWeaponClass == "weapon_bugbait" then
        if mercedes.bugbaitTrajectory and #mercedes.bugbaitTrajectory > 1 then
            // Рисуем траекторию
            for i = 1, #mercedes.bugbaitTrajectory - 1 do
                local alpha = 255 * (1 - (i / #mercedes.bugbaitTrajectory) * 0.7)
                alpha = math_Clamp(alpha, 30, 255)
                gRender.DrawLine(
                    mercedes.bugbaitTrajectory[i], 
                    mercedes.bugbaitTrajectory[i+1], 
                    Color(0, 255, 0, alpha), 
                    false
                )
            end
            
            // Рисуем точку попадания
            if mercedes.bugbaitImpactPos then
                cam_Start3D()
                cam_IgnoreZ(true)
                render_SetMaterial(Material("sprites/light_glow02_add"))
                gRender.DrawSprite(mercedes.bugbaitImpactPos, 12, 12, Color(0, 255, 0, 200))
                cam_IgnoreZ(false)
                cam_End3D()
            end
        end
    else
        // Очищаем траекторию если не используем bugbait
        mercedes.bugbaitTrajectory = {}
        mercedes.bugbaitImpactPos = nil
    end

    // China hat
    if mercedes.cfg.vars["China hat"] then
        for _, ply in ipairs(player_GetAll()) do
            if not IsValid(ply) or ply == me or not ply:Alive() then continue end
            
            // Create or get model for this player
            if not mercedes.chinaHatModels then
                mercedes.chinaHatModels = {}
            end
            if not mercedes.chinaHatModels[ply] then
                local model = ClientsideModel("models/hunter/misc/cone2x05.mdl")
                if IsValid(model) then
                    model:SetNoDraw(true)
                    mercedes.chinaHatModels[ply] = model
                end
            end
            
            local hatModel = mercedes.chinaHatModels[ply]
            if IsValid(hatModel) then
                // Get player head position
                local headBone = ply:LookupBone("ValveBiped.Bip01_Head1")
                if headBone then
                    local headPos, headAng = ply:GetBonePosition(headBone)
                    if headPos then
                        // Position above head
                        local hatPos = headPos + Vector(0, 0, 8)
                        // Rotate the hat
                        local hatAng = Angle(0, CurTime() * 180, 0)
                        
                        hatModel:SetPos(hatPos)
                        hatModel:SetAngles(hatAng)
                        
                        // Get color
                        local hatColor = string_ToColor(mercedes.cfg.colors["China hat"] or "255 255 255 255")
                        
                        // Apply RGB change if enabled
                        if mercedes.cfg.vars["RGB change"] then
                            local hsv = HSVToColor((CurTime() * 60) % 360, 1, 1)
                            hatColor = Color(hsv.r, hsv.g, hsv.b, hatColor.a)
                        end
                        
                        // Draw the model
                        render_SetColorModulation(hatColor.r / 255, hatColor.g / 255, hatColor.b / 255)
                        render_SetBlend(hatColor.a / 255)
                        hatModel:DrawModel()
                        render_SetColorModulation(1, 1, 1)
                        render_SetBlend(1)
                    end
                end
            end
        end
        
        // Clean up models for invalid players
        if mercedes.chinaHatModels then
            for ply, model in pairs(mercedes.chinaHatModels) do
                if not IsValid(ply) or not ply:Alive() then
                    if IsValid(model) then
                        model:Remove()
                    end
                    mercedes.chinaHatModels[ply] = nil
                end
            end
        end
    else
        // Remove all models when disabled
        if mercedes.chinaHatModels then
            for ply, model in pairs(mercedes.chinaHatModels) do
                if IsValid(model) then
                    model:Remove()
                end
            end
            mercedes.chinaHatModels = {}
        end
    end

    render_SetBlend(1)
    render_MaterialOverride()
end


mercedes.btrecords = {}
mercedes.predicted = {}

















function mercedes.canBacktrack(ply)
    if not mercedes.cfg.vars["Backtrack"] then return false end 
    if not IsValid(ply) then return false end
    if not mercedes.btrecords[ply] then return false end 
    if ply.break_lc then return false end 

    return true 
end

function mercedes.recordBacktrack(ply)
	local deadtime = CurTime() - mercedes.cfg.vars["Backtrack time"] / 1000
	
	local records = mercedes.btrecords[ply]

	if not records then
        records = {}
		mercedes.btrecords[ply] = records
	end
	
	local i = 1
	while i < #records do
		local record = records[i]
		
		if record.simulationtime < deadtime then
			table_remove(records, i)
			i = i - 1
		end
		
		i = i + 1
	end
	
	if not ply:Alive() then return end
    if ply.break_lc then return end
	
	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end
	
	if not simtimechanged then return end

	local layers = {}
	for i = 0, 13 do
		if ply:IsValidLayer(i) then
			layers[i] = {
				cycle = ply:GetLayerCycle(i),
				sequence = ply:GetLayerSequence(i),
				weight = ply:GetLayerWeight(i)
			}
		end
	end

    local eyeAngles = ply:EyeAngles()
    local x,y = eyeAngles.x, eyeAngles.y

    local bdata = {}
    for i = 0, ply:GetBoneCount() - 1 do
        local v, a = ply:GetBonePosition( i )
        bdata[i] = { vec = v, ang = a }
    end

    local hdata = {}
    local hset = ply:GetHitboxSet()
    local hnum = ply:GetHitBoxCount( hset )
    
    for hitbox = 0, hnum - 1 do
        local bone = ply:GetHitBoxBone( hitbox, hset )
  
        if bone == nil then continue end

        local mins, maxs = ply:GetHitBoxBounds( bone, hset )

        if not mins or not maxs then continue end 

        local bonepos, ang = ply:GetBonePosition( bone )  
        mins:Rotate( ang )
        maxs:Rotate( ang )

        hdata[ #hdata + 1 ] = { pos = bonepos, mins = mins, maxs = maxs }
    end

    local skeletondata = {}

	records[len + 1] = {
		simulationtime =    ded.GetSimulationTime(ply:EntIndex()),
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            mercedes.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        //hitboxdata =        hdata,
        //skeleton =          skeletondata
    }
end

mercedes.btmodel = mercedes.CS_Model("models/player/kleiner.mdl")

function mercedes.drawCSModels_backtrack()
    if not mercedes.cfg.vars["Backtrack chams"] then return end 
    if not mercedes.canBacktrack(mercedes.target) then return end

    local len = #mercedes.btrecords[mercedes.target]
    local tbl = mercedes.btrecords[mercedes.target][mercedes.backtracktick]
    local m = mercedes.btmodel

    mercedes.CS_Model_update(mercedes.target,m,tbl)

    if mercedes.cfg.vars["Backtrack fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(mercedes.cfg.colors["Backtrack chams"])
    mercedes.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(mercedes.chamMats.invis[mercedes.cfg.vars["Backtrack material"]]) 
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if mercedes.cfg.vars["Backtrack fullbright"] then
        render_SuppressEngineLighting(false)
    end
end

mercedes.hitmarkers = {}
mercedes.hitnums = {}

gameevent.Listen( "player_hurt" )
hook_Add("player_hurt", "penissss1337", function(data)
    local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == me:UserID() then
        
        if mercedes.cfg.vars[ "On screen logs" ] then
            local hlcolor = string_ToColor( mercedes.cfg.colors[ "On screen logs" ] )
            local data = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    hurted:Name(),
                    " for ",
                    hurted:Health() - health,
                    " damage"
                },
                {
                    mercedes.HitLogsWhite,
                    hlcolor,
                    mercedes.HitLogsWhite,
                    hlcolor,
                    mercedes.HitLogsWhite,
                }
            }
            
            mercedes.onScreenLogs[ engine.TickCount() ] = data
            print( "hurt", engine.TickCount() )
        end

        if mercedes.cfg.vars["Hitmarker"] then
            mercedes.hitmarkers[ #mercedes.hitmarkers + 1 ] = { time = CurTime(), add = 0 }
        end

        if mercedes.cfg.vars["Hitnumbers"] then
            local hp = hurted:Health() - health
            mercedes.hitnums[ #mercedes.hitnums + 1 ] = { time = CurTime(), add = 0, xdir = math_random(-1,1), ydir = math_random(-1,1), dmg = hp, crit = health <= 0 }
        end

        if mercedes.cfg.vars["Hitsound"] then
            surface_PlaySound( mercedes.cfg.vars["Hitsound str"] )
        end

        if mercedes.cfg.vars["Resolver"] then 
            hurted.aimshots = (hurted.aimshots or 0) - 1
        end

    end
end)

function mercedes.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0 
    v.flticks = 0 
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false 
    v.simtime_updated = false 
    v.fakepitch = false

    mercedes.btrecords[ v ] = {}
    mercedes.predicted[ v ] = {}
end

for k, v in ipairs(player_GetAll()) do
	mercedes.initPlayerVars( v )
end

mercedes.chatmsg = {
    killsay = {
        { // Лучшие 22-23
            "1 нищий упал",
            "$$$ кешбек по зубам $$$",
            "╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
            "ты куда жертва козьего аборта",
            "iq?",
            "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
            "але , а противники то где???",
            "ты по легиту играешь ?",
            "ебать ты красиво на бутылку присел , тебе дать альт ?",
            "свежий кабанчик",
            "АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLY!",
            "на мыло и веревку то деньги есть????",
            "откисай сочняра",
            "Вот тебе паяльник , запаяй себе ебальник",
            "сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
            "Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
            "упал хуета ебаная , но в боди забрал да похуй все равно упал",
            "не противник",
            "Loading… ██████████ Lifehack.cfg Activated",
            "Tapt by Anti-Hack",
            "чето умер...",
            "Найс софт чел без читов ты 0",
            "Чел ты без читов 0",
            "Держи зонтик тебя абасали",
            "Го 1 на 1 или зассал?Точно ты же до 1 считать не умееш...",
            "упавший на медию никогда не встанет с колен.",
            "Черные глаза Вспоминаю — умираю Черные глаза Я только о тебе мечтаю",
            "меня админ заставляет это заинжектить",
            "через процесс хакер инжектить?",
            "лол ору ты прямо как 𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸",
            "обе чернокожие головы превратились в кубики льда… Бере.",
            "99 имен Аллаhа для детей",
            "Rindfleischetikettierungsüberwachungsaufgaben- übertragungsgesetz",
            "Лето 2015",
            "у тебя член не конский не по масти эпик фейл",
            "rnj ghjxbnfk njn utq",
            "гелим гелим гелим на валике",
            "Приходи один работёнка есть!, координаты: 55.8653382,49.304329",
        },
        { // Унижение
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        },
    },




 

  




}



// Init player vars 
gameevent.Listen("player_spawn")
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

mercedes.hooks.Add("player_spawn", function(data)
    local id = data.userid
    if me:UserID() == id then
        mercedes.defaultPlayerModel = nil
        timer.Simple(0.1, function() mercedes.ApplyCustomPlayerModel(true) end)
    end
end)

mercedes.hooks.AddPre( "entity_killed", function( data ) 
	local aid = data.entindex_attacker 		
	local vid = data.entindex_killed 	

    if aid ~= vid and Player( vid ):IsPlayer() and aid == me:EntIndex() then
        if mercedes.cfg.vars["Killsay"] then
            local tbl = mercedes.chatmsg.killsay[ mercedes.cfg.vars["Killsay mode"] ]
            local str = tbl[ math_random( 1, #tbl ) ]
            gRunCmd( "say", str )
        end
        
        if mercedes.cfg.vars["Killsound"] then
            surface_PlaySound( mercedes.cfg.vars["Killsound str"] )
        end

        // Kill effect
        if mercedes.cfg.vars["Kill effect"] then
            local killedPlayer = Player( vid )
            if IsValid( killedPlayer ) then
                local playerPos = killedPlayer:GetPos()
                
                // Create explosion effect
                timer.Simple(0.1, function()
                    local effectdata = EffectData()
                    effectdata:SetOrigin( playerPos )
                    effectdata:SetMagnitude( 1 )
                    effectdata:SetScale( 1 )
                    effectdata:SetRadius( 100 )
                    util.Effect( "Explosion", effectdata )
                    
                    // Create sparks
                    for i = 1, 20 do
                        timer.Simple(i * 0.02, function()
                            local sparkPos = playerPos + Vector(
                                math.random(-50, 50),
                                math.random(-50, 50),
                                math.random(0, 100)
                            )
                            local effectdata2 = EffectData()
                            effectdata2:SetOrigin( sparkPos )
                            effectdata2:SetStart( Vector(math.random(0, 255), math.random(0, 255), math.random(0, 255)) )
                            util.Effect( "Sparks", effectdata2 )
                        end)
                    end
                end)
            end
        end
     
    end
end )

function mercedes.updatePlayerVars( data )
    local id = data.userid  

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()
    
    ply.ult_prev_simtime = 0
    ply.flticks = 0
        
    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    mercedes.btrecords[ ply ] = {}
    mercedes.predicted[ ply ] = {}
end



















function mercedes.drawOverlay()
    if mercedes.UnSafeFrame then return end
    if not mercedes.frame:IsVisible() then return end

    if not mercedes.hint then
        mercedes.hintText = ""
        return
    end

    surface_SetTextColor(mercedes.Colors[165])
    surface_SetFont("tbfont")

    local tw, th = surface_GetTextSize(mercedes.hintText)

    surface_SetDrawColor(mercedes.Colors[35])
    surface_DrawRect(mercedes.hintX,mercedes.hintY,tw+20,th+10)
    surface_SetDrawColor(mercedes.Colors[54])
    surface_DrawOutlinedRect(mercedes.hintX,mercedes.hintY,tw+20,th+10,1)    

    surface_SetTextPos(mercedes.hintX+10,mercedes.hintY+5)
    surface_DrawText(mercedes.hintText)

    mercedes.hint = false
end


function mercedes.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math_Approach( first.r, second.r, FT )
    first.g = math_Approach( first.g, second.g, FT )
    first.b = math_Approach( first.b, second.b, FT )
    first.a = math_Approach( first.a, second.a, FT )

    math_Round( first.r, 0 )
    math_Round( first.g, 0 )
    math_Round( first.b, 0 )
    math_Round( first.a, 0 )

    return first
end

function mercedes.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true 
end





mercedes.ekd = false
mercedes.fbkd = false

// Dancer ( act / taunt spam )

mercedes.nextact = 0
mercedes.actCommands = {"robot","muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}

// Name changer 

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = me:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == me then return false end 

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function mercedes.nameChanger() 
        if curtime > CurTime() then return end

        local pltbl = player_GetAll()

        local len = me:Name():len()

        local mname = string.sub(me:Name(),1,len-1)

        local i = math_random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false
        
    function mercedes.hThink()
        if input_IsKeyDown(KEY_DELETE) and not mercedes.kd then 
            mercedes.togglevisible()
    
            CloseDermaMenus()
        end

        mercedes.kd = input_IsKeyDown(KEY_DELETE)

        if mercedes.IsKeyDown( mercedes.cfg.binds["Ent add"] ) and not mercedes.ekd then
            local tr = me:GetEyeTrace().Entity

            if IsValid( tr ) then 
                local class = tr:GetClass()

                //print( mercedes.allowedClasses[ class ] )

                if not mercedes.allowedClasses[ class ] then
                    mercedes.allowedClasses[ class ] = true
                else
                    mercedes.allowedClasses[ class ] = not mercedes.allowedClasses[ class ]
                end
            end
        end

        if mercedes.cfg.vars["Inverter"] and mercedes.IsKeyDown( mercedes.cfg.binds["Inverter"] ) and not inverterdown then
            mercedes.inverted = not mercedes.inverted 
        end

        inverterdown = mercedes.IsKeyDown( mercedes.cfg.binds["Inverter"] )

        mercedes.ekd = mercedes.IsKeyDown( mercedes.cfg.binds["Ent add"] )

        if mercedes.IsKeyDown( mercedes.cfg.binds["Fullbright"] ) and not mercedes.fbkd then
            mercedes.fbe = not mercedes.fbe
        end

        mercedes.fbkd = mercedes.IsKeyDown( mercedes.cfg.binds["Fullbright"] )

        if mercedes.cfg.vars["FSpec ClickTP"] and mercedes.IsKeyDown( mercedes.cfg.binds["FSpec ClickTP"] ) then
            local pos = me:GetEyeTrace().HitPos
            
            //print(pos)

            //gRunCmd( "ba", "spec" )

            gRunCmd( "FTPToPos", string_format("%d, %d, %d", pos.x, pos.y, pos.z), string_format("%d, %d, %d", 0, 0, 0) )
        end

        
        
        // mercedes.cfg.vars["FSpec Teleport"] = false
        // mercedes.cfg.binds["FSpec Teleport"] = 0
        
        // mercedes.cfg.vars["FSpec Masskill"] = false
        // mercedes.cfg.binds["FSpec Masskill"] = 0
        
        // mercedes.cfg.vars["FSpec Velocity"] = false
        // mercedes.cfg.binds["FSpec Velocity"] = 0

        if mercedes.cfg.vars["Chat spammer"] and CurTime() > chatdelay then
            local s = mercedes.cfg.vars["Chat OOC"] and "// " or ""

            gRunCmd("say",s.."1")

            chatdelay = CurTime() + 0.5
        end
    
        if mercedes.cfg.vars["Name stealer"] then mercedes.nameChanger() end
    
        if ded.GetCurrentCharge() < mercedes.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if mercedes.cfg.vars["Tickbase shift"] then 
            if mercedes.IsKeyDown( mercedes.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end
            
            local ar_bind = mercedes.cfg.binds["Auto recharge"]
            local ar_active = mercedes.cfg.vars["Auto recharge"] and (ar_bind == 0 or mercedes.IsKeyDown(ar_bind))
            
            local shouldcharge = ded.GetCurrentCharge() < mercedes.cfg.vars["Charge ticks"] and ar_active
            
            ded.StartRecharging( shouldcharge )
        
            if shouldcharge then
                ded.StartShifting( false )
            end
        end
    
        if mercedes.cfg.vars["Taunt spam"] and mercedes.nextact < CurTime() and me:Alive() and not me:IsPlayingTaunt() then 
            local act = mercedes.actCommands[mercedes.cfg.vars["Taunt"]]
    
            gRunCmd("act", act)
            mercedes.nextact = CurTime() + 0.3
        end
    
        if mercedes.cfg.vars["Yaw base"] == 2 then
            tply = mercedes.GetSortedPlayers( 1, 0, 1, false ) 
    
            if tply then
                mercedes.aatarget = tply[1][1]
            end
        end

        if mercedes.cfg.vars["Auto peak"] then
            mercedes.autopeakThink()
        end
    end
end


mercedes.vieworigin = me:EyePos()
mercedes.viewfov    = 0
mercedes.znear      = 0

mercedes.tpenabled = false
mercedes.tptoggled = false
mercedes.tpCameraPos = me:EyePos()

mercedes.fcvector = me:EyePos()
mercedes.fcangles = me:EyeAngles()
mercedes.fcenabled = false
mercedes.fctoggled = false


mercedes.cameraHullMax = Vector( 3, 3, 3 )
mercedes.cameraHullMin = Vector( -3, -3, -3 )
function mercedes.hCalcView( ply, origin, angles, fov, znear, zfar )

    if mercedes.UnSafeFrame then 
        return { origin = origin, angles = angles, fov = fov } 
    end

    local view = {}

    local tppressed = mercedes.IsKeyDown(mercedes.cfg.binds["Third person"])
    local fcpressed = mercedes.IsKeyDown(mercedes.cfg.binds["Free camera"])

    if mercedes.cfg.vars["Third person"] and tppressed and not mercedes.tptoggled then
        mercedes.tpenabled = not mercedes.tpenabled
    end

    if mercedes.cfg.vars["Free camera"] and fcpressed and not mercedes.fctoggled then
        mercedes.fcenabled = not mercedes.fcenabled
        mercedes.fcangles = me:EyeAngles()
    elseif mercedes.fcenabled and not mercedes.cfg.vars["Free camera"] then
        mercedes.fcenabled = false
    end

    mercedes.tptoggled = tppressed
    mercedes.fctoggled = fcpressed


    if mercedes.cfg.vars["Fake duck"] and mercedes.IsKeyDown(mercedes.cfg.binds["Fake duck"]) then
        origin.z = me:GetPos().z + 64
    end

    local fangs = mercedes.cfg.vars["Silent aim"] and mercedes.SilentAngle or angles

    
    if mercedes.fcenabled then
        local speed = mercedes.cfg.vars["Free camera speed"]
        
        if input_IsKeyDown(KEY_W) then
            mercedes.fcvector = mercedes.fcvector + mercedes.SilentAngle:Forward() * speed
        end

        if input_IsKeyDown(KEY_S) then
            mercedes.fcvector = mercedes.fcvector - mercedes.SilentAngle:Forward() * speed
        end

        if input_IsKeyDown(KEY_A) then
            mercedes.fcvector = mercedes.fcvector - mercedes.SilentAngle:Right() * speed
        end

        if input_IsKeyDown(KEY_D) then
            mercedes.fcvector = mercedes.fcvector + mercedes.SilentAngle:Right() * speed
        end

        if input_IsKeyDown(KEY_SPACE) then
            mercedes.fcvector.z = mercedes.fcvector.z + speed
        end

        if input_IsKeyDown(KEY_LSHIFT) then
            mercedes.fcvector.z = mercedes.fcvector.z - speed
        end

        view.origin = mercedes.fcvector
        view.angles = fangs
        
        if mercedes.cfg.binds["Fov zoom"] ~= 0 and mercedes.IsKeyDown( mercedes.cfg.binds["Fov zoom"] ) then
            view.fov = mercedes.cfg.vars["Fov zoom"]
        else
            view.fov = mercedes.cfg.vars["Fov override"]
        end
        view.drawviewer = not mercedes.cfg.vars["Ghetto free cam"]
    else
        mercedes.fcvector = origin
        local targetOrigin = origin

        if mercedes.tpenabled then
            targetOrigin = origin - ( (fangs):Forward() * mercedes.cfg.vars["Third person distance"] )

            if mercedes.cfg.vars["Third person collision"] then
                local tr = {}

                tr.start = origin
                tr.endpos = targetOrigin
                tr.mins = mercedes.cameraHullMin
                tr.maxs = mercedes.cameraHullMax
                tr.filter = ply
                tr.mask = MASK_BLOCKLOS

                local res = TraceHull( tr )

                targetOrigin = res.HitPos
            end

            if mercedes.cfg.vars["Third person smoothing"] then
                if not mercedes.tpCameraPos then
                    mercedes.tpCameraPos = targetOrigin
                else
                    local lerp = math_Clamp( FrameTime() * 10, 0, 1 )
                    mercedes.tpCameraPos.x = mercedes.tpCameraPos.x + ( targetOrigin.x - mercedes.tpCameraPos.x ) * lerp
                    mercedes.tpCameraPos.y = mercedes.tpCameraPos.y + ( targetOrigin.y - mercedes.tpCameraPos.y ) * lerp
                    mercedes.tpCameraPos.z = mercedes.tpCameraPos.z + ( targetOrigin.z - mercedes.tpCameraPos.z ) * lerp
                end

                view.origin = mercedes.tpCameraPos
            else
                mercedes.tpCameraPos = targetOrigin
                view.origin = targetOrigin
            end
        else
            mercedes.tpCameraPos = origin
            view.origin = origin
        end

        view.angles = fangs
        
        if mercedes.cfg.binds["Fov zoom"] ~= 0 and mercedes.IsKeyDown( mercedes.cfg.binds["Fov zoom"] ) then
            view.fov = mercedes.cfg.vars["Fov zoom"]
        else
            view.fov = mercedes.cfg.vars["Fov override"]
        end
        view.drawviewer = mercedes.tpenabled
    end

    mercedes.vieworigin = ( mercedes.cfg.vars["Ghetto free cam"] and mercedes.fcenabled ) and mercedes.fcvector or origin
    mercedes.viewfov    = view.fov
    mercedes.znear      = znear

	return view
end

function mercedes.GetFovRadius()
    local Radius = mercedes.cfg.vars["Aimbot FOV"]

    local Ratio = scrw / scrh
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = mercedes.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (mercedes.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * scrw
end

function mercedes.hCalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)
    if wep.CalcViewModelView then wep.CalcViewModelView = nil end

    pos = mercedes.vieworigin 
	ang = mercedes.cfg.vars["Silent aim"] and mercedes.SilentAngle or ang

	return pos, ang
end

do
    local drawing = false

    function mercedes.hPreDrawViewModel( vm, ply, w )
        if mercedes.UnSafeFrame then return end
        if ply ~= me then return end

        if mercedes.cfg.vars["Viewmodel chams"] then
            local col = string_ToColor( mercedes.cfg.colors["Viewmodel chams"] )
            mercedes.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = mercedes.chamMats.vis[mercedes.cfg.vars["Viewmodel chams type"]] 

            render_SetBlend(col.a/255)
            render_SetColorModulation(col.r/255,col.g/255,col.b/255)
            render_MaterialOverride(mat)
        end

        if mercedes.cfg.vars["Fullbright viewmodel"] then
            render_SuppressEngineLighting( true )
        end

        if mercedes.cfg.vars["Viewmodel fov"] ~= GetConVar("viewmodel_fov"):GetInt() and not drawing then 
            cam.IgnoreZ(true)
                cam.Start3D(nil, nil, mercedes.cfg.vars["Viewmodel fov"])
                drawing = true

                vm:DrawModel()

                drawing = false
                cam.End3D()
            cam.IgnoreZ(false)
        else
            return 
        end
        
        return true
    end

end

function mercedes.hPostDrawViewModel( vm, ply, w )
    render_SetColorModulation(1, 1, 1)
    render_MaterialOverride()
    render_SetBlend(1)
    render_SuppressEngineLighting(false)
end

mercedes.bulletImpacts = {}

function mercedes.hOnImpact( data )
    local startpos = data.m_vStart 

    if mercedes.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == me:EyePos() then
        local vm = me:GetViewModel()
	    local wep = me:GetActiveWeapon()

        if vm && IsValid( wep ) && IsValid( vm ) then
            local muzzle = vm:LookupAttachment( "muzzle" )
			
		    if muzzle == 0 then
			    muzzle = vm:LookupAttachment( "1" )
		    end

            if vm:GetAttachment( muzzle ) then
                startpos = vm:GetAttachment( muzzle ).Pos
            end
        end
    end

    mercedes.bulletImpacts[#mercedes.bulletImpacts + 1] = {
        shootTime = CurTime(),
        startPos = startpos,
        endPos = data.m_vOrigin,
        hitbox = data.m_nHitbox,
        alpha = 255
    }
end


do
    local oldtrmat = mercedes.cfg.vars["Bullet tracers material"]
    local tracemat = Material("sprites/tp_beam001")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )

    function mercedes.hPostDrawOpaqueRenderables()
        if mercedes.UnSafeFrame then return end

        if mercedes.cfg.vars["Angle arrows"] then
            local pos = me:GetPos()

            cam_IgnoreZ(true)

            cam_Start3D2D( pos, Angle(0, mercedes.realAngle.y + 45, 0), 1 )
                surface_SetDrawColor( realcolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()
    
            cam_Start3D2D( pos, Angle(0, mercedes.fakeAngles.angle.y + 45, 0), 1 )
                surface_SetDrawColor( fakecolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()
    
            local lby = lby( me:EntIndex() )
            cam_Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface_SetDrawColor( lbycolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()
    
            cam_IgnoreZ( false )
        end

        if mercedes.cfg.vars["Bullet tracers"] then
            local trmat = mercedes.cfg.vars["Bullet tracers material"] 
    

            //print( trmat, oldtrmat )
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end
    
            local tracercolor = string_ToColor(mercedes.cfg.colors["Bullet tracers"])
    
            local curTime = CurTime()
            local dieTime = mercedes.cfg.vars["Tracers die time"]
    
            for i = #mercedes.bulletImpacts, 1, -1 do
                local impact = mercedes.bulletImpacts[i]

                // impact.alpha = impact.alpha - 0.15

                if (curTime - impact.shootTime) > dieTime then
                    table_remove(mercedes.bulletImpacts, i)
                    continue
                end

                tracercolor.a = impact.alpha
    
                render_SetMaterial( tracemat ) 
                render_DrawBeam( impact.startPos, impact.endPos, 4, 1, 1, tracercolor )
            end
        end

        

        if mercedes.cfg.vars["Auto peak"] and mercedes.startedPeeking then
            mercedes.drawAutopeak()
        end


    end 
end


mercedes.playerTbl = FindMetaTable("Player")

mercedes.playerCache = {}
function mercedes.playerTableUpdate( ply )
    if not IsValid( ply ) then return end
    if not ply:IsPlayer() then return end
    if ply == NULL or ply == nil then return end
    
    if not mercedes.playerCache[ ply ] then
        mercedes.playerCache[ ply ] = {}
    end
    
    mercedes.playerCache[ ply ].Name = ply:Name()

    local t = ply:Team()

    mercedes.playerCache[ ply ].Team = t
    mercedes.playerCache[ ply ].TeamColor = team_GetColor( t ) 
    mercedes.playerCache[ ply ].TeamName = team_GetName( t )

    mercedes.playerCache[ ply ].GetUserGroup = ply:GetUserGroup()

    mercedes.playerCache[ ply ].Health = ply:Health()
    mercedes.playerCache[ ply ].GetMaxHealth = ply:GetMaxHealth()


    mercedes.playerCache[ ply ].Armor = ply:Armor()
    mercedes.playerCache[ ply ].GetMaxArmor = ply:GetMaxArmor()

    mercedes.playerCache[ ply ].GetPos = ply:GetPos()

    mercedes.playerCache[ ply ].ObserverMode = ply:GetObserverMode()
    mercedes.playerCache[ ply ].ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    mercedes.playerCache[ ply ].WeaponClass = IsValid(w) and ( mercedes.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    mercedes.playerCache[ ply ].WeaponAmmo = IsValid(w) and w:Clip1() or "-"
 
    if mercedes.playerTbl.getDarkRPVar and DarkRP and DarkRP.formatMoney then
        local money = ply:getDarkRPVar("money")
        if money ~= nil then
            mercedes.playerCache[ ply ].MoneyVar = DarkRP.formatMoney(money)
        else
            mercedes.playerCache[ ply ].MoneyVar = "beggar"
        end
    else
        mercedes.playerCache[ ply ].MoneyVar = "beggar"
    end
end  
 
function mercedes.playerDataUpdate( ply )
    if not IsValid( ply ) then return end
    if not ply:IsPlayer() then return end
    if ply == NULL or ply == nil then return end
    
    if not mercedes.playerCache[ ply ] then
        mercedes.playerCache[ ply ] = {}

        mercedes.playerTableUpdate( ply )
        return
    end

    mercedes.playerTableUpdate( ply )
end

// Entity data

mercedes.entityCache = {}
mercedes.allowedClasses = {}

function mercedes.entTableUpdate()
    local entitys = ents_GetAll()

    mercedes.entityCache = {}

    for i = 1, #entitys do
        local ent = entitys[ i ]

        if not IsValid( ent ) then continue end 
        if not mercedes.allowedClasses[ ent:GetClass() ] then continue end

        mercedes.entityCache[ #mercedes.entityCache + 1 ] = {
            entity = ent,
            class = ent:GetClass(),
            position = ent:GetPos(),
        }
    end
end



// Resolver 

mercedes.bruteYaw = { -90, 0, 90, 180, -180, 180, 90, 0, -90 }

















do
    local localData = {}

    localData.origin = Vector()

    function mercedes.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end
    
    function mercedes.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks = 0
    local lastSimTime = 0

    local FRAME_START = 0
    local FRAME_NET_UPDATE_START = 1
    local FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2
    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3
    local FRAME_NET_UPDATE_END = 4
    local FRAME_RENDER_START = 5
    local FRAME_RENDER_END = 6

    function mercedes.hFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            if mercedes.desiredModel and IsValid(me) and me:GetModel() ~= mercedes.desiredModel then
                me:SetModel(mercedes.desiredModel)
            end

            mercedes.entTableUpdate()

            plys = player.GetAll()

            local orig = me:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            mercedes.FillLocalNetworkData( data )

            for i = 1, #plys do
                local v = plys[i]

                //if not v.ult_prev_pos then continue end

                local cur_simtime = ded.GetSimulationTime(v:EntIndex())
                local cur_pos = v:GetNetworkOrigin()

                --v.ult_cur_pos = cur_pos

                if not v.ult_prev_simtime then
                    v.ult_prev_simtime = cur_simtime
                    v.ult_prev_pos = cur_pos
                    // v.ult_prev_hitbox_pos = cur_pos
                    v.flticks = 0
                    v.missedanimticks = 0
                    v.simtime_updated = false 
                    v.break_lc = false

                    mercedes.btrecords[ v ] = {}
                    mercedes.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime ~= cur_simtime then
                    local flticks = mercedes.TIME_TO_TICKS(cur_simtime-v.ult_prev_simtime)

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math_Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    --if v.ult_prev_pos ~= v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = mercedes.getHitbox(v)
                    --end 
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if mercedes.canBacktrack(v) and v ~= me and v.simtime_updated then
                    mercedes.recordBacktrack(v)
                end

                if v.break_lc then
                    mercedes.btrecords[ v ] = {}
                end

                if mercedes.cfg.vars["Extrapolation"] and v ~= me then
                    local scale = mercedes.cfg.vars["Extrapolation scale"] or 1
                    local predTime = ( ded.GetLatency(0) + ded.GetLatency(1) ) * scale

                    ded.StartSimulation( v:EntIndex() )

                    local pos = v:GetNetworkOrigin()

                    print( mercedes.TIME_TO_TICKS( predTime ) )

                    for tick = 1, mercedes.TIME_TO_TICKS( predTime ) do
                        ded.SimulateTick()
    
                        local data = ded.GetSimulationData()
                        debugoverlay.Box( data.m_vecAbsOrigin, v:OBBMins(), v:OBBMaxs(), 0.1, Color( 255, 25, 25, 8 ) )
                    end
    
                    local data = ded.GetSimulationData()
                    pos = data.m_vecAbsOrigin

                    -- сохраняем позицию для визуализации
                    mercedes.predicted[ v ] = mercedes.predicted[ v ] or {}
                    mercedes.predicted[ v ].pos = pos

                    ded.FinishSimulation()

                    v:SetRenderOrigin( pos )
                    v:SetNetworkOrigin( pos )  
                    v:InvalidateBoneCache()
                    v:SetupBones()
                end

            end
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v ~= me then continue end

                if mercedes.cfg.vars["Resolver"] then

                    local angs = Angle()
                    angs.y = mercedes.bruteYaw[ v.aimshots % #mercedes.bruteYaw + 1 ] + v:EyeAngles().y

                    v:SetRenderAngles( angs )
                    // v:SetNetworkAngles( angs )

                    setlby( v:EntIndex(), angs.y )  

                    // mercedes.combobox( "Yaw mode", { "Step", "Delta brute" }, "Yaw mode", p:GetItemPanel() )
                    // mercedes.slider( "Max misses", "Resolver max misses", 1, 6, 0, p:GetItemPanel() )
                    // mercedes.checkbox( "Invert first shot", "Invert first shot", p:GetItemPanel() )      
                    // v:SetupBones()
                end

    

            end

            
            

	        
         end
    end
end

function mercedes.hPostFrameStageNotify( stage ) 
    if stage ~= 3 then return end
    
    local plys = player_GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v ~= me then continue end
        
        mercedes.playerDataUpdate( v )
    end

end

mercedes.fakeAngles = {
    angle = me:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = me:GetPos(),
}

function mercedes.hUpdateAnimation( v )
    v:SetPoseParameter( "head_pitch", 0 )
    v:SetPoseParameter( "head_yaw", 0 )

    if mercedes.cfg.vars["Pitch resolver"] and v.fakepitch then
        v:SetPoseParameter( "aim_pitch", -89 )
        v:SetPoseParameter( "head_pitch", -89 )
    end

    v:InvalidateBoneCache()
end

function mercedes.hShouldUpdateAnimation( entIndex ) 
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
mercedes.realModel = mercedes.CS_Model( me:GetModel() )
mercedes.fakeModel = mercedes.CS_Model( me:GetModel() )

mercedes.newModel = me:GetModel()

function mercedes.drawCSModels_real()
    if not mercedes.cfg.vars["Anti aim chams"] or not mercedes.tpenabled then 
        return 
    end 
    if not me:Alive() then 
        return 
    end

    local mymodel = me:GetModel()

    if mercedes.newModel ~= mymodel then
        mercedes.CS_Model( mymodel )
        mercedes.newModel = mymodel
    end

    local tbl = {
        layers = mercedes.fakeAngles.layers,
        angles = mercedes.fakeAngles.angle,
        sequence = mercedes.fakeAngles.seq,
        cycle = mercedes.fakeAngles.cycle,
        origin = mercedes.fakeAngles.origin,
        movex = mercedes.fakeAngles.movex,
        movey = mercedes.fakeAngles.movey,
    }

    mercedes.CS_Model_update( me, mercedes.realModel, tbl )

    if mercedes.cfg.vars["Antiaim fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(mercedes.cfg.colors["Real chams"])
    mercedes.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(mercedes.chamMats.invis[mercedes.cfg.vars["Antiaim material"]]) 
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    render_SetBlend(col.a/255) 
    mercedes.realModel:SetRenderMode(1)
    mercedes.realModel:DrawModel()

    if mercedes.cfg.vars["Antiaim fullbright"] then
        render_SuppressEngineLighting(false)
    end
end

do
    local CopyMat		= Material("pp/copy")
    local AddMat		= Material( "pp/add" )
    local SubMat		= Material( "pp/sub" )
    local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})

    local outline_mats = {
        [1] = OutlineMat,
        [2] = SubMat,
        [3] = AddMat,
        [4] = GradMat,
        [5] = BloomMat,
    }

    local subclear = {
        [2] = true,
        //[4] = true,
    }
    
    mercedes.cfg.vars["Player outline"] = false
    mercedes.cfg.vars["Entity outline"] = false
    mercedes.cfg.colors["Player outline"] = "45 255 86 255"
    mercedes.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function mercedes.RenderOutline()
        local renderEnts = {}

        if mercedes.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do 
                local v = plys[ i ]

                if not IsValid( v ) or v == me or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if mercedes.cfg.vars["Entity outline"] then
            for i = 1, #mercedes.entityCache do
                local v = mercedes.entityCache[ i ].entity 

                if not IsValid( v ) or v:IsDormant() then continue end
        
                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)
        
        if subclear[ mercedes.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam_IgnoreZ(true)
            render.SuppressEngineLighting(true)
        
            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)
            
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            
            cam_Start3D()
                for i = 1, #renderEnts do 
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam_End3D()
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam_Start2D()
                for i = 1, #renderEnts do 
                    local c = renderEnts[i]:IsPlayer() and string_ToColor( mercedes.cfg.colors["Player outline"] ) or string_ToColor( mercedes.cfg.colors["Entity outline"] ) 

				    render.SetStencilReferenceValue( i )

                    surface_SetDrawColor( c )
                    surface_DrawRect( 0, 0, scrw, scrh )

                    // surface_SimpleTexturedRect( 0, 0, scrw, scrh, string_ToColor( mercedes.cfg.colors["Health bar gradient"] ) , mercedes.Materials["Gradient"] )
                end
            cam_End2D()
            
            render_SuppressEngineLighting(false)
            cam_IgnoreZ(false)
        render.SetStencilEnable(false)
        
        render.CopyRenderTargetToTexture(DrawTexture)

        if mercedes.cfg.vars["Outline style"] > 1 then 
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()
        
        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            local mat = outline_mats[ mercedes.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render_SetMaterial( mat )
            
            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end
                    
                    render.DrawScreenQuadEx(x,y,scrw,scrh) 
                end
            end
        render.SetStencilEnable(false)
    end
end

function mercedes.hPostDrawEffects()
    if mercedes.UnSafeFrame then return end
    if not mercedes.cfg.vars["Player outline"] and not mercedes.cfg.vars["Entity outline"] and not mercedes.cfg.vars["Dlight"] then return end

    // Dlight
    if mercedes.cfg.vars["Dlight"] then
        local plys = player_GetAll()
        local dlightColor = string_ToColor( mercedes.cfg.colors["Dlight"] )
        local brightness = mercedes.cfg.vars["Dlight brightness"] / 255
        local dlightSize = mercedes.cfg.vars["Dlight size"]
        
        for i = 1, #plys do
            local v = plys[i]
            if not IsValid(v) or not v:IsPlayer() or v == me then continue end
            
            local dlight = DynamicLight( v:EntIndex() )
            if dlight then
                dlight.pos = v:GetPos()
                dlight.r = dlightColor.r
                dlight.g = dlightColor.g
                dlight.b = dlightColor.b
                dlight.brightness = brightness
                dlight.Decay = dlightSize
                dlight.Size = dlightSize
                dlight.DieTime = CurTime() + 0.1
            end
        end
    end

    mercedes.PostRender()
    mercedes.RenderOutline()
end
    
function mercedes.DSADJ( s )
    return mercedes.cfg.vars["Disable SADJ"] and -1 or nil
end

mercedes.lmc = false 
mercedes.fbe = false

function mercedes.PreRender()
    if mercedes.cfg.vars["Fullbright"] or mercedes.fbe then
        render.SetLightingMode( mercedes.cfg.vars["Fullbright mode"] )
        mercedes.lmc = true
    end
end

function mercedes.PostRender()
    if mercedes.lmc then
        render.SetLightingMode( 0 )
        mercedes.lmc = false
    end
end


ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )

// Gamemode hooks

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end


GAMEMODE["EntityFireBullets"] = function( self, p, data ) 
    if not mercedes.activeWeapon then return end

    local tick = engine.TickCount()
    if mercedes.cfg.vars[ "On screen logs" ] and data.Src == me:EyePos() and mercedes.aimingrn and mercedes.target and not mercedes.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1
        
        local tr = {}
        tr.filter = me 
        tr.start = data.Src 
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        if mercedes.target.break_lc then
            reason = 4
        elseif ded.GetLatency( 0 ) > 0.2 then
            reason = 3
        elseif tr.StartSolid or tr.Hit and tr.Entity ~= mercedes.target then
            reason = 2
        end
        
        local hlcolor = string_ToColor( mercedes.cfg.colors[ mercedes.MissReasons[ reason ].var ] )
        local data = {
            tick = tick,
            { "Shot at ", mercedes.target:Name(), " missed due to ", mercedes.MissReasons[ reason ].str, },
            { mercedes.HitLogsWhite, hlcolor, mercedes.HitLogsWhite, hlcolor, }
        }
            
        mercedes.onScreenLogs[ tick ] = data
    end
 
    local spread = data.Spread * -1
    
	if mercedes.cones[ mercedes.activeWeaponClass ] == spread or spread == mercedes.nullVec then return end

    mercedes.cones[ mercedes.activeWeaponClass ] = spread;
end

// Hooks 

mercedes.hooks.Add( "Think",                            mercedes.hThink )
mercedes.hooks.AddAft( "RenderScene",                   mercedes.hRenderScene )

mercedes.hooks.AddPre( "CalcView",                      mercedes.hCalcView )
mercedes.hooks.AddPre( "CalcViewModelView",             mercedes.hCalcViewModelView )

mercedes.hooks.AddPre( "PreDrawViewModel",              mercedes.hPreDrawViewModel )
mercedes.hooks.AddAft( "PostDrawViewModel",             mercedes.hPostDrawViewModel )

mercedes.hooks.AddAft( "PostDrawOpaqueRenderables",     mercedes.hPostDrawOpaqueRenderables )
mercedes.hooks.AddAft( "PostDrawEffects",               mercedes.hPostDrawEffects )

mercedes.hooks.Add( "OnImpact",                         mercedes.hOnImpact )

mercedes.hooks.Add( "PreFrameStageNotify",              mercedes.hFrameStageNotify )
mercedes.hooks.Add( "PostFrameStageNotify",             mercedes.hPostFrameStageNotify )

mercedes.hooks.Add( "UpdateAnimation",                  mercedes.hUpdateAnimation )
mercedes.hooks.Add( "ShouldUpdateAnimation",            mercedes.hShouldUpdateAnimation )

mercedes.hooks.AddPre( "AdjustMouseSensitivity",        mercedes.DSADJ )

mercedes.hooks.AddAft( "RenderScreenspaceEffects",      mercedes.drawChams )
mercedes.hooks.AddAft( "PostDrawTranslucentRenderables",mercedes.PostDrawTranslucentRenderables )

mercedes.hooks.AddAft( "DrawOverlay",                   mercedes.drawOverlay )

mercedes.hooks.AddPre( "PreRender",                     mercedes.PreRender )
mercedes.hooks.AddPre( "PostRender",                    mercedes.PostRender )
mercedes.hooks.AddPre( "PreDrawHUD",                    mercedes.PostRender )

mercedes.hooks.AddPre( "DrawPhysgunBeam",               mercedes.DrawPhysgunBeamFunc )          
