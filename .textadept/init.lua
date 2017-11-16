events.connect(events.INITIALIZED, function() 
  textadept.menu.menubar = nil 
end)

utils = require 'utils'
mykeys = require './keys'
utils.update_table(keys, mykeys)

io.quick_open_max = 100000


-- Theming
buffer.caret_width = 2
if CURSES then
else
  ui.set_theme('light', {font = 'Hack', fontsize = 12})
end