myutils = require 'utils'
mykeys = require './keys'
myeditor = require './editor'
myutils.update_table(keys, mykeys)

io.quick_open_max = 100000


-- Theming
if CURSES then
else
  ui.set_theme('light', {font = 'Hack', fontsize = 12})
end

events.connect(events.INITIALIZED, function() 
  myeditor.hide_menu_bar()
end)

events.connect(events.BUFFER_NEW, function()
  buffer.caret_width = 2
  buffer.end_at_last_line = false
end)