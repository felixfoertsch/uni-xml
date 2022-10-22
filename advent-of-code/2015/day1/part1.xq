sum(
  let $doc := fetch:text("input.txt")
  let $cp := string-to-codepoints($doc)
  
  for $item in $cp
  let $bracket := codepoints-to-string($item)
  
  return
  if (matches($bracket, "\(")) then 1
  else -1
)