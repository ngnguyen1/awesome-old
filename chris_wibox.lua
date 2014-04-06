local vicious = require("vicious")
require("awful")
require("beautiful")
require("naughty")

require("chris_battery")

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" },
--                                      "%a %b %d, %H:%M:%S", 1)
--
--mytextclock = awful.widget.textclock({ align = "right" },
                                     "%a %Y/%m/%d, %H:%M:%S", 1)
--
-- Create a systray
--
mysystray = widget({ type = "systray" })

--
-- Declaration
--
wiboxes_num = 1
wiboxes = {}
wibox_bottom = {}
wibox_top = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytasklist = {}
titlebar = {}
buttery_textbox = {}
volume_display = {}
meminfo = {}

--
-- Mouse buttons for taglist
--
function taglist_init_buttons()
   mytaglist.buttons = awful.util.table.join(
      awful.button({ }, 1, awful.tag.viewonly),
      awful.button({ modkey }, 1, awful.client.movetotag),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, awful.client.toggletag),
      awful.button({ }, 4, awful.tag.viewnext),
      awful.button({ }, 5, awful.tag.viewprev) )
end

--
-- Mouse buttons for tasklist
--
function tasklist_init_buttons()
   mytasklist.buttons = awful.util.table.join(
      awful.button({ }, 1, function (c)
                              if not c:isvisible() then
                                 awful.tag.viewonly(c:tags()[1])
                              end
                              client.focus = c
                              c:raise()
                           end),
      awful.button({ }, 3, function ()
                              if instance then
                                 instance:hide()
                                 instance = nil
                              else
                                 instance = awful.menu.clients({ width=250 })
                              end
                           end),
      awful.button({ }, 4, function ()
                              awful.client.focus.byidx(1)
                              if client.focus then client.focus:raise() end
                           end),
      awful.button({ }, 5, function ()
                              awful.client.focus.byidx(-1)
                              if client.focus then client.focus:raise() end
                           end))
end

function separator()
   spr = widget({ type = "textbox" })
   spr.text = ' '
   sprd = widget({ type = "textbox" })
   sprd.text = '<span background="#313131" font="Terminus 12"> </span>'
   sprdots = widget({ type = "textbox" })
   sprdots.text = '⁝'
   arrl = widget ({type = "imagebox" })
   arrl.image = image(beautiful.arrl)
   arrl_dl = widget ({type = "imagebox" })
   arrl_dl.image = image(beautiful.arrl_dl)
   arrl_ld = widget ({type = "imagebox" })
   arrl_ld.image = image(beautiful.arrl_ld)
   arrl_dfl = widget ({type = "imagebox" })
   arrl_dfl.image = image(beautiful.arrl_dfl)
   arrl_lfd = widget ({type = "imagebox" })
   arrl_lfd.image = image(beautiful.arrl_lfd)

end

function battery_widget_init()
   battery_textbox = widget({ type = "textbox" })
   bat = tim_battery.battery_closure("BAT0")
   battery_textbox.text = bat()
   battery_timer = timer({ timeout = 10 })
   battery_timer:add_signal("timeout", function () battery_textbox.text = bat() end)
   battery_timer:start()
   battery_img = widget({ type="imagebox"})
   battery_img.image = image(beautiful.bat)
end

--
-- Memory info
--

-- function update_ram_status()
--    local active, total
--    for line in io.lines('/proc/meminfo') do
--       for key, value in string.gmatch(line, "(%w+):\ +(%d+).+") do
--          if key == "Active" then active = tonumber(value)
--          elseif key == "MemTotal" then total = tonumber(value) end
--       end
--    end
--    return string.format("<span color='green'>%.2f (%.2f M / %.2f M)</span> ",
--                         active/total * 100, active / 1024, total / 1024)
-- end

-- function meminfo_init()
--    meminfo = widget({ type = "textbox", align = "right" })
--    awful.hooks.timer.register(7, function() meminfo.text = update_ram_status() end)
-- end

