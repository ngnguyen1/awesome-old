local rd = require("rodentbane")
--rd.bind_default()
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey, "Control" }, "r", rd.start)
)
