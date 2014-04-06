-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
--local radical = require("radical")
-- require("vicious")

confdir = awful.util.getdir("config")

require("chris_error")	

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(confdir .. "/themes/default/theme.lua")
--beautiful.init(confdir .. "/themes/powerarrow-dark/theme.lua")

-- Run command
function run_once(prg, args)
   if not prg then
	  do return nil end
   end
   if not args then
	  args=""
   end
   awful.util.spawn_with_shell('pgrep -f -u $USER -x ' .. prg .. ' || (' .. prg .. ' ' .. args ..')')
end


run_once("xcompmgr",'xcompmgr -CcfF -I "20" -O "10" -D "1" -t "-5" -l "-5" -r "4.2" -o ".82" &')


-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
-- editor = os.getenv("EDITOR") or "nano"
editor = "emacs24"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

--require("chris_tagname")
require("chris_menu")
require("chris_global_mouse_binding")
require("chris_client_mouse_binding")
require("chris_tags_config")
require("chris_rodentbane")
-- {{{ Wibox

require("chris_wibox")
require("chris_key_binding")
require("chris_theme")

-- Set keys
root.keys(globalkeys)
-- }}}

require("chris_signals")
