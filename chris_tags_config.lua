--
-- Custom functions
--
require("beautiful")

function getTagsAbbr(tag_names)
   local ret = {}
   for idx = 1, #tag_names do
      ret[idx] = string.lower(string.sub(tag_names[idx], 1, 1))
   end
   return ret
end

function giveFocus(c)
   c.screen = mouse.screen -- dirty fix for strange screen changing behaviour
   client.focus = c
   c:raise()
end

function showNotification(title, msg)
   naughty.notify({ text = msg,
                    title = title,
                    fg = "#52ff00",
                    bg = "#000000",
                    ontop = false,
                    opacity=0.8,
                    timeout = 1
                 })
end

function tim_table_indexOf(table, item)
   table = table or {}
   for i = 1, #table do
      if string.find(string.lower(table[i]), item) then
         return i
      end
   end
   return 0
end

function tim_findTag(name)
   return tim_table_indexOf(tags.settings[mouse.screen].names, name)
end

-- Switch to tag
function timTagViewOnly(screen, tag)
   return function (c)
             if tags[screen][tag] then
                awful.tag.viewonly(tags[screen][tag])
             end
          end
end
-- Toggle tag view
function timTagViewToggle(screen, tag)
   return function (c)
             if tags[screen][tag] then
                awful.tag.viewtoggle(tags[screen][tag])
             end
          end
end
-- Move client to tag
function timMoveClientToTag(screen, tag)
   return function (c)
             if client.focus and tags[screen][tag] then
                awful.client.movetotag(tags[screen][tag])
             end
          end
end
-- Toggle tag for a client
function timToggleTag(screen, tag)
   return function (c)
             if client.focus and tags[screen][tag] then
                awful.client.toggletag(tags[screen][tag])
             end
          end
end

--
-- Table of layouts to cover with awful.layout.inc, order matters.
--

layoutCommon = {
   awful.layout.suit.floating,
   awful.layout.suit.magnifier,
   awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.tile.top,
   awful.layout.suit.fair,
   awful.layout.suit.fair.horizontal,
   awful.layout.suit.spiral,
   awful.layout.suit.spiral.dwindle,
   awful.layout.suit.max,
   awful.layout.suit.max.fullscreen
}

layouts = {
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.magnifier,
   awful.layout.suit.max.fullscreen,
   awful.layout.suit.max
}

-- {{{ My custom tags
--

-- For screen 1

-- tags_screen1 = {
--    "m", "c", "w", "o",
--    "b", "i", "f", "t"
-- }

tags_screen1 = {
   "Main", "Console", "WWW", "Other",
   "Browser", "IM", "Floating", "Temp"
}


layouts_screen1 = {
   layouts[2],  layouts[6],  layouts[1], layouts[1],
   layouts[1],  layouts[1],  layouts[1], layouts[1]
}

-- For screen 2

tags_screen2 = { "Main", "Read", "WWW", "Other" }

layouts_screen2 = {
   layouts[1], layouts[1], layouts[1], layouts[1]
}

--- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.

tags = {}

tags = {
   settings = {
      {
         names = tags_screen1,
         layout = layouts_screen1
      },
      {
         names = tags_screen2,
         layout = layouts_screen2
      }
   }
}

-- Create tags for all screens
-- -- Tag table for screen 1
-- tags[1] = awful.tag(tags.names, 1, tags.layout)
-- -- Tag table for screen 2
-- tags[2] = awful.tag(tags)

for s = 1, screen.count() do
   tags[s] = awful.tag(tags.settings[s].names,
                       s,
                       tags.settings[s].layout)
end

-- }}}

-- Key bindings
--
-- Modal mode for tags keybinding
--

modaltagkeys = {}

modaltagkeys = {
   -- Switch to tagw
   m = function(screen_num, c) timTagViewOnly(screen_num, 1)(c) end,
   c = function(screen_num, c) timTagViewOnly(screen_num, 2)(c) end,
   w = function(screen_num, c) timTagViewOnly(screen_num, 3)(c) end,
   o = function(screen_num, c) timTagViewOnly(screen_num, 4)(c) end,
   b = function(screen_num, c) timTagViewOnly(screen_num, 5)(c) end,
   i = function(screen_num, c) timTagViewOnly(screen_num, 6)(c) end,
   f = function(screen_num, c) timTagViewOnly(screen_num, 7)(c) end,
   t = function(screen_num, c) timTagViewOnly(screen_num, 8)(c) end,

   -- Toggle tags
   M = function(screen_num, c) timTagViewToggle(screen_num, 1)(c) end,
   C = function(screen_num, c) timTagViewToggle(screen_num, 2)(c) end,
   W = function(screen_num, c) timTagViewToggle(screen_num, 3)(c) end,
   O = function(screen_num, c) timTagViewToggle(screen_num, 4)(c) end,
   B = function(screen_num, c) timTagViewToggle(screen_num, 5)(c) end,
   I = function(screen_num, c) timTagViewToggle(screen_num, 6)(c) end,
   F = function(screen_num, c) timTagViewToggle(screen_num, 7)(c) end,
   T = function(screen_num, c) timTagViewToggle(screen_num, 8)(c) end
}

