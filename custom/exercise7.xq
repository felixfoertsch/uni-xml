(: Question:

Return all sentences which contains a verb (@upos="VERB") in the Indicative Mood, Third Person (i.e., search for "Mood=Ind" and "Person=3" in @feats). Return the elements <s/> with all their children.

:)

let $doc := doc("../db/treebank_eng_2.xml")

for $t in $doc//s/t
where $t[@upos="VERB" and contains(@feats, "Mood=Ind") and contains(@feats, "Person=3")]

return
$t/..