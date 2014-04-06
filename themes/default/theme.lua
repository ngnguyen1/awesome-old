---------------------------
-- Default awesome theme --
---------------------------

green = "#7fb219"
cyan  = "#7f4de6"
red   = "#e04613"
lblue = "#6c9eab"
dblue = "#00ccff"
black = "#3f3f3f"
lgrey = "#d2d2d2"
dgrey = "#333333"
white = "#ffffff"

theme = {}
theme.confdir = awful.util.getdir("config")

theme.font          = "Monaco 8"

theme.bg_normal     = "#3f3f3f"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#222222"

theme.fg_normal     = "#ffffff"
theme.fg_focus      = "#00FF00"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"


-- theme.font                                  = "sans 8"
-- theme.fg_normal                             = "#DCDCCC"
-- theme.fg_focus                              = "#F0DFAF"
-- theme.fg_urgent                             = "#CC9393"
-- theme.bg_normal                             = "#3F3F3F"
-- theme.bg_focus                              = "#000000"
-- theme.bg_urgent                             = "#3F3F3F"
-- theme.border_width                          = "0"
-- theme.border_normal                         = "#3F3F3F"
-- theme.border_focus                          = "#6F6F6F"
-- theme.border_marked                         = "#CC9393"
-- theme.titlebar_bg_focus                     = "#3F3F3F"
-- theme.titlebar_bg_normal                    = "#3F3F3F"
-- theme.binclock_bg                           = "#3F3F3F"
-- theme.binclock_fga                          = "#9FBC00"
-- theme.binclock_fgi                          = "#242424"
-- -- theme.taglist_bg_focus                      = black 
-- theme.taglist_fg_focus                      = "#0FFF00"
-- theme.tasklist_bg_focus                     = black
-- theme.tasklist_fg_focus                     = dblue
-- theme.textbox_widget_as_label_font_color    = white 
-- theme.textbox_widget_margin_top             = 1
-- theme.text_font_color_1                     = green
-- theme.text_font_color_2                     = dblue
-- theme.text_font_color_3                     = white
-- theme.notify_font_color_1                   = green
-- theme.notify_font_color_2                   = dblue
-- theme.notify_font_color_3                   = black
-- theme.notify_font_color_4                   = white
-- theme.notify_font                           = "Monaco 7"
-- theme.notify_fg                             = theme.fg_normal
-- theme.notify_bg                             = theme.bg_normal
-- theme.notify_border                         = theme.border_focus
-- theme.awful_widget_bckgrd_color             = dgrey
-- theme.awful_widget_border_color             = dgrey
-- theme.awful_widget_color                    = dblue
-- theme.awful_widget_gradien_color_1          = orange
-- theme.awful_widget_gradien_color_2          = orange
-- theme.awful_widget_gradien_color_3          = orange
-- theme.awful_widget_height                   = 14
-- theme.awful_widget_margin_top               = 2

-- theme.titlebar_bg_normal = "#3f3f3f"
-- theme.titlebar_bg_focus = "#3f3f3f"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.confdir .. "/images/icons/next.png"
theme.menu_height = "15"
theme.menu_width  = "130"
theme.menu_bg_normal="#282828"
theme.menu_fg_focus = "#00ff00"
--
-- separator icon
--
theme.arrl = theme.confdir .. "/images/icons/arrl.png"
theme.arrl_dl = theme.confdir .. "/images/icons/arrl_dl.png"
theme.arrl_ld = theme.confdir .. "/images/icons/arrl_ld.png"
theme.arrl_dfl = theme.confdir .. "/images/icons/arrl_ld_sf.png"
theme.arrl_lfd = theme.confdir .. "/images/icons/arrl_sf.png"


--
--
--



theme.bat = theme.confdir .. "/images/icons/red/bat_full_01.png"
theme.vol = theme.confdir .. "/images/icons/vol.png"
theme.mem = theme.confdir .. "/images/icons/red/mem.png"
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg /home/chris/Pictures/hi.jpg" }
--theme.wallpaper_cmd = {"awsetbg /home/chris/.config/awesome/images/backgrounds/direc.jpg"}
--theme.wallpaper_cmd = {"awsetbg /home/chris/.config/awesome/images/backgrounds/wallpaper.jpg"}
--theme.wallpaper_cmd = {"awsetbg /home/chris.config/awesome/images/backgrounds/1.png"}

-- -- You can use your own layout icons like this:

theme.layout_tile       = theme.confdir .. "/themes/default/layouts/tile.png"
theme.layout_tileleft   = theme.confdir .. "/themes/default/layouts/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/themes/default/layouts/tilebottom.png"
theme.layout_tiletop    = theme.confdir .. "/themes/default/layouts/tiletop.png"
theme.layout_fairv      = theme.confdir .. "/themes/default/layouts/fairv.png"
theme.layout_fairh      = theme.confdir .. "/themes/default/layouts/fairh.png"
theme.layout_spiral     = theme.confdir .. "/themes/default/layouts/spiral.png"
theme.layout_dwindle    = theme.confdir .. "/themes/default/layouts/dwindle.png"
theme.layout_max        = theme.confdir .. "/themes/default/layouts/max.png"
theme.layout_fullscreen = theme.confdir .. "/themes/default/layouts/fullscreen.png"
theme.layout_magnifier  = theme.confdir .. "/themes/default/layouts/magnifier.png"
theme.layout_floating   = theme.confdir .. "/themes/default/layouts/floating_a.png"


theme.awesome_icon = "/home/chris/.config/awesome/images/awesome-icon.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
