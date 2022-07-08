for $s in doc("lab_2022-05-13_treebank.xml")/treebank/sentence
let $t := $s/line/token[@lemma=("work","go") and @UPOS="NOUN"] (:tupel als vergleich ist logisches oder:)
where $t (: where --> == True, also wo lemma=work und UPOS=Noun:)
return
$s/text
(:$s/sent_id:)

(:
<result id="{$s/sent_id}">
{
  $s/text/data(.)
}
</result>
}
:)