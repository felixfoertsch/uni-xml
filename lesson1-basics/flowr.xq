(: Question:

Get all verbs where @feats contains "Mood=Ind" and "Person=3" and output their lemma.


:)

let $doc := doc('../db/treebank_eng_2.xml')

for $t in $doc//t

where
contains ($t/@feats, "Mood=Ind") and
contains ($t/@feats, "Person=3")

let $out:= data($t/@lemma)

return $out