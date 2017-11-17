local _M = {}
_M._VERSION = '0.2'

local textredux = require 'textredux'
local file_browser = require 'file_browser'
local utils = require './utils'
local editor = require './editor'
local ut = utils.update_table

_M.CLEAR = 'cg'

-- Selection
_M['cx'] = ut(_M['cx'], {
  a = buffer.select_all,
  h = buffer.select_all
})
_M['cah'] = textadept.editing.select_paragraph

-- Movement
_M['cn'] = buffer.line_down
_M['cp'] = buffer.line_up
_M['cv'] = buffer.page_down
_M['cf'] = buffer.char_right
_M['cb'] = buffer.char_left
_M['ca'] = buffer.vc_home
_M['ce'] = buffer.line_end
_M['af'] = buffer.word_right
_M['ab'] = buffer.word_left
_M['av'] = buffer.page_up
_M['a<'] = buffer.document_start
_M['a>'] = buffer.document_end
_M['a{'] = buffer.para_up
_M['a}'] = buffer.para_down
_M['cl'] = buffer.vertical_centre_caret

-- Navigation
_M['ag'] = ut(_M['ag'], {
  g = textadept.editing.goto_line,
  ag = textadept.editing.goto_line
})

-- Deletion
local function delete_right()
  buffer.char_right()
  buffer.delete_back()
end

_M['cd'] = delete_right
_M['a\b'] = buffer.del_word_left
_M['ad'] = buffer.del_word_right
_M['ck'] = buffer.del_line_right
_M['cK'] = buffer.del_line_left
_M['cs\b'] = buffer.line_delete

-- Cut, copy and paste
_M['cw'] = buffer.cut
_M['aw'] = buffer.copy
_M['cy'] = buffer.paste

-- Others
_M['a^'] = editor.delete_indentation
_M['cO'] = editor.open_line
_M['cx'] = ut(_M['cx'], {
  ct = buffer.line_transpose
})

-- Search
_M['cs'] = ui.find.find_incremental
_M['as'] = ut(_M['as'], {
  ['.'] = textadept.editing.highlight_word
})

-- History
_M['c/'] = buffer.undo
_M['c?'] = buffer.redo

-- View and buffer
_M['cx'] = ut(_M['cx'], {
  ['0'] = editor.delete_window,
  ['2'] = editor.split_window_below,
  ['3'] = editor.split_window_right,  -- vertically
  b = ui.switch_buffer,
  k = io.close_buffer,
  o = function() ui.goto_view(1) end,
  N = buffer.new,
  cf = io.open_file,
  cs = io.save_file,
  cw = io.save_file_as,
  cc = quit
})
_M['cc'] = ut(_M['cc'], {
  p = {
    h = io.quick_open
  }
})

-- Lua
_M['a:'] = ui.command_entry.focus

-- Others
_M['ax'] = textadept.menu.select_command
_M['cP'] = textadept.menu.select_command

_M['am'] = ut(_M['am'], {
  f = {
    e = {
      d = function() io.open_file(_USERHOME.."/init.lua") end
    },
    t = file_browser.init
  }
})
_M['am'] = ut(_M['am'], {
  T = {
    m = editor.toggle_menu_bar
  }
})
-- Playground
_M['at'] = function()
  ui.dialogs.optionselect{title="SDF",text="GGG",items={"A", "B"}}
end


return _M