require("beautiful")

local homeImg = "/home/chris/Pictures/icons/"

TerminalMenu = {
	{"Rxvt-unicode", terminal},
	{"Xterm", "xterm", }
}

EditorMenu = {
   {"Emacs (Root)", "/usr/bin/gksu emacs"},
   {"Emacs", "/home/chris/.bin/emacs24", homeImg .. "emacs.png"},
   {"Gvim (Root)", "/usr/bin/gksu gvim"},
   {"Gvim", "/usr/bin/gvim", homeImg .. "gvim.png"}
}

File_manager = {
   {"Krusader", "/usr/bin/krusader"}
}

BrowserMenu = {
	{"Nightly", "/usr/bin/firefox", homeImg .. "firefox.png"},
	{"Chrome", "/usr/bin/chromium", homeImg .. "chromium.png"}
}

OfficeMenu = {
   {"Libreoffice", "/usr/bin/libreoffice"},
   {"Okular", "/usr/bin/okular", homeImg .. "okular.png"}
}

NetworkTool = {
   {"Analyzer Tool", "wireshark"}
}

myawesomemenu = {
	{"Manual", terminal .. "-e man awesome"},
	{"Edit Config", editor_cmd .. " " .. awesome.conffile},
	{"Restart", awesome.restart},
	{"Quit", awesome.quit}
}

mymainmenu = awful.menu({ items = {
				{"awesome", myawesomemenu, beautiful.awesome_icon},
				{"Editor", EditorMenu, homeImg .. "editor.png"},
                {"File Manager", File_manager },
                {"Office", OfficeMenu, homeImg .. "libreoffice-main.png"},
				{"Browser", BrowserMenu, homeImg .. "browser.png"},
                {"Terminal", TerminalMenu, homeImg .. "terminal.png"},
                {"Networking", NetworkTool},
                {"Log out", '/home/chris/.bin/shutdown', homeImg .. "logout.png"}
			}
		})

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
					menu = mymainmenu})

globalkeys = globalkeys or {}

globalkeys = awful.util.table.join(
   globalkeys,
   -- Invoke menu
   awful.key({ modkey,           }, "Menu",
             function () mymainmenu:show(true)        end),
   awful.key({ modkey,           }, "w",
             function () mymainmenu:show(true)        end)
)
