(: Change all <head></head> elements to lower case :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

copy $copy := $doc
modify (
  for $item in $copy//*:head

  return
  replace node $item/text() with lower-case($item/text())
)
return $copy