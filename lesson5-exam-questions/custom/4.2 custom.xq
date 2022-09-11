(: remove all <p></p> elements, but keep their text in place :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

copy $copy := $doc
modify (
  for $p in $copy//*:p
  
  return
  replace node $p with $p/text()
)
return $copy