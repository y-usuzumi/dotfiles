events.connect(events.INITIALIZED, function() 
  textadept.menu.menubar = nil 
end) 

-- clear
keys.CLEAR = 'cg'

keys['cn'] = buffer.line_down
keys['cp'] = buffer.line_up
keys['cf'] = buffer.char_right
keys['cb'] = buffer.char_left
keys['cv'] = buffer._down
keys['ca'] = buffer.vc_home
keys['ce'] = buffer.line_end
keys['ck'] = buffer.del_line_right
keys['cK'] = buffer.del_line_left
keys['af'] = buffer.word_right
keys['ab'] = buffer.word_left
keys['ad'] = buffer.delete_word_right
keys['av'] = buffer.page_up
keys['a\b'] = buffer.delete_word_left
keys["a<"] = buffer.document_start
keys["a>"] = buffer.document_end
keys['a{'] = buffer.para_up
keys['a}'] = buffer.para_down

keys['cw'] = buffer.cut
keys['aw'] = buffer.copy
keys['cy'] = buffer.paste

keys['c/'] = buffer.undo
keys['c?'] = buffer.redo

keys['cx'] = {
  ['0'] = function() view.unsplit(_G.view) end,
  ['2'] = function() view.split(_G.view) end,
  ['3'] = function() view.split(_G.view, true) end,  -- vertically
  a = buffer.select_all,
  b = ui.switch_buffer,
  h = buffer.select_all,
  k = io.close_buffer,
  o = function() ui.goto_view(1) end,
  N = buffer.new,
  cf = io.open_file,
  cs = io.save_file,
  cw = io.save_file_as,
  cc = quit
}

keys['ax'] = textadept.menu.select_command
keys['cP'] = textadept.menu.select_command

-- search
keys['cs'] = ui.find.focus

keys['am'] = {
  f = {
    e = {
      d = function() io.open_file(_USERHOME.."/init.lua") end
    }
  }
}

keys['cah'] = textadept.editing.select_paragraph

keys['a:'] = ui.command_entry.focus

-- Theming
if CURSES then
else
  ui.set_theme('light', {font = 'Hack', fontsize = 12})
end