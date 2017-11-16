local _M = {}
_M._VERSION = '0.1'

function _M.update_table(t1, t2)
  t1 = t1 or {}
  for i, v in pairs(t2) do
    if type(t1[i]) == 'table' then
      _M.update_table(t1[i], t2[i] or {})
    else
      t1[i] = t2[i]
    end
  end
  return t1
end

return _M