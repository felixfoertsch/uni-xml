let $doc:= file:read-text(
  "db/MSCONS/MSCONS_TL_9903151000005_D01-BIPORT_20171214_300021507814.txt"
)

return 
element MSCONS {
  let $component-separator := ":"
  let $element-separator := "\+"
  let $decimal-mark := "."
  let $release-character := "?"
  let $reserved-character := " "
  let $segment-terminator := "'"
  
  let $segments := tokenize($doc, $segment-terminator)[. != ""]
  
  for $segment in $segments
  let $elements:= tokenize($segment, $element-separator)[. != ""]

  return 
  element { $elements[1] } {
    for $element in ($elements, "")[. != ""]
    
    let $components := tokenize($element, $component-separator)
    
    return
    if ($element != $elements[1]) then 
      for $component in $components
      return
      element data { $component[1] }
  }
}