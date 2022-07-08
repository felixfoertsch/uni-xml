let $doc:= doc("phi0448.phi001.perseus-lat2.xml")

for $item in $doc//div[@subtype="section"][contains(., "Caesar")]

return
<result mysection="{ $item/@n }">
  { $item }  
</result>