-- Bind all key numbers to tags.
--

globalkeys = globalkeys or { }

-- Bind the modal mode
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey, "Control" }, "space",
             -- {{{ Modal mode
             function (c)
                keygrabber.run(
                   function (mod, key, event)
                      if string.find(key, "Super") then
                         showNotification("Modal mode",
                                          "Waiting for the next key...")
                      end

                      if event == "release" then
                         return true
                      end

                      if not string.find(key, "Shift") then
                         keygrabber.stop()
                      end

                      if modaltagkeys[key] then
                         modaltagkeys[key](mouse.screen, c)
                      end
                      return true
                   end)
             end
             -- }}}
          )
)

for screen_idx = 1, screen.count() do
   local tag_names = getTagsAbbr(tags.settings[screen_idx].names)
   for i = 1, #tag_names do
      globalkeys = awful.util.table.join(
         globalkeys,
         -- View tag
         awful.key({ modkey, "Shift" }, tag_names[i],
                   timTagViewToggle(screen_idx, i)),
         -- Move to tag
         awful.key({ modkey, "Shift", "Mod1" }, tag_names[i],
                   timMoveClientToTag(screen_idx, i)),
         -- Toggle tag-name for the client
         awful.key({ modkey, "Shift", "Control", "Mod1" }, tag_names[i],
                   timToggleTag(screen_idx, i))
      )
   end
end

--
-- Client keys
--

clientkeys = clientkeys or {}
clientkeys = awful.util.table.join(
   -- Titlebar
   awful.key( { modkey }, ",",
              function (c)
                 if c.titlebar then
                    awful.titlebar.remove(c)
                    debug_notify(c.name .. "\ntitlebar " .. colored_off)
                 else
                    awful.titlebar.add(c, { altkey = "Mod1" })
                    debug_notify(c.name .. "\ntitlebar " .. colored_on)
                 end
              end),
   -- Fullscreen
   awful.key({ modkey           }, "f",
             function (c)
                c.screen = mouse.screen
                c.fullscreen = not c.fullscreen
             end),
   -- Kill
   awful.key({ modkey            }, "x",
             function (c) c:kill()                         end),
   -- Toggle floating
   awful.key({ modkey, "Control", "Mod1" }, "space",
             awful.client.floating.toggle                     ),
   -- Swap with masters
   awful.key({ modkey, "Shift"   }, "Return",
             function (c) c:swap(awful.client.getmaster()) end),
   -- Move to screen
   awful.key({ modkey,           }, "o",
             awful.client.movetoscreen                        ),
   -- Redraw client
   awful.key({ modkey, "Shift"   }, "r",
             function (c) c:redraw()                       end),
   -- Toggle minimize
   awful.key({ modkey,           }, "i",
             function (c) c.minimized = not c.minimized    end),
   -- Toggle maximize
   awful.key({ modkey,           }, "m",
             function (c)
                c.screen = mouse.screen
                c.maximized_horizontal = not c.maximized_horizontal
                c.maximized_vertical   = not c.maximized_vertical
             end),
   -- Bigger
   awful.key({ modkey, }, "End",
             function ()
                awful.client.moveresize(0, 0, 0, 20)
             end),
   -- Smaller
   awful.key({ modkey, }, "Home",
             function ()
                awful.client.moveresize(0, 0, 0, -20)
             end),
   --
   awful.key({ modkey, }, "Prior",
             function ()
                awful.client.moveresize(0, 0, -20, 0)
             end),
   --
   awful.key({ modkey, }, "Next",
             function ()
                awful.client.moveresize(0, 0, 20, 0)
             end),
   -- Increase transparency
   awful.key({ modkey, "Mod1", "Shift" }, "Down",
             function (c)
                if c.opacity >= 0.10 then
                   c.opacity = c.opacity - 0.10
                end
             end),
   -- Decrease transparency
   awful.key({ modkey, "Mod1", "Shift" }, "Up",
             function (c)
                if c.opacity <= 0.90 then
                   c.opacity = c.opacity + 0.10
                end
             end),
   -- Change transparency to an acceptable number
   awful.key({ modkey, "Mod1", "Shift" }, "Next",
             function (c)
                c.opacity = 0.70
             end),
   -- Restore opacity
   awful.key({ modkey, "Mod1", "Shift" }, "Prior",
             function (c)
                c.opacity = 1
             end),
   -- Minimize all clients
   awful.key({ modkey, }, "d",
             function ()
                local tag = awful.tag.selected()
                for i = 1, #tag:clients() do
                   tag:clients()[i].minimized = not tag:clients()[i].minimized
                   tag:clients()[i]:redraw()
                end
             end
          ),
   -- Centralize the focused client window
   awful.key({ modkey, "Control"          }, "End",
             function (c)
                local tmp = chris_centralize(c)
                c:geometry({ x = tmp.new_x, y = tmp.new_y,
                             width = tmp.new_width, height = tmp.new_height })
                giveFocus(c)
             end),
   awful.key({ modkey, "Control"          }, "t",
             function (c)
                local tmp = chris_halfmaxwidth(c)
                c:geometry({ x = tmp.new_x, y = tmp.new_y,
                             width = tmp.new_width, height = tmp.new_height })
                giveFocus(c)
             end),
   awful.key({ modkey, "Control"          }, "n",
             function (c)
                local tmp = chris_halfmaxheight(c)
                c:geometry({ x = tmp.new_x, y = tmp.new_y,
                             width = tmp.new_width, height = tmp.new_height })
                giveFocus(c)
             end),
   awful.key({ modkey, "Control"          }, "Left",
             function (c)
                local tmp = chris_leftfull(c)
                c:geometry({ x = tmp.new_x, y = tmp.new_y,
                             width = tmp.new_width, height = tmp.new_height })
                giveFocus(c)
             end),
   awful.key({ modkey, "Control"          }, "Right",
             function (c)
                local tmp = chris_rightfull(c)
                c:geometry({ x = tmp.new_x, y = tmp.new_y,
                             width = tmp.new_width, height = tmp.new_height })
                giveFocus(c)
             end)

)



