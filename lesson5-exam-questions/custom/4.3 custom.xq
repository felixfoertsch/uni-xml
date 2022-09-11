(: Return only the text of all sections :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

for $p in $doc//*:p
where $p/parent::*[@subtype="section"]

return $p/text()