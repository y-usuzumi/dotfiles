local _M = {}
local menubar
local menubar_hidden = false

function _M.hide_menu_bar()
  if menubar_hidden then
    return
  else
    menubar_hidden = true
    menubar = textadept.menu.menubar
    textadept.menu.menubar = nil
  end
end

function _M.show_menu_bar()
  if menubar_hidden then
    menubar_hidden = false
    textadept.menu.menubar = menubar
  else
  end
end

function _M.toggle_menu_bar()
  if menubar_hidden then
    _M.show_menu_bar()
  else
    _M.hide_menu_bar()
  end
end

function _M.delete_indentation()
  
end

local function split_window(v, vertical)
  o, n = view.split(v, vertical)
end

function _M.split_window_below()
  return split_window(_G.view)
end

function _M.split_window_right()
  return split_window(_G.view, true)
end

function _M.delete_window()
  view.unsplit(_G.view)
end

return _M