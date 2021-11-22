-- master docs directive --

return function(text, output, comment)
  text = text:gsub("\n"..comment:gsub("%-", "%%%1"), "")
  return text
end
