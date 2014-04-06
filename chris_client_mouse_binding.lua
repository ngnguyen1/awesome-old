--
--- Mouse binding for client
--
clientbuttons = awful.util.table.join(
   -- Forcus and raise
   awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
   awful.button({ modkey }, 1, awful.mouse.client.move),
   awful.button({ modkey }, 3, awful.mouse.client.resize),
   awful.button({ modkey }, 2, function(c) c:kill() end)
)
