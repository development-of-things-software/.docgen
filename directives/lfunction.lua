-- Lua function directive --

local pattern = "@([^ ]+) (%b{})"

local colors = {}

return function(text, render, comment)
  local funcsig = ""
  text = text:gsub(pattern, function(dir, arg)
    arg = arg:sub(3, -3)
    if dir == "lfname" then
      funcsig = arg .. "("
      return ""
    elseif dir == "lfarg" then
      local atype, aname, adesc = arg:match("([^ ]+) ([^ ]+) (.+)")
      if not (atype and aname and adesc) then
        error("bad lfarg: " .. arg)
      end
      if colors[atype] and render.color then
        atype = render.color(atype, colors[atype])
      end
      local aspec = string.format("%s:%s", aname, atype)
      if render.mouseOver then
        funcsig = funcsig .. render.mouseOver(aspec, adesc)
      end
    elseif dir == "lfdesc" then
      return arg
    else
      return string.format("@%s { %s }", dir, arg)
    end
  end)
  return string.format("@monospace { %s) } %s", funcsig, text)
end
