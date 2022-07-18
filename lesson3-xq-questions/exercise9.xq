(: Question:

Return all sentences which contains a verb (@upos="VERB") in the Indicative Mood, Third Person (i.e., search for "Mood=Ind" and "Person=3" in @feats). Return the elements <s/> with all their children. For example

:)

let $doc := doc("../db/treebank_eng_2.xml")


for $word in $doc//token
where
contains ($word/@FEATS, "Mood=Ind") and
contains ($word/@FEATS, "Person=3") and 
$word[@UPOS="VERB"]
return $word/..

(: `$word/..` kann auch als return `$word/parent::sentence` ausgewiesen werden :)

(: @UPOS="VERB" :)

(: Attributes are filters

let $doc := fetch:xml("https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml")
for $word in $doc//token[
  contains(@FEATS, "Mood=Ind") and
  contains(@FEATS, "Person=3")
return $word/..

:)