(:
Transform the phi0448.phi001.perseus-lat2.xml so that the text inside the <body> element is capitalized, as shown in result_2.xml.
:)
declare option output:indent 'yes';

copy $doc := doc("phi0448.phi001.perseus-lat2.xml")
modify
(
  for $p in  $doc//*:body//*:p
  return
  replace node $p with upper-case($p)
)
return
$doc