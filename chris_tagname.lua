home = os.getenv("HOME")
confdir = home .. "/.config/awesome/images/icons"

-- Table of layouts
layouts = {
   awful.layout.suit.max,
   awful.layout.suit.floating,
   awful.layout.suit.tile.bottom
}

for s = 1, screen.count() do
   tags = {
      names  = { "", "", "", "", "", "", "", ""},
      layout = { }
      }
   tags[s] = awful.tag(tags.names, s)
  
    awful.tag.seticon(confdir .. "/green/arch_10x10.png", tags[s][1])
    awful.tag.seticon(confdir .. "/cyan/cat.png", tags[s][2])
    awful.tag.seticon(confdir .. "/red/fox.png", tags[s][3])
    awful.tag.seticon(confdir .. "/blue/mail.png", tags[s][4])
    awful.tag.seticon(confdir .. "/yellow/phones.png", tags[s][5])
    awful.tag.seticon(confdir .. "/magenta/diskette.png", tags[s][6])
    awful.tag.seticon(confdir .. "/green/pacman.png", tags[s][7])
    awful.tag.seticon(confdir .. "/green/note.png", tags[s][8])
--   icon5 = awful.tag.geticon(tags[s][6])
--   awful.tag.seticon(icon5, tags[s][1])
end