function meminfo_init()
   meminfo = widget({ type = "textbox" })
   require("vicious")
   vicious.register(meminfo, vicious.widgets.mem,
                    "<span color='cyan'>$1% ($2MB / $3MB)</span> ", 7)
   mem_img = widget({ type = "imagebox"})
   mem_img.image = image(beautiful.mem)
end


function volume_widget_init()
   volume_display = widget({ type = "textbox" })
   require("vicious")
   vicious.register(volume_display, vicious.widgets.volume,
		    "<span color='green'>$1$2</span> ", 0.5, "Master")
   vol_img = widget({ type = "imagebox"})
   vol_img.image = image(beautiful.vol)
end

function promptbox_init(s)
   -- Create a promptbox for each screen
   mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
end

function layoutbox_init(s)
   --
   -- Create an imagebox widget which will contains an icon indicating which layout we're using.
   -- We need one layoutbox per screen.
   --
   mylayoutbox[s] = awful.widget.layoutbox(s)
   mylayoutbox[s]:buttons(awful.util.table.join(
                             awful.button({ }, 1,
                                          function () awful.layout.inc(layouts, 1) end),
                             awful.button({ }, 3,
                                          function () awful.layout.inc(layouts, -1) end),
                             awful.button({ }, 4,
                                          function () awful.layout.inc(layouts, 1) end),
                             awful.button({ }, 5,
                                          function () awful.layout.inc(layouts, -1) end)))
end

function taglist_init(s)
   -- Create a taglist widget
   mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
end

function tasklist_init(s)
   -- Create a tasklist widget
   mytasklist[s] = awful.widget.tasklist(
      function(c)
         return awful.widget.tasklist.label.currenttags(c, s)
      end, mytasklist.buttons)

   -- Create a title bar
   titlebar[s] = awful.widget.tasklist(
      function(c)
         return awful.widget.tasklist.label.focused(c, s)
      end)
end

function wibox_bottom_init(s)
   wibox_bottom[s] = awful.wibox({ position = "bottom",
                                   height = 22, border_width="2",
                                   screen = s })
   -- wibox_bottom[s] = awful.wibox({ position = "left",
   --                                 align = "right",
   --                                 height = "96%",
   --                                 screen = s })
   wibox_bottom[s].widgets = {
      {
         mylauncher,
         layout = awful.widget.layout.horizontal.leftright
      },
--      mylayoutbox[s],
      s == 1 and mysystray or nil,
      spr,
      sprdots,
      sprdots,
      sprdots,

      mypromptbox[s],
      volume_display,
      vol_img,
      arrl_dl,
      arrl_ld,
      battery_textbox,
      battery_img,
      arrl_dl,
      arrl_dfl,
      arrl_dl,
      arrl_dfl,
      meminfo,
      mem_img,
      arrl_dl,
      arrl_dfl,
      arrl_dl,
      arrl_dfl,
      arrl,


--      mytaglist[s],
      mytasklist[s],
--      mypromptbox[s],
      layout = awful.widget.layout.horizontal.rightleft
   }
end

function wibox_top_init(s)
   wibox_top[s] = awful.wibox({ position = "top",
                                height = 20,
                                screen = s })
   wibox_top[s].widgets = {
      {
         mylayoutbox[s],
         spr,
         arrl_dl,
         arrl_ld,
         spr,
         mytextclock,
         arrl_dl,
         arrl_ld,
         arrl,
         layout = awful.widget.layout.horizontal.rightleft
      },

      
      mytaglist[s],

--      mytasklist[s],
      --titlebar[s],

      layout = awful.widget.layout.horizontal.leftright
   }
end

taglist_init_buttons()
tasklist_init_buttons()
battery_widget_init()
volume_widget_init()
meminfo_init()
separator()

for s = 1, screen.count() do
   promptbox_init(s)
   layoutbox_init(s)
   taglist_init(s)
   tasklist_init(s)
   wibox_bottom_init(s)
   wibox_top_init(s)
end

wiboxes['bottom'] = wibox_bottom
wiboxes['top'] = wibox_top
-- }}}