-- {{{ Rules
--
-- Client keys are set here
--
awful.rules.rules = {
   -- All clients will match this rule.
   { rule = { },
     properties = { border_width = beautiful.border_width,
                    border_color = beautiful.border_normal,
                    focus = true,
                    keys = clientkeys,
                    buttons = clientbuttons } },
   { rule = { class = "MPlayer" },
     properties = { floating = true } },
   { rule = { class = "VolWheel" },
     properties = { floating = true } },
   { rule = { class = "pinentry" },
     properties = { floating = true } },
   { rule = { class = "Gimp" },
     properties = { floating = true,
                    tag = tags[mouse.screen][tim_findTag("f")] } },
   { rule = { class = "Xsane" },
     properties = { floating = true } },
   { rule = { class = "Inferno" },
     properties = { floating = true } },
   { rule = { class = "Cinelerra" },
     properties = { floating = true,
                    tag = tags[mouse.screen][tim_findTag("f")] } },
   -- { rule = { class = "Audacity" },
   --   properties = { floating = true,
   --                  tag = tags[mouse.screen][5] } },
   { rule = { class = "Office" },
     properties = { floating = true,
                    tag = tags[mouse.screen][tim_findTag("o")] } },
   { rule = { class = "gmrun" },
     properties = { floating = true } },
   -- Set Firefox to always map on tags number 2 of screen 1.
   { rule = { class = "Firefox" },
     properties = { tag = tags[mouse.screen][tim_findTag("w")] } },
   { rule = { class = "Chrome" },
     properties = { tag = tags[mouse.screen][tim_findTag("w")] } },
   { rule = { class = "Seamonkey" },
   --   properties = { tag = tags[mouse.screen][tim_findTag("w")] } },
   -- { rule = { class = "Flock" },
     properties = { tag = tags[mouse.screen][tim_findTag("w")] } },
   { rule = { class = "Pidgin" },
     properties = { tag = tags[mouse.screen][tim_findTag("i")] } },
   { rule = { class = "Empathy" },
     properties = { tag = tags[mouse.screen][tim_findTag("i")] } },
   { rule = { class = "Skype" },
     properties = { tag = tags[mouse.screen][tim_findTag("i")] } },
   -- { rule = { class = "Nautilus" },
   --   properties = { tag = tags[mouse.screen][tim_findTag("b")] } },
   { rule = { class = "emelFM2" },
     properties = { tag = tags[mouse.screen][tim_findTag("b")] } }
}
-- }}}
