myutils = require 'utils'
mykeys = require './keys'
myeditor = require './editor'
myutils.update_table(keys, mykeys)

io.quick_open_max = 100000


-- Theming
buffer.caret_width = 2
if CURSES then
else
  ui.set_theme('light', {font = 'Hack', fontsize = 12})
end

events.connect(events.INITIALIZED, function() 
  myeditor.hide_menu_bar()
end)