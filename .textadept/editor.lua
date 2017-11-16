local _M = {}
local _view_mapping = {}

function _M.delete_indentation()
  
end

local function split_window(v, vertical)
  o, n = view.split(v, vertical)
  _view_mapping[o] = n
  _view_mapping[n] = o
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