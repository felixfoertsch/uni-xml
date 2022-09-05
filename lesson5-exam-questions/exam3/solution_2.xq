copy $doc := doc("phi0448.phi001.perseus-lat2.xml")
modify 
(
  for $p in  $doc//*:body//*:p
  return
  replace node $p with upper-case($p)
)
return
$doc