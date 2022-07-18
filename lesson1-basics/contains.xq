(: Question:

Get all paragraphs that conatin the prefix "Caesar" (Caesar, Caesarem, Caesari, ...).

contains()

:)

let $doc:= doc("../db/phi0448.phi001.perseus-lat2.xml")

for $item in $doc//p[contains(.,"Caesar")]

return $item
