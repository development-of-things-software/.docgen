-- markdown --

return {
  header = function(text, level)
    return ("#"):rep(level) .. text
  end,
  bold = function(text)
    return "**" .. text .. "**"
  end,
  italic = function(text)
    return "_" .. text .. "_"
  end,
  color = function(text)
    return text
  end,
  code = function(text, lang)
    return "\n```" .. lang .. "\n" .. text .. "\n" .. "```" .. "\n"
  end,
  monospace = function(text)
    return "`" .. text .. "`"
  end,
  resized = function(text, size)
    return text
  end
}