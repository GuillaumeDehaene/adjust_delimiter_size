local lefts = {
  {"%(", "("},
  {"%[", "["},
  {"\\%{", "\\{"},
  {"\\langle", "\\langle"},
  {"\\lceil", "\\lceil"},
  {"\\lfloor", "\\lfloor"},
  {"\\llbracket", "\\llbracket"},
}
local rights = {
  {"%)", ")"},
  {"%]", "]"},
  {"\\%}", "\\}"},
  {"\\rangle", "\\rangle"},
  {"\\rceil", "\\rceil"},
  {"\\rfloor", "\\rfloor"},
  {"\\rrbracket", "\\rrbracket"},
}

-- Process math strings to add \left \right instructions to delimiters
-- This makes the source code cleaner
-- and the output more beautiful
function adjust_delimiter_size(el)
  local content = el.text
  for _, left_pair in ipairs(lefts) do
    content = string.gsub(content, left_pair[1],"\\mathopen{}\\left" .. left_pair[2])
  end
  for _, right_pair in ipairs(rights) do
    content = string.gsub(content, right_pair[1],"\\right" .. right_pair[2] .."\\mathclose{}")
  end
  local count = 0
  for _ in string.gmatch(content, "\\left") do
    count = count + 1
  end
  for _ in string.gmatch(content, "\\right") do
    count = count - 1
  end
  if count > 0 then
    content = "\\text{ [adjust delimiter size extension] Latex error: too many left commands. }"
  end
  if count < 0 then
    content = "\\text{ [adjust delimiter size extension] Latex error: too many right commands. }"
  end
  el.text = content
  return el
end

return {
  { Math = adjust_delimiter_size }
}