(: fetch:xml("mytreebank.xml") :)
(: Klausur Frage: Gib alles wieder, was das wort Work enthält :)
for $s in doc("mytreebank.xml")//sentence
let $t := $s/token[@lemma = "work" and @UPOS="NOUN"]
where $t
return 
(: $s/sent_id :)

<result id="{$s/sent_id}">
{
$s/text/data(.)
}
</result>