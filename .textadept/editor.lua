local _M = {}

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