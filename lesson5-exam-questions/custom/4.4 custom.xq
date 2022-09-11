(: Transform the text of all odd sections to upper-case and all even sections to lower-case :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

copy $copy := $doc
modify (
  for $p in $copy//*:body//*:p
  let $section-number := $p/../@n
  
  return
  replace node $p with 
  if ($p[$section-number mod 2 = 0]) then
    lower-case($p)
  else
    upper-case($p)
)
return $copy