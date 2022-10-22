let $doc:= doc("phi0448.phi001.perseus-lat2.xml")

for $item in $doc//div[@subtype="book"]

where $item[contains(., "Gallos")]

return
<result>
{ $item }
</result>
